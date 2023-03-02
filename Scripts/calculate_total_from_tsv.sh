#!/bin/bash

INPUT_FILE=$1
TOOL_A=$2
TOOL_B=$3
SV_TYPE="ALL"

#Get size of each set contained in rows
#Shared/Common values
INTERSECTION_SIZE=`awk '{sum+=$11;} END{print sum;}' $INPUT_FILE`

#Tool A's values
TOOL_A_SIZE=`awk '{sum+=$8;} END{print sum;}' $INPUT_FILE`
TOOL_A_PRECISION=`echo "scale=5;$INTERSECTION_SIZE/$TOOL_A_SIZE*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,4}[1-9]"`
if [ -z ${TOOL_A_PRECISION} ]; then
	echo "Precision A missing"
        TOOL_A_PRECISION="0.0"
fi
TOOL_A_UNIQUE=`awk '{sum+=$10;} END{print sum;}' $INPUT_FILE`

#Tool B's values
TOOL_B_SIZE=`awk '{sum+=$9;} END{print sum;}' $INPUT_FILE`
TOOL_B_PRECISION=`echo "scale=5;$INTERSECTION_SIZE/$TOOL_B_SIZE*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,4}[1-9]"`
if [ -z ${TOOL_B_PRECISION} ]; then
	echo "Precision B missing"
        TOOL_B_PRECISION="0.0"
fi
TOOL_B_UNIQUE=`awk '{sum+=$12;} END{print sum;}' $INPUT_FILE`

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((INTERSECTION_SIZE+TOOL_A_UNIQUE+TOOL_B_UNIQUE))
if [ -z ${UNION_SIZE} ]; then
	echo "Union missing"
	UNION_SIZE="0.0"
fi

JACCARD=`echo "scale=5;$INTERSECTION_SIZE/$UNION_SIZE*100" | bc | grep -o -E "[0-9][0-9]?[0-9]?\.[0-9]{0,4}[1-9]"` #$((INTERSECTION_SIZE/$UNION_SIZE))
if [ -z ${JACCARD} ]; then
	echo "Jaccard missing"
        JACCARD="0.0"
fi

#Append the entry for the pair of tools designated by arguments
echo "$TOOL_A	$TOOL_B	$SV_TYPE	$JACCARD	$TOOL_A_PRECISION	$TOOL_B_PRECISION	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$INTERSECTION_SIZE	$TOOL_B_UNIQUE" >> $INPUT_FILE
