#!/bin/bash

#Grab guaranteed variables (With BND there will be less since BNDs don't come in multiple sizes)
WRITE_MODE=$1
SV_TYPE=$2
OUTPUT_FILE=$3

#If first to write, create header
if [ "W" = $WRITE_MODE ] || [ "w" = $WRITE_MODE ]; then
        echo "TYPE      SSM     SML     MED     LRG     TOTAL" > $OUTPUT_FILE
fi

#Grab guaranteed variables (With BND there will be less since BNDs don't come in multiple sizes)
SV_TYPE=$2
OUTPUT_FILE=$3

ALL_VCF=$4
TOTAL_COUNT=$(grep -v "^#" $ALL_VCF | grep -c "$SV_TYPE")

#If the SV_TYPE is BND write the row accordingly with only one total calculated (rest 0s)
if [ "BND" = $SV_TYPE ]; then
	echo "$SV_TYPE	$TOTAL_COUNT	0	0	0	$TOTAL_COUNT" >> $OUTPUT_FILE
else #Otherwise calculate all sizes and write each entry to file
	SSM_VCF=$5
        SSM_COUNT=$(grep -vc "^#" $SSM_VCF)

	SML_VCF=$6
        SML_COUNT=$(grep -vc "^#" $SML_VCF)

	MED_VCF=$7
        MED_COUNT=$(grep -vc "^#" $MED_VCF)

	LRG_VCF=$8
        LRG_COUNT=$(grep -vc "^#" $LRG_VCF)

	echo "$SV_TYPE	$SSM_COUNT	$SML_COUNT	$MED_COUNT	$LRG_COUNT	$TOTAL_COUNT" >> $OUTPUT_FILE
fi
