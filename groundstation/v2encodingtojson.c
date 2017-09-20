#include <string.h>
#include "blueforce.h"
#include <json-c/json.h>
#include "stdio.h"


char *v2encodingtojson(Blueforce_state bf_data) {

    /*Creating a json object*/
//printf("start\n");
    //    json_object * jgeojson = json_object_new_object();
    json_object *jfeatures = json_object_new_object();
    json_object *jgeometry = json_object_new_object();
    json_object *jproperties = json_object_new_object();

    /*Creating a json string*/
    //      json_object *jfcstring = json_object_new_string("FeatureCollection");
    json_object *jptstring = json_object_new_string("Point");
    json_object *jfstring = json_object_new_string("Feature");

    //      json_object_object_add(jgeojson,"type", jfcstring);
    json_object *coord_array = json_object_new_array();
    //       json_object *features_array = json_object_new_array();

    json_object *jlatitude = json_object_new_double(bf_data.lat_deg);
    json_object *jlongitude = json_object_new_double(bf_data.lng_deg);
    json_object *jspeed = json_object_new_double(bf_data.speed_mph);
    json_object *jcourse = json_object_new_double(bf_data.heading_deg);
    json_object *jaltitude = json_object_new_double(bf_data.alt_agl_m);
    json_object *jbattery = json_object_new_double(bf_data.battery_level);
    json_object *jflying_state = json_object_new_boolean(bf_data.flying_state_on);
    json_object *jrth = json_object_new_boolean(bf_data.return_to_home_state_on);
    json_object *jfls = json_object_new_boolean(bf_data.forced_landing_state_on);


    json_object_array_add(coord_array,jlongitude);
    json_object_array_add(coord_array,jlatitude);
    json_object_object_add(jgeometry,"type", jptstring);
    json_object_object_add(jgeometry,"coordinates", coord_array);



    //json_object *jIstring = json_object_new_string("abc123");
    //       json_object *jTstring = json_object_new_string("N12345");
    json_object_object_add(jproperties,"track",jcourse );
    json_object_object_add(jproperties,"speed",jspeed );
    json_object_object_add(jproperties,"altitude",jaltitude );
    json_object_object_add(jproperties,"battery_level",jbattery );
    json_object_object_add(jproperties,"flying_state_on",jflying_state );
    json_object_object_add(jproperties,"return_to_home_state_on",jrth );
    json_object_object_add(jproperties,"forced_landing_state_on",jfls );
   // json_object_object_add(jproperties,"icao",jIstring );

//        json_object_object_add(jproperties,"tail",jTstring );


    json_object_object_add(jfeatures,"type",jfstring);
    json_object_object_add(jfeatures,"properties",jproperties);
    json_object_object_add(jfeatures,"geometry",jgeometry);

    //       json_object_array_add(features_array,jfeatures);

    //     json_object_object_add(jgeojson,"features",features_array);

    //   printf ("The json object created: %sn",json_object_to_json_string(jgeojson));
    //ein = strdup(json_object_to_json_string(jfeatures));
    const char *ein = json_object_to_json_string(jfeatures);
    const char *retval = strdup(ein);
    json_object_put(jfeatures);
//printf("ein=%s\n",retval);
    return strdup(retval);

}
