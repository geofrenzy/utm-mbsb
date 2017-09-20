# Groundstation

The groundstation is currently comprised of:
* radiomanager
    * radiomanager identifies all potential beacon receiving interfaces on the groundstation and starts an gfiwscan process for each radio to handle the scans. It uses the "ignore:" value series in the */opt/geofrenzy/etc/iwscan.yaml* file to determine the mac addresses of interfaces to leave untouched
* gfiwscan.py
    * gfiwscan calls */opt/geofrenzy/bin/gfiwscan* and parses the output to identify the beacons with GeoFrenzy IEs (information elements) it then publishes the GeoFrenzy beacons on the **geofrenzy/enhanced** beacon mqtt topic. It uses the "channels:" value series in the */opt/geofrenzy/etc/iwscan.yaml* file to determine which channels to scan for beacons.
* gfiwscan
    * the gfiwscan.c code is mantained in the MBSB/gf-iwtojson GeoFrenzy repo. More doc there.
* newencode
    * newencode is a wrapper for the bluforece library that is in the Fencing Agent/c-experimental-fa repository. It subscribes to the **geofrenzy/enhanced_beacon** mqtt topic and publishes the decoded data in json to **geofrenzy/decoded**

