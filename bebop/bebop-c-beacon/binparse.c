/*
Copyright [2017] [Geofrenzy Inc.]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
*/



#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>


#define INDENT_SPACES "  "

struct vel_struct {
    uint32_t iTOW;
    int32_t velN;
    int32_t velE;
    int32_t velD;
    uint32_t speed;
    uint32_t gSpeed;
    int32_t heading;
    uint32_t sAcc;
    uint32_t cAcc;
    uint8_t checksuma;
    uint8_t checksumb;
} __attribute__((__packed__));
struct loc_struct {
    uint32_t iTOW;
    int32_t ecefX;
    int32_t ecefY;
    int32_t ecefZ;
    uint32_t pAcc;
    uint8_t checksuma;
    uint8_t checksumb;
} __attribute__((__packed__));

int main(void)
{

// ids seen 1,12,2,3,30,6


    FILE *gpsin_pipe;
    FILE *bpout_pipe;
    gpsin_pipe = fopen("/tmp/gps_nmea_out","r");
    bpout_pipe = fopen("/tmp/bp.out","a");
    uint8_t datum, sync2,id;
    uint8_t gpsclass;
    uint16_t gpslength;
    struct vel_struct vel_record;
    struct loc_struct loc_record;
//	printf("sizeof vel = %lu",sizeof(vel_record));
//		printf("sizeof loc = %lu",sizeof(loc_record));
    while ((datum=fgetc(gpsin_pipe)) != EOF) {
        if (ferror(gpsin_pipe) != 0) {
            printf("pipe error\n");
            break;
        } else {
            if (datum == 0xB5) {
              //  printf("start found\n");
                sync2 = fgetc(gpsin_pipe);
                if (sync2 == 0x62)
                {
                  //  printf("sync2 found \n");
                    gpsclass = fgetc(gpsin_pipe);
                    id = fgetc(gpsin_pipe);
                    fread(&gpslength,sizeof(gpslength),1,gpsin_pipe);
 //                   printf("class=%X\n",gpsclass);
   //                 printf("id=%X\n",id);
     //               printf("length=%d\n",gpslength);
                    if (id == 0x12) {
                        fread(&vel_record, sizeof(vel_record),1,gpsin_pipe);
                   //     printf("iTOW = %u\n",vel_record.iTOW);
                     //   printf("gspeed = %u\n",vel_record.gSpeed);
                   //     printf("velD = %d\n",vel_record.velD);
                    }
                    else if (id ==0x1) {
                        fread(&loc_record, sizeof(loc_record),1,gpsin_pipe);
                 //       printf("iTOW = %u\n",loc_record.iTOW);
                 //       printf("X coordinate = %d\n",loc_record.ecefX);
                //        printf("Y coordinate = %d\n",loc_record.ecefY);
                    }
                    else {
                        int a;
 //                       printf("skip=%X\n",id);
                        for( a = 0; a < gpslength + 2; a++ ) {
                            fgetc(gpsin_pipe);
                        }
                    }
                } else {
                    fprintf(bpout_pipe,"%c",datum);
                    fprintf(bpout_pipe,"%c",sync2);
                    fflush(bpout_pipe);
                }
            } else {
                fprintf(bpout_pipe,"%c",datum);
                fflush(bpout_pipe);
            }
            //  printf("X=%X\n", datum);
        }
        //	printf("another\n");
    }
    // printf("done\n");
}
