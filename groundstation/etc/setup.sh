#!/bin/bash
mkdir -p /opt/geofrenzy/etc
cp *.yaml /opt/geofrenzy/etc
cp /opt/geofrenzy/groundstation/etc/cron.hourly/* /etc/cron.hourly
cp /opt/geofrenzy/groundstation/etc/logrotate.d/* /etc/logrotate.d
