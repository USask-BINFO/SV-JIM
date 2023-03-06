#!/bin/bash

SV_FILE_A=$1
TRUVARI_DIR=$2
REF_GENOME=$3
MIN_SIZE=$4
MAX_SIZE=$5
OVERLAP=$6
MAX_REF_DIST=$7
OUTPUT_DIR=$8
SV_TYPE=$9

#Truvari requires sorted, zipped, and indexed VCF files as input. (Re)Generate files before starting Truvari bench
bcftools sort -o ${SV_FILE_A}.sorted $SV_FILE_A
bgzip -c ${SV_FILE_A}.sorted > ${SV_FILE_A}.gz
tabix ${SV_FILE_A}.gz

bcftools sort -o ${TRUVARI_DIR}/tp-call.sorted.vcf $TRUVARI_DIR/tp-call.vcf
bgzip -c ${TRUVARI_DIR}/tp-call.sorted.vcf > ${TRUVARI_DIR}/tp-call.sorted.vcf.gz
tabix ${TRUVARI_DIR}/tp-call.sorted.vcf.gz

bcftools sort -o ${TRUVARI_DIR}/tp-base.sorted.vcf $TRUVARI_DIR/tp-base.vcf
bgzip -c ${TRUVARI_DIR}/tp-base.sorted.vcf > ${TRUVARI_DIR}/tp-base.sorted.vcf.gz
tabix ${TRUVARI_DIR}/tp-base.sorted.vcf.gz

#Truvari creates the output directory during execution and won't overwrite an existing directory. Remove target $OUTPUT_DIR if it already exists.
if [ -d $OUTPUT_DIR/$SV_TYPE/FromTPCall ]
then
	echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
	rm -r $OUTPUT_DIR/$SV_TYPE/FromTPCall
fi

if [ -d $OUTPUT_DIR/$SV_TYPE/FromTPBase ]
then
        echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
        rm -r $OUTPUT_DIR/$SV_TYPE/FromTPBase
fi

#Execute Truvari Bench to compare the VCF files provided in the script's arguments
truvari bench -o $OUTPUT_DIR/$SV_TYPE/FromTPCall -f $REF_GENOME -b ${SV_FILE_A}.gz -c ${TRUVARI_DIR}/tp-call.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
truvari bench -o $OUTPUT_DIR/$SV_TYPE/FromTPBase -f $REF_GENOME -b ${SV_FILE_A}.gz -c ${TRUVARI_DIR}/tp-base.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
