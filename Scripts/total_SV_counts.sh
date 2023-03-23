#!/binb/bash

INPUT_FILE=$1

SSM_COUNT=$(awk '{sum+=$2;} END{print sum;}' $INPUT_FILE)
SML_COUNT=$(awk '{sum+=$3;} END{print sum;}' $INPUT_FILE)
MED_COUNT=$(awk '{sum+=$4;} END{print sum;}' $INPUT_FILE)
LRG_COUNT=$(awk '{sum+=$5;} END{print sum;}' $INPUT_FILE)
TOTAL_COUNT=$(awk '{sum+=$6;} END{print sum;}' $INPUT_FILE)

echo "ALL	$SSM_COUNT	$SML_COUNT	$MED_COUNT	$LRG_COUNT	$TOTAL_COUNT" >> $INPUT_FILE
