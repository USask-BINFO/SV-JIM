#!/bin/bash

SV_FILE_A=$1
TRUVARI_DIR=$2
REF_GENOME=$3
MIN_SIZE=$4
MAX_SIZE=$5
OVERLAP=$6
MAX_REF_DIST=$7
OUTPUT_DIR=$8

#Truvari requires sorted, zipped, and indexed VCF files as input. (Re)Generate files before starting Truvari bench
bcftools sort -o ${SV_FILE_A}.sorted $SV_FILE_A
bgzip -c ${SV_FILE_A}.sorted > ${SV_FILE_A}.gz
tabix ${SV_FILE_A}.gz

bcftools sort -o ${TRUVARI_DIR}/tp-comp.sorted.vcf $TRUVARI_DIR/tp-comp.vcf
bgzip -c ${TRUVARI_DIR}/tp-comp.sorted.vcf > ${TRUVARI_DIR}/tp-comp.sorted.vcf.gz
tabix ${TRUVARI_DIR}/tp-comp.sorted.vcf.gz

bcftools sort -o ${TRUVARI_DIR}/tp-base.sorted.vcf $TRUVARI_DIR/tp-base.vcf
bgzip -c ${TRUVARI_DIR}/tp-base.sorted.vcf > ${TRUVARI_DIR}/tp-base.sorted.vcf.gz
tabix ${TRUVARI_DIR}/tp-base.sorted.vcf.gz

#Ensure parent directories set up before Truvari execution
mkdir -p $OUTPUT_DIR

#Truvari creates the output directory during execution and won't overwrite an existing directory. Remove target $OUTPUT_DIR if it already exists.
if [ -d $OUTPUT_DIR/FromTPCall ]
then
	echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
	rm -r $OUTPUT_DIR/FromTPCall
fi

if [ -d $OUTPUT_DIR/FromTPBase ]
then
        echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
        rm -r $OUTPUT_DIR/FromTPBase
fi

#Execute Truvari Bench to compare the VCF files provided in the script's arguments
truvari bench --typeignore -o $OUTPUT_DIR/FromTPCall -f $REF_GENOME -b ${SV_FILE_A}.gz -c ${TRUVARI_DIR}/tp-comp.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/FromTPCall/tp-base.vcf.gz > $OUTPUT_DIR/FromTPCall/tp-base.vcf
gunzip -c $OUTPUT_DIR/FromTPCall/tp-comp.vcf.gz > $OUTPUT_DIR/FromTPCall/tp-comp.vcf

truvari bench --typeignore -o $OUTPUT_DIR/FromTPBase -f $REF_GENOME -b ${SV_FILE_A}.gz -c ${TRUVARI_DIR}/tp-base.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/FromTPBase/tp-base.vcf.gz > $OUTPUT_DIR/FromTPBase/tp-base.vcf
gunzip -c $OUTPUT_DIR/FromTPBase/tp-comp.vcf.gz > $OUTPUT_DIR/FromTPBase/tp-comp.vcf
