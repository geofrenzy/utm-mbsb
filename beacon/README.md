# Beacon

This is the source of 2 different systems:

* in flight beacon
    * dkbeacon.py
        * beacon transmitter that makes mavlink calls to autopilot IMU to
          get data to encode in the beacon
* ground based beacon
    * groundbeacon.py
        * beacon transmitter that makes calls to GPSD to
          get data to encode in the beacon

additional support files

* beaconencoder.py
    * creates the hex string required by the NL80211 subsystem to encode the geofrenzy
      beacons
* findap.py
    * finds interface in AP mode to do the NL80211 calls to
* gf_beacon.launch 
    * ROS launch file for the beacon encoding service
* hostapd.py
    * code for controlling hostapd
       * original code from the hostapd package
       * simplified to not require remote host control
* noencode.py
    * null encoder used for troubleshooting
* remotehost.py
    * remote host control code, a few dependencies still need to be teased out
      before we can remove this file from the source
* utils.py
    * supporting utilities for use when talking to hostapd
*  wpaspy.c
    * originally from hostapd package despite the name, it's the code that
      talks directly to nl80211
