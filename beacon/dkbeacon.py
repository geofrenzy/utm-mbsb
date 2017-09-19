from dronekit import connect
import time
import argparse
import pprint
import rospy
import copy
from gf_beacon.srv import *
import hostapd
import beaconencoder
import findap



class sample_beacon_data:

    def __init__(self, connect_string):
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

        vehicle = connect(connect_string, wait_ready=True)
        vehicle.add_attribute_listener('location.global_relative_frame',
                                        self.location_callback)
#        vehicle.add_attribute_listener('location.local_frame',
#                                         self.location_callback)
        vehicle.add_attribute_listener('groundspeed', self.location_callback)
        vehicle.add_attribute_listener('battery', self.location_callback)
        vehicle.add_attribute_listener('heading', self.location_callback)
        vehicle.add_attribute_listener('vehicle.mode.name',
                                         self.location_callback)

    def location_callback(self, vehicle, attr_name, value):
        if vehicle.mode == "GUIDED":
            self.beacon_dict["flying_state_on"] = True
            self.beacon_dict["return_to_home_state_on"] = False
            self.beacon_dict["forced_landing_state_on"] = False
        elif vehicle.mode == "RTL":
            self.beacon_dict["flying_state_on"] = False
            self.beacon_dict["return_to_home_state_on"] = True
            self.beacon_dict["forced_landing_state_on"] = False
        elif vehicle.mode == "LAND":
            self.beacon_dict["flying_state_on"] = False
            self.beacon_dict["return_to_home_state_on"] = False
            self.beacon_dict["forced_landing_state_on"] = True
        else:
            self.beacon_dict["flying_state_on"] = False
            self.beacon_dict["return_to_home_state_on"] = False
            self.beacon_dict["forced_landing_state_on"] = False

        if attr_name == "groundspeed":
            self.beacon_dict["speed_mph"] = float(value * 1.94384)
        if attr_name == "heading":
            self.beacon_dict["heading_deg"] = float(value)
        elif attr_name == "battery":
            vardict = vars(value)
            mylevel = float(vardict["level"])
            if mylevel < 0:
                mylevel = 0
            if mylevel > 100:
                mylevel = 100
            self.beacon_dict["battery_level"] = mylevel
        elif attr_name == "location.global_relative_frame":
            vardict = vars(value)
            self.beacon_dict["lng_deg"] = float(vardict["lon"])
            self.beacon_dict["lat_deg"] = float(vardict["lat"])
            self.beacon_dict["alt_agl_m"] = float(vardict["alt"])
        else:
            print attr_name, " : ", value
#self.beacon_dict["heading_deg"] = 90.0
#        pprint.pprint(self.beacon_dict)
# rosservice call gf_beacon_encoding 34.1 35.1 200.5 10.1 241.1 10.1 true false true
#lng_deg lat_deg alt_agl_m speed_mph heading_deg battery_level flying_state_on return_to_home_state_on forced_landing_state_on
        value_list = ["lng_deg", "lat_deg", "alt_agl_m", "speed_mph",
                         "heading_deg", "battery_level", "flying_state_on",
                         "return_to_home_state_on", "forced_landing_state_on"]
        if all(field in self.beacon_dict for field in value_list ):
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
                    print "encoded_beacon=", encoded.encoded
                else:

                    beaconstring = beaconencoder.create_beacon_hex(0, encoded.encoded)
                    pprint.pprint(encoded.encoded)
                    self.myap.set('vendor_elements', beaconstring)
                    pprint.pprint(self.myap.request("UPDATE_BEACON"))
#                    print "beaconstring=", beaconstring
#                    print "econded_beacon=", encoded.encoded


    def go(self):
        while 1 == 1:
            time.sleep(2)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--connect_string",
                        default="udp:127.0.0.1:14550")
    args = parser.parse_args()
    sampler=sample_beacon_data(args.connect_string)
    sampler.go()


if __name__ == "__main__":
    main()
