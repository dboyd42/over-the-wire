#!/bin/bash
# Copyright 2020 David Boyd, all rights reserved
# Program: uncompress-me.sh
# Description:
#     1. Finds the filetype
#     2. Uncompresses the file
# Date: 2020-03-10
# Revised:

# init vars
compTypes=(bzip2 gzip POSIX)
posixFile=""

# Check for filename
if [ -z $1 ]; then
    echo "[*] Usage: ./uncompress-me.sh <filename>"
    exit
fi

# copy file to temp as to not alter original file
cp $1 ./temp
tempFile=temp

# Get filetype
fileType=$(file $tempFile | cut -d' ' -f2)

while [[ "${compTypes[@]}" =~ "${fileType}" ]]; do

    case $fileType in
        bzip2*)
            echo "in bzip2"
            mv $tempFile temp.bz2
            #tempFile=$(bzip2 -d temp.bz2 temp)
            #mv temp.out temp
            fileType=$(file $tempFile | cut -d' ' -f2)
            ;;
        gzip*)
            echo "in gzip; tempFile = $tempFile"
            cp $tempFile temp.gz
            tempGZIP=temp.gz
            #tempFile=$(gunzip $tempGZIP)
            gunzip $tempGZIP
            fileType=$(file $tempFile | cut -d' ' -f2)
            ;;
        POSIX*)
            if [ "$posixFile" == "" ]; then
                echo "if posixFile"
                posixFile=$(tar -xvf $tempFile)
                echo "posixFile=$posixFile"
            else
                echo "else posixFile"
                posixFile=$(tar -xvf $posixFile)
                echo "posixFile=$posixFile"
            fi
            fileType=$(file $posixFile | cut -d' ' -f2)
            ;;
        *)
            echo "Not in compressions types: $fileType"
            break
            ;;
    esac
done

