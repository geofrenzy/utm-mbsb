#!/usr/bin/env python

from collections import namedtuple
from pprint import pprint
import pyric.pyw as pyw
from scapy.all import *
import sys


SSIDWithChannel = namedtuple('SSIDWithChannel', ['ssid', 'channel'], verbose=False)

class SSIDScanner(object):
    """a class to report channels for specific SSIDs"""

    def __init__(self, **kargs):
        self.channel_scan_count = 5
        self.channels = [1, 6, 11]
        self.timeout = 3
        self.iface_name = None
        self.ap_dict = {}
        self.__dict__.update(kargs)
        self.iface = pyw.getcard(self.iface_name)

    def packet_handler(self, pkt):
        print '\n%s\n' % ('=' * 80)
        # pprint(pkt)
        if pkt.haslayer(Dot11):
            if pkt.type == 0 and pkt.subtype == 8:
                ssid = None
                dot11elt = pkt.getlayer(Dot11Elt)
                while dot11elt:
                    if dot11elt.ID == 0:
                        ssid = dot11elt.info
                        if ssid:
                            print 'SSID: %s' % str(ssid)
                    elif dot11elt.ID == 3:
                        channel = ord(dot11elt.info)
                        print 'channel: %s' % str(channel)
                        if ssid:
                            if ssid in self.ap_dict and self.ap_dict[ssid] != channel:
                                print '*** Channel change from %d to %d ***' % \
                                (self.ap_dict[ssid], channel)
                            self.ap_dict[ssid] = channel
                    dot11elt = dot11elt.payload.getlayer(Dot11Elt)
            print 'ap_dict:'
            pprint(self.ap_dict)

    def scan(self, ssid):
        channel_idx = 0
        while ssid not in self.ap_dict and channel_idx < len(self.channels):
            pyw.chset(self.iface, self.channels[channel_idx], None)
            sniff(iface=self.iface_name, prn=self.packet_handler,
                count=self.channel_scan_count, timeout=self.timeout)
            channel_idx += 1
        if ssid in self.ap_dict:
            return SSIDWithChannel(ssid, self.ap_dict[ssid])
        start_with_ssid = [s for s in self.ap_dict.keys() if s.startswith(ssid)]
        if len(start_with_ssid) > 0:
            return SSIDWithChannel(start_with_ssid[0], self.ap_dict[start_with_ssid[0]])
        return SSIDWithChannel(ssid, -1)

    def get_channel_for_ssid(self, ssid):
        return self.scan(ssid)

def main():
    target_ssid = 'Bebop2'
    if len(sys.argv) > 1:
        target_ssid = sys.argv[1]

    print 'target_ssid: %s' % target_ssid

    ssid_scanner = SSIDScanner(iface_name='mon11')
    target_ssid_with_channel = ssid_scanner.get_channel_for_ssid(target_ssid)
    print "target_ssid_with_channel: %s" % str(target_ssid_with_channel)
    if target_ssid_with_channel.channel > 0:
        print '%s channel: %d' % (target_ssid_with_channel.ssid, target_ssid_with_channel.channel)
    else:
        print 'SSID %s not found' % target_ssid

if __name__ == "__main__":
    main()
