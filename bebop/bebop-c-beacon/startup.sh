echo "starting" > /data/ftp/gf.log
sleep 5
bcmwl down
bcmwl channel 11
bcmwl up
echo "changed channel" >> /data/ftp/gf.log
mkfifo /tmp/bp.out

PIDS=`ps | grep /data/ftp/binparse | grep -v grep | awk '{print $1}'`
if [ -z "$PIDS" ]; then
/data/ftp/binparse < /tmp/gps_nmea_out > /tmp/bp.out 2>> /data/ftp/binparse.log &
        fi

PIDS=`ps | grep /data/ftp/nmeaparse | grep -v grep | awk '{print $1}'`
if [ -z "$PIDS" ]; then
/data/ftp/nmeaparse < /tmp/bp.out 2>> /data/ftp/nmeaparse.log | /bin/sh 2>> /data/ftp/shell.log &
        fi
        
echo "done" >> /data/ftp/gf.log
