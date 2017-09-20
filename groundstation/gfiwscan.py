# -*- coding: utf-8 -*-
import logging
logging.basicConfig(filename="/var/log/gfiwscan/test.log",
        format='%(asctime)s %(message)s',
        level=logging.DEBUG)
import subprocess
import pprint
import json
import paho.mqtt.client as mqtt
import cStringIO
import time
import pyric
import pyric.pyw as pyw
import yaml
import argparse
import int2base



# /usr/local/bin/iwtojson dev wlan2 scan -u freq 2412 2462 2437


class IWScanner(object):
    """a class to report Geofrenzy beacons or probe responses"""

    def __init__(self, **kargs):
        self.gfiw_command = "/opt/geofrenzy/bin/gfiwscan"
        self.config_file = "/opt/geofrenzy/etc/gfiwscan.yaml"
        self.timeout = 3
        self.last_seen_limit = 5000
        self.iface_name = None
        self.__dict__.update(kargs)
        self.iface = pyw.getcard(self.iface_name)
        self.reset_interface(self.iface)
        self.iwcommand = []
        with open(self.config_file, 'r') as f:
            doc = yaml.load(f)
            channel_list = doc["channels"]
            self.iwcommand.append(self.gfiw_command)
            self.iwcommand.append("dev")
            self.iwcommand.append(self.iface_name)
            self.iwcommand.append("scan")
            self.iwcommand.append("-u")
            self.iwcommand.append("freq")
            for channel in channel_list:
                self.iwcommand.append(str(channel))
        self.client = mqtt.Client()
        self.client.on_connect = self.on_connect
        self.client.connect("127.0.0.1", 1883, 60)

    def reset_interface(self, interface):
            pyw.down(interface)
            if pyw.isblocked(interface):
                pyw.unblock(interface)
            pyw.up(interface)

    def on_connect(client, userdata, flags, rc):
        logging.info("Connected with result code %s ", str(rc))

    def process_stanza(self, stanza_dict):
        geofrenzy_dict = {}
        stringlist = ["Country", "Environment", "SSID", "capability",
             "interface"]
        integerlist = ["Power_constraint", "TSF_usec", "beacon_interval_TUs",
            "channel_end", "channel_first", "channel_max_power", "freq",
            "last_seen_ms"]
        floatlist = ["signal_dBm"]

        if "geofrenzy_ies" in stanza_dict:
            if (int(stanza_dict["last_seen_ms"]) < self.last_seen_limit):
                for string in stringlist:
                    try:
                        geofrenzy_dict[string] = stanza_dict[string]
                    except Exception as e:
                        logging.exception("dictionary string conversion failure")
                for myinteger in integerlist:
                    try:
                        geofrenzy_dict[myinteger] = int(stanza_dict[myinteger])
                    except Exception as e:
                        logging.exception("dictionary integer conversion failure")
                for myfloat in floatlist:
                    try:
                        geofrenzy_dict[myfloat] = float(stanza_dict[myfloat])
                    except:
                        logging.exception("dictionary float conversion failure")
                try:
                    bss_hex_string = stanza_dict["BSS"].replace(":", "")
                    bss_int = int(bss_hex_string, 16)
#                    bss_34 = int2base.int2base(bss_int, 34)
                    geofrenzy_dict["BSShex"] = bss_hex_string
                    geofrenzy_dict["BSSint"] = bss_int
                    geofrenzy_dict["BSS"] = int2base.int2base(bss_int & 0XFFFFFFFF, 34).upper()
                    geofrenzy_dict["BSSmasked"] = bss_int & 0xFFFFFFFF
                except Exception as e:
                    logging.exception("BSS conversion failure")
                try:
                    dsstring = stanza_dict["DS_Parameter_set"]
                    dslist = dsstring.split()
                    for pair in dslist:
                        pairlist = pair.split("=")
                        if "channel" in pairlist[0]:
                            geofrenzy_dict["channel"] = int(pairlist[1])
                except:
                    logging.exception("DS Parameter Set Error")
                try:
                    gfstring = stanza_dict["geofrenzy_ies"]
                    gflist = gfstring.split("|")
                    for gfpair in gflist:
                        pair = gfpair.split("=")
                        keyname = "gf_" + pair[0]
                        geofrenzy_dict[keyname] = pair[1]

                except:
                    logging.exception("GeoFrenzy IEs error")

                logging.debug("publishing beacon from %s",
                                geofrenzy_dict["BSShex"])
                geofrenzy_dict["sampled_interface"] = self.iface_name
            else:
                logging.info("beacon from %s last seen %d to stale - ignoring",
                            stanza_dict["SSID"],
                            int(stanza_dict["last_seen_ms"]))
                return
        else:
            logging.error("no goefrenzy ies on interface=%s", self.iface_name)
            return
        self.client.publish("geofrenzy/enhanced_beacon",json.dumps(geofrenzy_dict))

    def scan(self):
            try:
                scanresult = subprocess.check_output(self.iwcommand)
            except Exception as e:
                logging.exception("failed scan")
                return
            lines = cStringIO.StringIO(scanresult)
            for line in lines:
                if "start-bss-stanza" in line:
                    stanza_dict = {}
                elif "end-bss-stanza" in line:
                    self.process_stanza(stanza_dict)
                else:
                    fields = line.split(":", 1)
                    try:
                        stanza_dict[fields[0].strip()] = fields[1].strip()
                    except:
                        logging.exception()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("wireless_interface")
    args = parser.parse_args()
#    logging.basicConfig(filename="/var/log/gfiwscan/" + args.wireless_interface,

    logging.info("info")
    logging.debug("debug")
    scan_instance = IWScanner(iface_name=args.wireless_interface)
    while True:
        time.sleep(0.5)
        scan_instance.scan()

if __name__ == "__main__":
    main()
