#include <string>
#include "ros/ros.h"
#include "gf_beacon/gf_encoding.h"
extern "C" {
#include "blueforce.h"
}

bool add(gf_beacon::gf_encoding::Request  &req,
                 gf_beacon::gf_encoding::Response &res)
{
  struct Blueforce_state telemetry_data;
    telemetry_data.lng_deg = req.lng_deg;
    telemetry_data.lat_deg = req.lat_deg;
    telemetry_data.alt_agl_m = req.alt_agl_m;
    telemetry_data.speed_mph = req.speed_mph;
    telemetry_data.heading_deg = req.heading_deg;
    telemetry_data.battery_level = req.battery_level;
    telemetry_data.flying_state_on = req.flying_state_on;
    telemetry_data.return_to_home_state_on = req.return_to_home_state_on;
    telemetry_data.forced_landing_state_on = req.forced_landing_state_on;
    printf("lng_deg=%f,lat_deg=%f,alt_agl_m=%f\n",req.lng_deg,req.lat_deg,req.alt_agl_m);
    printf("speed %f, heading %f, battery %f\n",req.speed_mph,req.heading_deg,req.battery_level);
    printf("flyingstate=%i,rtl=%i,land=%i\n",req.flying_state_on,req.return_to_home_state_on,req.forced_landing_state_on);
    try {
    std::string encoded = encode_blueforce_data_depth32(telemetry_data);
    res.encoded = encoded;
    ROS_INFO("sending back response: [%s]", encoded.c_str());
    } catch (const std::exception& e) {
            ROS_INFO("GF encoding error: [%s]", e.what());
    }

  //      ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);

            return true;
}

int main(int argc, char **argv)
{
      ros::init(argc, argv, "gf_beacon_encoding_server");
        ros::NodeHandle n;

          ros::ServiceServer service = n.advertiseService("gf_beacon_encoding", add);
            ROS_INFO("Provide Beacon Structure");
              ros::spin();

                return 0;
}
