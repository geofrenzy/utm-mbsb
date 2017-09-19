# -*- coding: utf-8 -*-
import argparse
from struct import *


def create_beacon_string(ouitype, msg):
    global beacon_count
    tag_number = 221
    oui1 = 0x11
    oui2 = 0x22
    oui3 = 0x33
    data = bytes(msg)
    length = len(data)
    lengthstring = "6B%ds" % length
    print lengthstring
    hbeacon1 = pack(lengthstring, tag_number, length + 4, oui1, oui2, oui3,
            ouitype, data)
    return hbeacon1


def hexify_beacon(beacon_string):
    hex_string = ''.join(x.encode('hex') for x in beacon_string)
    return hex_string


def create_beacon_hex(ouitype, msg):
    beacon_string = create_beacon_string(ouitype, msg)
    hex_string = hexify_beacon(beacon_string)
    return hex_string


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("oui_type", type=int)
    parser.add_argument("beacon_string")
    args = parser.parse_args()
    beacon_string = create_beacon_string(args.oui_type, args.beacon_string)
    hex_string = create_beacon_hex(args.oui_type, args. beacon_string)
    print "beacon_string=", beacon_string
    print "beacon_hex=", hex_string

if __name__ == "__main__":
    main()
