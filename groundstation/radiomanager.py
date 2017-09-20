# -*- coding: utf-8 -*-
import pyric
import pyric.pyw as pyw
import yaml
import pprint
import argparse
import gfiwscan
from time import sleep
from multiprocessing import Process

cardprocesslist=[]

def interface_handler(interface_name):
    newhandler = gfiwscan.IWScanner(iface_name=interface_name)
    while True:
        sleep(0.1)
        newhandler.scan()




def main():
    interface_name_list = []
    config_file = "/opt/geofrenzy/etc/gfiwscan.yaml"
    parser = argparse.ArgumentParser()
#    parser.add_argument("wireless_interface")
    args = parser.parse_args()
    with open(config_file, 'r') as f:
        doc = yaml.load(f)
    ignorelist = doc['ignore']
    pprint.pprint(pyw.winterfaces())
    for winterface in pyw.winterfaces():
	print winterface
        dev_dict = pyw.devinfo(winterface)
        if dev_dict["mac"] in ignorelist:
            print "ignoring " + winterface + " with mac " + dev_dict["mac"]
        else: 
            interface_name_list.append(winterface)
    for interface_name in interface_name_list:
        p = Process(target=interface_handler, args=(interface_name, ))
        p.start()
        cardprocesslist.append(p)
    pprint.pprint(cardprocesslist)
#    scan_instance = IWScanner(iface_name=args.wireless_interface)
#    while True:
#        time.sleep(0.5)
#        scan_instance.scan()

if __name__ == "__main__":
    main()
