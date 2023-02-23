#!/bin/bash

TOOL_A=$1
TOOL_B=$2
SV_TYPE=$3
TRUVARI_FILE=$4
OUTPUT_FILE=$5
WRITE_MODE=$6 #"W" for overwrite or "A" for append

#Confirm existance of Truvari result file before running calculations
if [ ! -f "$TRUVARI_FILE" ]; then
	echo "Error reading $TRUVARI_FILE! Terminating..."
fi

#Get size of each set contained in files (extract the numeric value in truvari summary.txt from a specific line containing an identifier)
#Shared/Common values
INTERSECTION_SIZE=`cat $TRUVARI_FILE | grep "TP-base.:" | tr -cd [0-9.]` #`tail -n+2 $TRUVARI_FILE | head -n9 | sed 's/,/\n/g' | grep "TP-base.:" | tr -cd [0-9.]`
#PRECISION_F1=`cat $TRUVARI_FILE | grep "f1" | tr -cd [0-9.]`

#Tool A's values
TOOL_A_SIZE=`cat $TRUVARI_FILE | grep "base cnt" | tr -cd [0-9.]`
TOOL_A_PRECISION=`cat $TRUVARI_FILE | grep "precision" | tr -cd [0-9.]`
TOOL_A_PRECISION=`echo "scale=5;$TOOL_A_PRECISION*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,5}"`
TOOL_A_UNIQUE=`cat $TRUVARI_FILE | grep "FP.:" | tr -cd [0-9.]`

#Tool B's values
TOOL_B_SIZE=`cat $TRUVARI_FILE | grep "call cnt" | tr -cd [0-9.]`
TOOL_B_PRECISION=`cat $TRUVARI_FILE | grep "recall" | tr -cd [0-9.]`
TOOL_B_PRECISION=`echo "scale=5;$TOOL_B_PRECISION*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,5}"`
TOOL_B_UNIQUE=`cat $TRUVARI_FILE | grep "FN.:" | tr -cd [0-9.]`

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((INTERSECTION_SIZE+TOOL_A_UNIQUE+TOOL_B_UNIQUE))
JACCARD=`echo "scale=5;$INTERSECTION_SIZE/$UNION_SIZE*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,4}[1-9]"` #$((INTERSECTION_SIZE/$UNION_SIZE))

#Check if script should write/overwrite a file with the new header info (should only be done for first pair of tools compared)
if [ $WRITE_MODE = "W" ] || [ $WRITE_MODE = "w" ]
then
	echo "#Tool_A	Tool_B	SV_Type	Jaccard_Rate	Tool_A_Overlap	Tool_B_Overlap	Union_Size	Size_A	Size_B	Unique_A	Intersection	Unique_B" > $OUTPUT_FILE
fi

#Append the entry for the pair of tools designated by arguments
echo "$TOOL_A	$TOOL_B	$SV_TYPE	$JACCARD	$TOOL_A_PRECISION	$TOOL_B_PRECISION	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$INTERSECTION_SIZE	$TOOL_B_UNIQUE" >> $OUTPUT_FILE

