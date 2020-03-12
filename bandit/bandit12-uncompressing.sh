#!/bin/bash
# Copyright 2020 David Boyd, all rights reserved
# Program: uncompressing-loop.sh
# Description:
#     Procedure script (hardcoded) to uncompress files until key is revealed.
# Notes: Written explicitly for Overthewire:Bandit12->13
# Date: 2020-03-11
# Revised:
#    2020-03-11 - revamped for procedural output

### Check for filename
if [ -z $1 ]; then
    echo "[*] Usage: ./uncompress-me.sh <filename>"
    exit
fi

### xxd
xxd -rp $1 > temp

### gzip
mv temp temp.gz
gunzip temp.gz

### bz2
mv temp temp.bz2
bzip2 -df temp.bz2 temp 2>/dev/null
mv temp.out temp

### gzip
mv temp temp.gz
gunzip temp.gz                      # output: temp

### POSIX
tar -xvf temp 1>/dev/null           # output: data5.bin
tar -xvf data5.bin 1>/dev/null      # output: data6.bin
tar -xvf data6.bin 1>/dev/null      # output: data8.bin

### gzip
rm temp
mv data8.bin temp$count.gz
gunzip temp$count.gz

### ASCII
cat temp$count
cat temp$count | cut -d' ' -f4 | xclip -sel clip

### Clean
rm data[56]* temp

