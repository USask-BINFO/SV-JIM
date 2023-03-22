#!/bin/bash

TOOL_A=$1
TOOL_B=$2
SV_TYPE=$3
TRUVARI_SUMMARY=$4
OUTPUT_FILE=$5
WRITE_MODE=$6 #"W" for overwrite or "A" for append

#Confirm existance of Truvari result file before running calculations
if [ ! -f "$TRUVARI_SUMMARY" ]; then
	echo "Error reading $TRUVARI_SUMMARY! Terminating..."
fi

#Get size of each set contained in files (extract the numeric value in truvari summary.txt from a specific line containing an identifier)
#Shared/Common values
INTERSECTION_SIZE=$(cat $TRUVARI_SUMMARY | grep "TP-base.:" | tr -cd [0-9.]) #`tail -n+2 $TRUVARI_SUMMARY | head -n9 | sed 's/,/\n/g' | grep "TP-base.:" | tr -cd [0-9.]`
#PRECISION_F1=`cat $TRUVARI_SUMMARY | grep "f1" | tr -cd [0-9.]`

#Tool A's values
TOOL_A_SIZE=$(cat $TRUVARI_SUMMARY | grep "base cnt" | tr -cd [0-9.])
TOOL_A_PRECISION=$(cat $TRUVARI_SUMMARY | grep "recall" | tr -cd [0-9.])
TOOL_A_PRECISION=$(echo "scale=5;$TOOL_A_PRECISION*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,5}")

#Guard against error in calculation's command, set to 0 if variable is empty
if [ -z ${TOOL_A_PRECISION} ]; then
        TOOL_A_PRECISION="0.0"
fi

TOOL_A_UNIQUE=$(cat $TRUVARI_SUMMARY | grep "FN.:" | tr -cd [0-9.])

#Tool B's values
TOOL_B_SIZE=$(cat $TRUVARI_SUMMARY | grep "call cnt" | tr -cd [0-9.])
TOOL_B_PRECISION=$(cat $TRUVARI_SUMMARY | grep "precision" | tr -cd [0-9.])
TOOL_B_PRECISION=$(echo "scale=5;$TOOL_B_PRECISION*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,5}")

#Guard against error in calculation's command, set to 0 if variable is empty
if [ -z ${TOOL_B_PRECISION} ]; then
        TOOL_B_PRECISION="0.0"
fi

TOOL_B_UNIQUE=$(cat $TRUVARI_SUMMARY | grep "FP.:" | tr -cd [0-9.])

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((INTERSECTION_SIZE+TOOL_A_UNIQUE+TOOL_B_UNIQUE))

#Guard against error in calculation's command, set to 0 if variable is empty
if [ -z ${UNION_SIZE} ]; then
	UNION_SIZE="0"
fi

#Check to prevent divide by 0 for SV bins with no entries, otherwise perform calculation
if [ "0" = $UNION_SIZE ]; then
        JACCARD=="0.0"
else
	JACCARD=$(echo "scale=5;$INTERSECTION_SIZE/$UNION_SIZE*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,4}[1-9]") #$((INTERSECTION_SIZE/$UNION_SIZE))
fi

#Guard against error in calculation's command, set to 0 if variable is empty
if [ -z ${JACCARD} ]; then
        JACCARD="0.0"
fi

#Check if script should write/overwrite a file with the new header info (should only be done for first pair of tools compared)
if [ $WRITE_MODE = "W" ] || [ $WRITE_MODE = "w" ]
then
	echo "#ToolA	ToolB	Type	Jacc%	PrecA%	PrecB%	Union	SizeA	SizeB	UniqueA	Intersect	UniqueB" > $OUTPUT_FILE
fi

#Append the entry for the pair of tools designated by arguments
echo "$TOOL_A	$TOOL_B	$SV_TYPE	${JACCARD}%	${TOOL_A_PRECISION}%	${TOOL_B_PRECISION}%	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$INTERSECTION_SIZE	$TOOL_B_UNIQUE" >> "$OUTPUT_FILE"
