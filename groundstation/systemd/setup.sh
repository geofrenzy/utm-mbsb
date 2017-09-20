#!/bin/bash
cp newencode.service /lib/systemd/system/
cp radiomanager.service /lib/systemd/system/
systemctl enable newencode.service
systemctl enable radiomanager.service
systemctl start newencode.service
systemctl start radiomanager.service
