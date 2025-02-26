#!/bin/bash

TRUVARI_DIR_A=$1
TRUVARI_DIR_B=$2
REF_GENOME=$3
MIN_SIZE=$4
MAX_SIZE=$5
OVERLAP=$6
MAX_REF_DIST=$7
OUTPUT_DIR=$8

#Truvari requires sorted, zipped, and indexed VCF files as input. (Re)Generate files before starting Truvari bench
bcftools sort -o ${TRUVARI_DIR_A}/tp-comp.sorted.vcf $TRUVARI_DIR_A/tp-comp.vcf
bgzip -c ${TRUVARI_DIR_A}/tp-comp.sorted.vcf > ${TRUVARI_DIR_A}/tp-comp.sorted.vcf.gz
tabix ${TRUVARI_DIR_A}/tp-comp.sorted.vcf.gz

bcftools sort -o ${TRUVARI_DIR_A}/tp-base.sorted.vcf $TRUVARI_DIR_A/tp-base.vcf
bgzip -c ${TRUVARI_DIR_A}/tp-base.sorted.vcf > ${TRUVARI_DIR_A}/tp-base.sorted.vcf.gz
tabix ${TRUVARI_DIR_A}/tp-base.sorted.vcf.gz

bcftools sort -o ${TRUVARI_DIR_B}/tp-comp.sorted.vcf $TRUVARI_DIR_B/tp-comp.vcf
bgzip -c ${TRUVARI_DIR_B}/tp-comp.sorted.vcf > ${TRUVARI_DIR_B}/tp-comp.sorted.vcf.gz
tabix ${TRUVARI_DIR_B}/tp-comp.sorted.vcf.gz

bcftools sort -o ${TRUVARI_DIR_B}/tp-base.sorted.vcf $TRUVARI_DIR_B/tp-base.vcf
bgzip -c ${TRUVARI_DIR_B}/tp-base.sorted.vcf > ${TRUVARI_DIR_B}/tp-base.sorted.vcf.gz
tabix ${TRUVARI_DIR_B}/tp-base.sorted.vcf.gz

#Ensure parent directories set up before Truvari execution
mkdir -p $OUTPUT_DIR/Call
mkdir -p $OUTPUT_DIR/Base

#Truvari creates the output directory during execution and won't overwrite an existing directory. Remove target $OUTPUT_DIR if it already exists.
if [ -d $OUTPUT_DIR/Call/FromTPCall ]
then
	echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
	rm -r $OUTPUT_DIR/Call/FromTPCall
fi

if [ -d $OUTPUT_DIR/Call/FromTPBase ]
then
        echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
        rm -r $OUTPUT_DIR/Call/FromTPBase
fi

if [ -d $OUTPUT_DIR/Base/FromTPCall ]
then
        echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
        rm -r $OUTPUT_DIR/Base/FromTPCall
fi

if [ -d $OUTPUT_DIR/Base/FromTPBase ]
then
        echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
        rm -r $OUTPUT_DIR/Base/FromTPBase
fi

#Execute Truvari Bench to compare the VCF files provided in the script's arguments
truvari bench --typeignore -o $OUTPUT_DIR/Call/FromTPCall -f $REF_GENOME -b ${TRUVARI_DIR_A}/tp-comp.sorted.vcf.gz -c ${TRUVARI_DIR_B}/tp-comp.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/Call/FromTPCall/tp-base.vcf.gz > $OUTPUT_DIR/Call/FromTPCall/tp-base.vcf
gunzip -c $OUTPUT_DIR/Call/FromTPCall/tp-comp.vcf.gz > $OUTPUT_DIR/Call/FromTPCall/tp-comp.vcf

truvari bench --typeignore -o $OUTPUT_DIR/Call/FromTPBase -f $REF_GENOME -b ${TRUVARI_DIR_A}/tp-comp.sorted.vcf.gz -c ${TRUVARI_DIR_B}/tp-base.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/Call/FromTPBase/tp-base.vcf.gz > $OUTPUT_DIR/Call/FromTPBase/tp-base.vcf
gunzip -c $OUTPUT_DIR/Call/FromTPBase/tp-comp.vcf.gz > $OUTPUT_DIR/Call/FromTPBase/tp-comp.vcf

truvari bench --typeignore -o $OUTPUT_DIR/Base/FromTPCall -f $REF_GENOME -b ${TRUVARI_DIR_A}/tp-base.sorted.vcf.gz -c ${TRUVARI_DIR_B}/tp-comp.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/Base/FromTPCall/tp-base.vcf.gz > $OUTPUT_DIR/Base/FromTPCall/tp-base.vcf
gunzip -c $OUTPUT_DIR/Base/FromTPCall/tp-comp.vcf.gz > $OUTPUT_DIR/Base/FromTPCall/tp-comp.vcf

#truvari bench --typeignore -o $OUTPUT_DIR/$SV_TYPE/Base/FromTPBase -f $REF_GENOME -b ${TRUVARI_DIR_A}/tp-base.sorted.vcf.gz -c ${TRUVARI_DIR_B}/tp-base.sorted.vcf.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
