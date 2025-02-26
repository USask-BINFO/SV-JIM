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

#Get size of each set contained in files (extract the numeric value in truvari summary.json from a specific line containing an identifier)
#Shared/Common values
INTERSECTION_SIZE=$(cat $TRUVARI_SUMMARY | grep "TP-base.:" | tr -cd [0-9.])

#Tool A's values
TOOL_A_SIZE=$(cat $TRUVARI_SUMMARY | grep "base cnt" | tr -cd [0-9.])
TOOL_A_PRECISION=$(cat $TRUVARI_SUMMARY | grep "recall" | tr -cd [0-9.])
TOOL_A_PRECISION=$(awk -v APRECISION="$TOOL_A_PRECISION" 'BEGIN { printf "%.2f", APRECISION*100 }' </dev/null)
if [ -z ${TOOL_A_PRECISION} ]; then
        TOOL_A_PRECISION="0.0"
fi
TOOL_A_UNIQUE=$(cat $TRUVARI_SUMMARY | grep "FN.:" | tr -cd [0-9.])

#Tool B's values
TOOL_B_SIZE=$(cat $TRUVARI_SUMMARY | grep "call cnt" | tr -cd [0-9.])
TOOL_B_PRECISION=$(cat $TRUVARI_SUMMARY | grep "precision" | tr -cd [0-9.])
TOOL_B_PRECISION=$(awk -v BPRECISION="$TOOL_B_PRECISION" 'BEGIN { printf "%.2f", BPRECISION*100 }' </dev/null)
if [ -z ${TOOL_B_PRECISION} ]; then
        TOOL_B_PRECISION="0.0"
fi
TOOL_B_UNIQUE=$(cat $TRUVARI_SUMMARY | grep "FP.:" | tr -cd [0-9.])

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((INTERSECTION_SIZE+TOOL_A_UNIQUE+TOOL_B_UNIQUE))
if [ -z ${UNION_SIZE} ]; then
	UNION_SIZE="0.0"
fi

#JACCARD=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f", INTERSECT/UNION*100 }' </dev/null)
JACCARD=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f",  (UNION>0)? INTERSECT/UNION*100 : 0.0 }' </dev/null)
if [ -z ${JACCARD} ]; then
        JACCARD="0.0"
fi

#Check if script should write/overwrite a file with the new header info (should only be done for first pair of tools compared)
if [ "$WRITE_MODE" = "W" ] || [ "$WRITE_MODE" = "w" ]
then
       #echo "#ToolA    ToolB   Type    Jaccard%        PrecA        PrecB        Union# SizeA   SizeB   UniqueA Intersect       UniqueB" > $OUTPUT_FILE
        echo -e "ToolA\tToolB\tType\tSizeA\tSizeB\tUniqueA\tUniqueB\tIntersect\tUnion\tOverlapA\tOverlapB\tJaccard" > "$OUTPUT_FILE"
fi

#Append the entry for the pair of tools designated by arguments
#echo "$TOOL_A   $TOOL_B $SV_TYPE        ${JACCARD}%        ${TOOL_A_PRECISION}%       ${TOOL_B_PRECISION}%       $UNION_SIZE     $TOOL_A_SIZE    $TOOL_B_SIZE    $TOOL_A_UNIQUE  $INTERSECTION_SIZE      $TOOL_B_UNIQUE" >> "$OUTPUT_FILE"
echo -e "$TOOL_A\t$TOOL_B\t$SV_TYPE\t$TOOL_A_SIZE\t$TOOL_B_SIZE\t$TOOL_A_UNIQUE\t$TOOL_B_UNIQUE\t$INTERSECTION_SIZE\t$UNION_SIZE\t${TOOL_A_PRECISION}%\t${TOOL_B_PRECISION}%\t${JACCARD}%" >> "$OUTPUT_FILE"
