/*
Copyright [2017] [Geofrenzy Inc.]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
//#include <json/json.h>

#include "minmea.h"
#include "base32.h"
#include "blueforce.h"

#define INDENT_SPACES "  "

struct gpsdata {
    char status;
    double latitude;
    double longitude;
    double speed;
    double course;
    double altitude;
};
unsigned int create_beacon_hex(const unsigned int beacon_number,const char* buffer,char* eout) {
    //printf("one\n");
    sprintf(eout,"%02X",beacon_number); /* this is the IE unit number can have up to 255*/
    unsigned int i;
    for (i=0; i<strlen(buffer); i++)
    {
        sprintf(&eout[strlen(eout)],"%02X",buffer[i]);
    }
    return strlen(buffer);
}

unsigned int remove_spaces(const char* ein, char* buffer)
{
    unsigned int i;
    int charcount;
    charcount = 0;
    for (i=0; i<strlen(ein); i++)
    {
        if (isspace(ein[i])) {

        }
        else
        {

            buffer[charcount] = ein[i];
            charcount++;
        }
    }
    buffer[charcount+1] = 0;
    //printf("zero\n");
    return charcount;
}

int main(void)
{
    char line[MINMEA_MAX_LENGTH];
    struct gpsdata dronegps;
    bool rmc_valid;
    bool gns_valid;
    gns_valid=false;
    rmc_valid=false;
    char eout[255*2];
    char oldeout[255*2];
    unsigned int stripped_count;
    unsigned int beacon_number;
    Blueforce_state bf_data;
    // time_t beaconalarm;

    int lastcount;
//    char *ein;
    FILE *bpout_pipe;


    lastcount = 0;
    oldeout[0] = 0;
    oldeout[1] = 0;
    bpout_pipe = fopen("/tmp/bp.out","r");
    //  beaconalarm = time(0) + 1;

    while (fgets(line, sizeof(line), bpout_pipe) != NULL) {


//	if (line[0] == 0xB5) {
	//	printf("yes\n");
//	}
  //      printf("%s", line);

	// printf("\n====>%s<====\n",line);
        switch (minmea_sentence_id(line, false)) {
        case MINMEA_SENTENCE_RMC: {
            //  fprintf(stderr,"%s",line);
            struct minmea_sentence_rmc frame;
            if (minmea_parse_rmc(&frame, line)) {
                dronegps.latitude = minmea_tocoord(&frame.latitude);
                dronegps.longitude = minmea_tocoord(&frame.longitude);
                dronegps.speed = minmea_tofloat(&frame.speed);
                dronegps.course = minmea_tofloat(&frame.course);
                rmc_valid = true;
            }
            else {
                fprintf(stderr,INDENT_SPACES "$xxRMC sentence is not parsed\n");
            }
        }
        break;
        case MINMEA_SENTENCE_GNS: {
            //     fprintf(stderr,"%s",line);
            struct minmea_sentence_gns frame;
            if (minmea_parse_gns(&frame, line)) {
                dronegps.latitude = minmea_tocoord(&frame.latitude);
                dronegps.longitude = minmea_tocoord(&frame.longitude);
                dronegps.altitude = minmea_tofloat(&frame.altitude);
                gns_valid = true;
            }
            else {
                fprintf(stderr,INDENT_SPACES "$xxGNS sentence is not parsed\n");
            }
        }
        break;

        case MINMEA_SENTENCE_GGA: {
            struct minmea_sentence_gga frame;
            if (minmea_parse_gga(&frame, line)) {
                //  printf(INDENT_SPACES "$xxGGA: fix quality: %d\n", frame.fix_quality);
            }
            else {
                //   printf(INDENT_SPACES "$xxGGA sentence is not parsed\n");
            }
        }
        break;

        case MINMEA_SENTENCE_GST: {
            struct minmea_sentence_gst frame;
            if (minmea_parse_gst(&frame, line)) {
            }
            else {
                //  printf(INDENT_SPACES "$xxGST sentence is not parsed\n");
            }
        }
        break;

        case MINMEA_SENTENCE_GSV: {
            struct minmea_sentence_gsv frame;
            if (minmea_parse_gsv(&frame, line)) {

            }
            else {
                //  printf(INDENT_SPACES "$xxGSV sentence is not parsed\n");
            }
        }
        break;

        case MINMEA_SENTENCE_VTG: {
            struct minmea_sentence_vtg frame;
            if (minmea_parse_vtg(&frame, line)) {
            }
            else {
                //   printf(INDENT_SPACES "$xxVTG sentence is not parsed\n");
            }
        }
        break;

        case MINMEA_INVALID: {
           //  printf(INDENT_SPACES "$xxxxx sentence is not valid\n");
        }
        break;

        default: {
           //   printf(INDENT_SPACES "$xxxxx sentence is not parsed\n");
        }
        break;
        }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
////end nmea parsing start building buffer
////////////////////////////////////////////////////////////////////////////////////////////////////////////

        //   if (( rmc_valid == true ) && (gns_valid == true ) && (time(0) > beaconalarm)) {
        if (( rmc_valid == true ) && (gns_valid == true ) ) {


           // char buffer[strlen(ein)];
           // stripped_count = s(ein, buffer);
		bf_data.lng_deg=dronegps.longitude;
		bf_data.lat_deg=dronegps.latitude;
		bf_data.alt_agl_m = dronegps.altitude;
		bf_data.speed_mph = dronegps.speed;
		bf_data.heading_deg = dronegps.course;
		bf_data.battery_level = 99.9;
		bf_data.flying_state_on=1;
		bf_data.return_to_home_state_on=0;
		bf_data.forced_landing_state_on=0;

                fprintf(stderr,"lat=%f,lon=%f,alt=%f\n",
			dronegps.latitude,
			bf_data.lng_deg,
			bf_data.alt_agl_m);

		char* encoded = encode_blueforce_data_depth32(bf_data);
        char execbuf[256];

            beacon_number = 1;
		stripped_count = strlen(encoded);
            create_beacon_hex(beacon_number,encoded,eout);
         //     fprintf(stderr,"buffer=%s\n",eout);

          //  free(encoded);
            if (strcmp(eout,oldeout) != 0 ) {
                fprintf(stderr,"changed buffer\n");
                if (oldeout[0] != 0 ) {
                   // fprintf("echo Before delete\n");
                    sprintf(execbuf,"/usr/sbin/bcmwl del_ie 3 %d 11:22:33 %s\n",lastcount+4,oldeout);
                    system(execbuf);
                  //  printf("echo After delete\n");
                    fflush(stdout);
                    //sleep(1);
                    //char countstring[4];
                    //sprintf(countstring,"%d",charcount);
                    //execl("/bin/sh","/usr/sbin/bcmwl", "del_ie","3", countstring, "11:22:33" ,eout, (char *)NULL);
                }
                strcpy(oldeout,eout);
                lastcount = stripped_count;
                printf("echo Before add\n");

               // printf("bcmwl add_ie 3 %d 11:22:33 %s\n",stripped_count+4,eout);
                sprintf(execbuf,"/usr/sbin/bcmwl add_ie 3 %d 11:22:33 %s\n",stripped_count+4,eout);
                printf("echo After add\n");
                fflush(stdout);
                system(execbuf);
                //system("bcmwl add_ie 3 %d 11:22:33 %s\n",charcount,eout);
                //execl("/bin/sh","/usr/sbin/bcmwl", "add_ie","3", countstring, "11:22:33" ,eout, (char *)NULL);
                //   sleep(1);
                rmc_valid = false;
                gns_valid = false;
                // beaconalarm = time(0) + 1;
            }
//  if (out == NULL && outlen == 0 && inlen != 0)
            //  FAIL: input too long
// if (out == NULL)
            // FAIL: memory allocation error
// OK: data in OUT/OUTLEN.

        }
    }

    return 0;
}

/* vim: set ts=4 sw=4 et: */
