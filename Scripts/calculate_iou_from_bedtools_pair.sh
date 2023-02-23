#!/bin/bash

TOOLS_INVOLVED=$1
INTERSECTION_FILE=$2
SET_A_FILE=$3
SET_B_FILE=$4
OUTPUT_FILE=$5
WRITE_MODE=$6 #"W" for overwrite or "A" for append

#Confirm existance of iles before running calculations
if [ ! -f "$INTERSECTION_FILE" ]; then
	echo "Error reading $INTERSECTION_FILE! Terminating..."
	exit 1
fi


if [ ! -f "$SET_A_FILE" ]; then
	echo "Error reading $SET_A_FILE! Terminating..."
        exit 1
fi

if [ ! -f "$SET_B_FILE" ]; then
        echo "Error reading $SET_B_FILE! Terminating..."
        exit 1
fi

#Get size of each set contained in files (based on 1 VCF entry per line)
INTERSECTION_SIZE=`cat $INTERSECTION_FILE | grep -v "^#" | wc -l`
SET_A_SIZE=`cat $SET_A_FILE | grep -v "^#" | wc -l`
SET_B_SIZE=`cat $SET_B_FILE | grep -v "^#" | wc -l`

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((SET_A_SIZE+SET_B_SIZE-INTERSECTION_SIZE))
IOU_RATE=$((INTERSECTION_SIZE/UNION_SIZE))

#Check if script should write/overwrite a file with the new header info (should only be done for first pair of tools compared)
if [ $WRITE_MODE = "W" ] || [ $WRITE_MODE = "w" ]
then
	echo "Tools	Intersect	Union	IOU" > $OUTPUT_FILE
fi

#Append the entry for the pair of tools designated by arguments
echo "$TOOLS_INVOLVED:	$INTERSECTION_SIZE	$UNION_SIZE	$IOU_RATE" >> $OUTPUT_FILE

