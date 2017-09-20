import paho.mqtt.client as mqtt
import json
import pprint


# we need to do this because tshark uses duplicate keys in the json it produces
def dict_raise_on_duplicates(ordered_pairs):
    """Reject duplicate keys."""
    d = {}
    found_oui=False
    for k, v in ordered_pairs:
	if k == "wlan_mgt.tag.oui":
            if v == "1122867":
                found_oui=True
	if k == "wlan_mgt.tag.vendor.data" and found_oui:
            gfstring = v.replace(":","")[2:].decode("hex")
            client.publish("geofrenzy/raw",gfstring)	
            return {}
#        if k in d:
#           print "duplicate key" 
#        else:
        d[k] = v
    return d

# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("tshark/json")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    fulldict = json.loads(msg.payload,object_pairs_hook=dict_raise_on_duplicates)
#    pprint.pprint(fulldict)
    try:
        gfdict = fulldict["_source"]["layers"]["wlan_mgt"]["wlan_mgt.tagged.all"]["wlan_mgt.tag"]
    except:
        return
#u'wlan_mgt.tag.oui': u'1122868'
#    pprint.pprint(gfdict)
    try:
        gfstring = gfdict["wlan_mgt.tag.vendor.data"].replace(":","")[2:].decode("hex")
    except:
        return
    if gfdict["wlan_mgt.tag.oui"] == "1122868" :
        client.publish("geofrenzy/encoded",json.dumps(gfstring))
#    if gfdict["wlan_mgt.tag.oui"] == "1122867" :
#        client.publish("geofrenzy/raw",json.dumps(gfstring))

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("127.0.0.1", 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
client.loop_forever()

