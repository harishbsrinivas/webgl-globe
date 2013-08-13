#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
	echo "Usage: ./generate_data.sh [number of data points]"
	echo "./genrate_data.sh 500 - will generate 500 (Lat, Lon, Magnitude and Color) lines in the mydata.json file."
    exit 0
fi
echo -ne "[" >  tmp.data

for (( i = 0; i < $1; i++ )); do
 LON=$(jot -r 1  -180.000000 179.9999999) 
 LAT=$(jot -r 1  -90.000000 89.9999999)
 MAG=$(jot -r 1  0.001 0.999) 
 COLOR=$(jot -r 1  1 14)
 #COLOR="14"
 echo "$LAT,$LON,$MAG,$COLOR,"  >>  tmp.data
done

 cat tmp.data | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}' | sed -e '$s/,$/]/'  > mydata.json