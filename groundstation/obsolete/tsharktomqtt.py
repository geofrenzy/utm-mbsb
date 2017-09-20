import subprocess
import json
import pprint
import pyric.pyw as pyw
import yaml
import paho.mqtt.client as mqtt

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))


def ConfigureInterface(macAddress,channel):
	wiif = []
	ap_list = []
	monitorString = "mon" + str(channel)
	

	if pyw.isinterface(monitorString):
		todelcard = pyw.getcard(monitorString)
		print "deleting existing monitor interface"
		pyw.devdel(todelcard)
	wilist = pyw.winterfaces()
	pprint.pprint(wilist)
	for interface in wilist:
		wiif.append(pyw.getcard(interface))
	for winterface in wiif:
		winfo = pyw.ifinfo(winterface)
		driverinfo = pyw.ifinfo(winterface)['driver']
		mac = pyw.macget(winterface)
		if macAddress in mac:
			scanif = winterface
			pyw.down(scanif)
			m0 = pyw.devadd(scanif, monitorString, 'monitor')
    			for iface in pyw.ifaces(scanif):
				if iface[0].dev != m0.dev:
            				print("deleting {0} in mode {1}".format(iface[0],iface[1]))
            				pyw.devdel(iface[0])

			pprint.pprint(m0)
			pyw.up(m0)
			pyw.chset(m0, channel, None)
			print "added monitor interface " + monitorString
			return monitorString


with open('/usr/local/etc/80211beaconreceiver.yaml', 'r') as f:
    doc = yaml.load(f)
    channelDict = doc["channels"]

for each in channelDict:
	iface = ConfigureInterface(each,channelDict[each])



client = mqtt.Client()
client.on_connect = on_connect
client.connect("127.0.0.1", 1883, 60)
#client.loop_forever()
#(wlan_mgt.tag.oui == 4120) || (wlan_mgt.tag.oui == 20722)
#tshark_command = "tshark -I  -n -T json -i mon11 type mgt subtype beacon"
tshark_command = 'tshark -b filesize:2048 -b files:2 -I -q -n -T json  -Y (wlan_mgt.tag.oui==1122867)||(wlan_mgt.tag.oui==1122868)  -i mon11 type mgt subtype beacon'
p = subprocess.Popen(tshark_command.split(),stdout=subprocess.PIPE)
packetbuffer = ""
depth = 0
for stdout_line in iter(p.stdout.readline, ""):
    down = stdout_line.count('{')
    up = stdout_line.count('}')
    depth = depth + down - up
#    if depth > 0 :
    packetbuffer= packetbuffer + stdout_line
    if depth == 0 :
	try:
            packet_json=json.loads(packetbuffer)
            client.publish("tshark/json",packetbuffer)
        except:
            pass
        packetbuffer=""
        
	
	
p.stdout.close()
return_code = p.wait()
if return_code:
    raise subprocess.CalledProcessError(return_code, tshark_command)
