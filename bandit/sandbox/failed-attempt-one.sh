#!/bin/bash
# Copyright 2020 David Boyd, all rights reserved
# Program: uncompress-me.sh
# Description:
#     1. Finds the filetype
#     2. Uncompresses the file
# Date: 2020-03-10
# Revised:


# Check for filename
if [ -z $1 ]; then
    echo "[*] Usage: ./uncompress-me.sh <filename>"
    exit
fi

# init vars
compTypes=(bzip2 gzip POSIX)
posixFile=""
count=0         # used for output filename incrementing
mkdir ./temp-files-uncompressing/
# copy file to temp as to not alter original file
cp $1 ./temp-files-uncompressing/temp
cd ./temp-files-uncompressing/
tempFile=temp
#echo "tempFile = $tempFile"    ###DEBUG###
#echo "\$1 = $1"    ###DEBUG###

# Get filetype
fileType=$(file $tempFile$count | cut -d' ' -f2)
echo "fileType= ... $fileType"

while [[ "${compTypes[@]}" =~ "${fileType}" ]]; do

    case $fileType in

        bzip2*)
            echo
            echo "in bzip2"
            echo "count = $count"
            cp $tempFile$count temp.bz2
            tempBZIP2=temp.bz2
            #tempFile$count=$(bzip2 -d temp.bz2 temp)
            bzip2 -df temp.bz2 temp
            mv temp.out temp
            echo "gunzip tempFile$count:    $tempFile$count"
            echo "gunzip tempBZIP2:    $tempBZIP2"
            fileType=$(file $tempFile$count | cut -d' ' -f2)
            echo "gunzip filetype:    $fileType"
            echo "gunzip tempFile$count:    $tempFile$count"
            let "count=$count+1"
            echo "count = $count"
            read -p "Press enter to continue..."
            ;;

        gzip*)
            echo
            echo "in gzip; tempFile$count = $tempFile$count"
            echo "count = $count"
            cp $tempFile$count temp.gz
            tempGZIP=temp.gz
            gunzip $tempGZIP
            echo "gunzip tempFile$count:    $tempFile$count"
            echo "gunzip tempGZIP:    $tempGZIP"
            fileType=$(file $tempFile$count | cut -d' ' -f2)
            echo "gunzip filetype:    $fileType"
            echo "gunzip tempFile$count:    $tempFile$count"
            let "count=$count+1"
            echo "count = $count"
            read -p "Press enter to continue..."
            ;;

        POSIX*)
            echo
            if [ "$posixFile" == "" ]; then
                echo "if posixFile is empy..."



                # Store output file in posixFile variable
                #posixFile=$(tar -xvf $tempFile$count)
                #tempFile$count=$(tar -xvf $tempFile$count)
                tar -xvf $tempFile$count > $tempFile$count
                #echo "posixFile=$posixFile"
                echo "posixFile=tempFile$count= $tempFile$count"
            else
                echo "else posixFile = $posixFile"
                #posixFile=$(tar -xvf $posixFile)
                #tempFile$count=$(tar -xvf $posixFile)
                tar -xvf $tempFile$count > $tempFile$count
                #echo "posixFile=$posixFile"
                echo "posixFile=tempFile$count= $tempFile$count"
            fi
            fileType=$(file $posixFile | cut -d' ' -f2)
            let "count=$count+1"
            echo "count = $count"
            read -p "Press enter to continue..."
            ;;
        *)
            echo "Not in compressions types: $fileType"
            break
            ;;
    esac
done

