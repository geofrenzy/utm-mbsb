#!/bin/bash
gcc -g -o newencode newencode.c v2encodingtojson.c -l paho-mqtt3c -I ../src/c-experimental-fa/ -lblueforce -lm -ljson-c
