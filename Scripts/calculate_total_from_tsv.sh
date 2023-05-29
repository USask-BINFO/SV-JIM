#!/bin/bash

INPUT_FILE=$1
TOOL_A=$2
TOOL_B=$3
SV_TYPE="ALL"

#ToolA   ToolB   Type    SizeA   SizeB   UniqueA UniqueB Intersect       Union   OverlapA        OverlapB        Jaccard

#Get size of each set contained in rows
#Shared/Common values
INTERSECTION_SIZE=$(awk '{sum+=$8;} END{print sum;}' $INPUT_FILE)

#Tool A's values
TOOL_A_SIZE=$(awk '{sum+=$4;} END{print sum;}' $INPUT_FILE)
#TOOL_A_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", INTERSECT/ASIZE*100 }' </dev/null)
TOOL_A_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", (ASIZE>0) ? INTERSECT/ASIZE*100 : 0.0 }' </dev/null)
if [ -z ${TOOL_A_PRECISION} ]; then
	echo "Precision A missing"
        TOOL_A_PRECISION="0.0"
fi
TOOL_A_UNIQUE=$(awk '{sum+=$6;} END{print sum;}' $INPUT_FILE)

#Tool B's values
TOOL_B_SIZE=$(awk '{sum+=$5;} END{print sum;}' $INPUT_FILE)
#TOOL_B_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", INTERSECT/BSIZE*100 }' </dev/null)
TOOL_B_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", (BSIZE>0) ? INTERSECT/BSIZE*100 : 0.0 }' </dev/null)
if [ -z ${TOOL_B_PRECISION} ]; then
	echo "Precision B missing"
        TOOL_B_PRECISION="0.0"
fi
TOOL_B_UNIQUE=$(awk '{sum+=$7;} END{print sum;}' $INPUT_FILE)

#Calculate union size and Jaccard Index value for the provided pair of tools
UNION_SIZE=$((INTERSECTION_SIZE+TOOL_A_UNIQUE+TOOL_B_UNIQUE))
if [ -z ${UNION_SIZE} ]; then
	echo "Union missing"
	UNION_SIZE="0.0"
fi

#JACCARD=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f", INTERSECT/UNION*100 }' </dev/null)
JACCARD=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f", (UNION>0) ? INTERSECT/UNION*100 : 0.0 }' </dev/null)
if [ -z ${JACCARD} ]; then
	echo "Jaccard missing"
        JACCARD="0.0"
fi

#Append the entry for the pair of tools designated by arguments
#echo "$TOOL_A	$TOOL_B	$SV_TYPE	${JACCARD}%	${TOOL_A_PRECISION}%	${TOOL_B_PRECISION}%	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$INTERSECTION_SIZE	$TOOL_B_UNIQUE" >> $INPUT_FILE
echo -e "$TOOL_A\t$TOOL_B\t$SV_TYPE\t$TOOL_A_SIZE\t$TOOL_B_SIZE\t$TOOL_A_UNIQUE\t$TOOL_B_UNIQUE\t$INTERSECTION_SIZE\t$UNION_SIZE\t${TOOL_A_PRECISION}%\t${TOOL_B_PRECISION}%\t${JACCARD}%" >> "$INPUT_FILE"
