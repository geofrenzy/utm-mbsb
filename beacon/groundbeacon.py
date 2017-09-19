#!/usr/bin/python
#from dronekit import connect
import time
import argparse
import pprint
import rospy
import copy
from gf_beacon.srv import *
import hostapd
import beaconencoder
import findap
#from gps import *
import gpsd
import pprint
import logging
import threading


class sample_beacon_data:

    def __init__(self, connect_string):

        gpsd.connect()
        while True:
            gpsdo = gpsd.get_current()
            logging.debug("gps mode = %d", gpsdo.mode)
            if int(gpsdo.mode) == 3:
                print "init"
                self.missing_AP = False
                try:
                    AP_interface = findap.findap()
                    self.myap = hostapd.Hostapd(AP_interface)
                except:
                    print "AP missing will just print enceded beacon"
                    self.missing_AP = True
                self.encode_beacon = rospy.ServiceProxy('gf_beacon_encoding', gf_encoding)
                self.beacon_dict = {}
                self.previous_beacon_dict = {}
                self.beacon_dict["flying_state_on"] = False
                self.beacon_dict["return_to_home_state_on"] = False
                self.beacon_dict["forced_landing_state_on"] = False
                self.beacon_dict["lng_deg"] = gpsdo.lon
                self.beacon_dict["lat_deg"] = gpsdo.lat
                self.beacon_dict["alt_agl_m"] = gpsdo.alt
                self.beacon_dict["speed_mph"] = gpsdo.hspeed * 1.94
                self.beacon_dict["heading_deg"] = gpsdo.track
                self.beacon_dict["battery_level"] = 99.0
                if self.beacon_dict != self.previous_beacon_dict:

                    encoded = self.encode_beacon(
                                self.beacon_dict["lng_deg"],
                                self.beacon_dict["lat_deg"],
                                self.beacon_dict["alt_agl_m"],
                                self.beacon_dict["speed_mph"],
                                self.beacon_dict["heading_deg"],
                                self.beacon_dict["battery_level"],
                                self.beacon_dict["flying_state_on"],
                                self.beacon_dict["return_to_home_state_on"],
                                self.beacon_dict["forced_landing_state_on"]
                        )
                    self.previous_beacon_dict = copy.deepcopy(self.beacon_dict)
                    if self.missing_AP:
                        print "encoded_beacon=", encoded.encode
                    else:

                        beaconstring = beaconencoder.create_beacon_hex(0, encoded.encoded)
                        self.myap.set('vendor_elements', beaconstring)
                        pprint.pprint(self.myap.request("UPDATE_BEACON"))
                        print "beaconstring=", beaconstring
                        print "econded_beacon=", encoded.encoded
            time.sleep(.25)


def main():
    logging.basicConfig(filename="/var/log/groundbeacon.log",
                format='%(asctime)s %(message)s',
                level=logging.DEBUG)

    logging.info("info")
    logging.debug("debug")

    parser = argparse.ArgumentParser()
    parser.add_argument("--connect_string",
                        default="udp:127.0.0.1:14550")
    args = parser.parse_args()
    sampler = sample_beacon_data(args.connect_string)
    sampler.go()


if __name__ == "__main__":
    main()
