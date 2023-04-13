#!/bin/bash

TOOL_A=$1
shift
TOOL_B=$1
shift
SV_TYPE=$1
shift
OUTPUT_FILE=$1
shift
WRITE_MODE=$1 #"W" for overwrite or "A" for append
shift

INTERSECTION_SIZE="0"
TOOL_A_SIZE="0"
TOOL_B_SIZE="0"
TOOL_A_UNIQUE="0"
TOOL_B_UNIQUE="0"

for TRUVARI_SUMMARY in $*
do
	#Confirm existance of Truvari result file before running calculations
	if [ ! -f "$TRUVARI_SUMMARY" ]; then
		echo "Error reading $TRUVARI_SUMMARY! Terminating..."
	fi

	#Get size of each set contained in files (extract the numeric value in truvari summary.txt from a specific line containing an identifier)
	#Shared/Common values
	INTERSECTION_SIZE=$(( INTERSECTION_SIZE+$(cat $TRUVARI_SUMMARY | grep "TP-base.:" | tr -cd [0-9.]) ))

	#Tool A's values
	TOOL_A_SIZE=$(( TOOL_A_SIZE +  $(cat $TRUVARI_SUMMARY | grep "base cnt" | tr -cd [0-9.]) ))
	TOOL_A_UNIQUE=$(( TOOL_A_UNIQUE + $(cat $TRUVARI_SUMMARY | grep "FN.:" | tr -cd [0-9.]) ))

	#Tool B's values
	TOOL_B_SIZE=$(( TOOL_B_SIZE + $(cat $TRUVARI_SUMMARY | grep "call cnt" | tr -cd [0-9.]) ))
	TOOL_B_UNIQUE=$(( TOOL_B_UNIQUE + $(cat $TRUVARI_SUMMARY | grep "FP.:" | tr -cd [0-9.]) ))
done

#Calculate Precision rates for pair of tools based on sums produced
#TOOL_A_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", INTERSECT/ASIZE*100 }' </dev/null)
TOOL_A_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", (ASIZE>0) ? INTERSECT/ASIZE*100 : 0.0 }' </dev/null)
if [ -z ${TOOL_A_PRECISION} ]; then
	TOOL_A_PRECISION="0.0"
fi

#TOOL_B_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", INTERSECT/BSIZE*100 }' </dev/null)
TOOL_B_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", (BSIZE>0)? INTERSECT/BSIZE*100 : 0.0 }' </dev/null)
if [ -z ${TOOL_B_PRECISION} ]; then
	TOOL_B_PRECISION="0.0"
fi

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
