#!/usr/bin/env python

import pyric.pyw as pyw
from scapy.all import *
from pprint import pprint
#import scapy_ex
import struct
from collections import namedtuple
import paho.mqtt.client as mqtt

import yaml


def on_connect(client, userdata, flags, rc):
    print("Connected with result code " + str(rc))

def ConfigureInterface(macAddress,channel):
    """Returns a wireless card interface like this:
       Card(phy=0,dev=mon11,ifindex=4) (where mode=='monitor')
       or None
    """
    wiif = []
    ap_list = []
    monitorString = "mon" + str(channel)

    wilist = pyw.winterfaces()
    pprint(wilist)
    for interface in wilist:
        wicard = pyw.getcard(interface)
        if wicard.dev == monitorString and pyw.modeget(wicard) == 'monitor':
            return wicard
        wiif.append(pyw.getcard(interface))
    for winterface in wiif:
        winfo = pyw.ifinfo(winterface)
        pprint(winfo)
        driverinfo = pyw.ifinfo(winterface)['driver']
        mac = pyw.macget(winterface)
        if macAddress in mac:
            scanif = winterface
            pyw.down(scanif)
            m0 = pyw.devadd(scanif, monitorString, 'monitor')
            for iface in pyw.ifaces(scanif):
                if iface[0].dev != m0.dev:
                    print("deleting {0} in mode {1}".format(iface[0],iface[1]))
                    pyw.devdel(iface[0])
            pprint(m0)
            pyw.up(m0)
            pyw.chset(m0, channel, None)
            print "added monitor interface " + m0.dev
            return m0
    return None


def PacketHandler(pkt):
    global i
    #pprint(pkt)

    if pkt.haslayer(Dot11):
        if (pkt.type == 0 and pkt.subtype == 8) or (pkt.type == 0 and pkt.subtype == 5):
            # print
            # pkt.info,"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
         try:
            dot11elt = pkt.getlayer(Dot11Elt)
            while dot11elt:
                if dot11elt.ID == 221:
                    #dot11elt.show()
                    length = dot11elt.len - 4
                    lengthstring = "4B%ds" % length
                    PrivateInfo = namedtuple(
                        'PrivateInfo', 'oui1 oui2 oui3 ouitype data')
                    #pprint(PrivateInfo)
                    try:
                     privDict = PrivateInfo._asdict(PrivateInfo._make(
                        struct.unpack(lengthstring, dot11elt.info)))
                    except:
                       # print lengthstring
                       # dot11elt.show()
                       pass
                    #print "ouis=",privDict['oui1'],privDict['oui2'],privDict['oui3']
                # ('oui1', 17), ('oui2', 34), ('oui3', 51)
                    #pprint(privDict)
                    if (
                            privDict['oui1'] == 0x11 and
                            privDict['oui2'] == 0x22 and
                            privDict['oui3'] == 0x33):
                        data = privDict['data']
                        #pprint(data)
                        mqttc.publish("beacon/encoded", data)

                dot11elt = dot11elt.payload.getlayer(Dot11Elt)
         except:
                 print "Unexpected error:", sys.exc_info()[1]


with open('/usr/local/etc/80211beaconreceiver.yaml', 'r') as f:
    doc = yaml.load(f)
    channelDict = doc["channels"]

for each in channelDict:
    iface = ConfigureInterface(each,channelDict[each])

mqttc = mqtt.Client()
mqttc.connect("localhost")

mqttc.loop_start()

i = 0
sniff(iface=iface.dev, prn=PacketHandler, filter="type mgt subtype beacon or type mgt subtype proberesp", store=0)
