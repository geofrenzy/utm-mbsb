#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <unistd.h>
#include "MQTTClient.h"
#include "blueforce.h"
#include "v2encodingtojson.h"
#include "json-c/json.h"
#define ADDRESS     "tcp://localhost:1883"
#define CLIENTID    "ExampleClientSub"
#define TOPIC       "geofrenzy/enhanced_beacon"
#define PUBTOPIC       "geofrenzy/decoded"
#define QOS         0
#define TIMEOUT     10000L
volatile MQTTClient_deliveryToken deliveredtoken;
MQTTClient client;
int msgarrvd(void *context, char *topicName, int topicLen, MQTTClient_message *message )
{
    const char *json_output;
    char  *bufferptr;
    MQTTClient_message pubmsg = MQTTClient_message_initializer;
    MQTTClient_deliveryToken token;
    int i;
    char *buffer;
    json_object *json_wrapper_object, *json_output_object;
    Blueforce_state decoded;
    char payloadptr[strlen(message->payload)];
    strcpy(payloadptr,message->payload);
    payloadptr[strlen(message->payload)] = 0x00;
    json_wrapper_object = json_tokener_parse(payloadptr);
    // json_object_object_foreach(json_wrapper_object,key,val)
    struct json_object *val;
    if (json_object_object_get_ex(json_wrapper_object,"gf_value",&val))
    {
        //  if  (strcmp("gf_value",key)==0) {
        // printf("\t%s: %s\n",key,json_object_to_json_string(val));
        bufferptr = json_object_get_string(val);
        // strncpy(buffer,bufferptr,strlen(bufferptr)-2);
        //buffer[strlen(bufferptr)]="\0";
        //  printf("buffer=%s\n",bufferptr);
        const int bufferlength = strlen(bufferptr);
        char databuffer[bufferlength/2];
        int dataindex;
        for (dataindex=0; dataindex< bufferlength/2; dataindex++) {
            sscanf(bufferptr +2*dataindex,"%02x",&databuffer[dataindex]);
        }
        databuffer[bufferlength/2] = 0x00;
        decoded = decode_blueforce_encoding_depth32(databuffer);
        json_output = v2encodingtojson(decoded);
        //}
        // printf("\val=%s\n",json_object_to_json_string(val));
        json_object_object_del(json_wrapper_object,"gf_value");
    }



    json_output_object = json_tokener_parse(json_output);
    // printf("json_output_object=%sn\n",json_object_to_json_string(json_output_object));
    // printf("json_wrapper_object=%sn\n",json_object_to_json_string(json_wrapper_object));

    // json_object_object_foreach(json_output_object,key1,val1)




    struct json_object *val1;
    struct json_object *val2;
    struct json_object *val3;
    struct json_object *val4;
    if (json_object_object_get_ex(json_output_object,"properties",&val1))
    {

        //   printf("val1=%sn\n",json_object_to_json_string(val1));

        json_object_object_add(val1,"gs_receive_data",json_wrapper_object);

        if (json_object_object_get_ex(json_wrapper_object,"BSSmasked",&val2))
        {
            //     printf("val2=%sn\n",json_object_to_json_string(val2));

            json_object_object_add(val1,"icao",val2);
        }
        if (json_object_object_get_ex(json_wrapper_object,"BSS",&val3))
        {
            //     printf("val2=%sn\n",json_object_to_json_string(val2));

            json_object_object_add(val1,"tail",val3);
        }

        //signal_dBm
        if (json_object_object_get_ex(json_wrapper_object,"signal_dBm",&val4))
        {
             //    printf("val4=%sn\n",json_object_to_json_string(val4));

            json_object_object_add(val1,"Signal",val4);
        }


    }




    MQTTClient_freeMessage(&message);
    MQTTClient_free(topicName);


//   pubmsg.payload = (char *)json_output;
    pubmsg.payload=json_object_to_json_string(json_output_object);
    pubmsg.payloadlen = strlen(pubmsg.payload);
    pubmsg.qos = 0;
    pubmsg.retained = 0;
    deliveredtoken = 0;
    MQTTClient_publishMessage(client, PUBTOPIC, &pubmsg, &token);
    free((char *)json_output);


    return 1;
}
void connlost(void *context, char *cause)
{
    printf("\nConnection lost\n");
    printf("     cause: %s\n", cause);
}
int main(int argc, char* argv[])
{
    MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
    int rc;
    int ch;
    MQTTClient_create(&client, ADDRESS, CLIENTID,
                      MQTTCLIENT_PERSISTENCE_NONE, NULL);
    conn_opts.keepAliveInterval = 20;
    conn_opts.cleansession = 1;
    MQTTClient_setCallbacks(client, NULL, connlost, msgarrvd, NULL);
    if ((rc = MQTTClient_connect(client, &conn_opts)) != MQTTCLIENT_SUCCESS)
    {
        printf("Failed to connect, return code %d\n", rc);
        exit(EXIT_FAILURE);
    }
    MQTTClient_subscribe(client, TOPIC, QOS);
    pause();
    MQTTClient_disconnect(client, 10000);
    MQTTClient_destroy(&client);
    return rc;
}
