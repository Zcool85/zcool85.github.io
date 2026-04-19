#!/usr/bin/env bash

exiftool -exif:all= -iptc:all= -time:all= -r . -i _site -P -overwrite_original
