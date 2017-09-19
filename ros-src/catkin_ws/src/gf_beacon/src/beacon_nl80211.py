#!/usr/bin/python
# -*- coding: utf-8 -*-
import rospy
from gps_common.msg import GPSStatus
import pprint

def callback(status_data):
    print "callback"
    pprint.pprint(status_data.data)
    rospy.loginfo("I heard %s",data.data)

def listener():
    rospy.loginfo("start")
    rospy.init_node('beacon_nl80211')
    rospy.Subscriber("/extended_fix", GPSStatus, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
