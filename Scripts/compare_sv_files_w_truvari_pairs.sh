#!/bin/bash

SV_FILE_A=$1
SV_FILE_B=$2
REF_GENOME=$3
MIN_SIZE=$4
MAX_SIZE=$5
OVERLAP=$6
MAX_REF_DIST=$7
OUTPUT_DIR=$8

#Truvari requires sorted, zipped, and indexed VCF files as input. (Re)Generate files before starting Truvari bench
echo "Starting BCFtools!.."
bcftools sort -o ${SV_FILE_A}.sorted $SV_FILE_A
bgzip -c ${SV_FILE_A}.sorted > ${SV_FILE_A}.gz
tabix ${SV_FILE_A}.gz

bcftools sort -o ${SV_FILE_B}.sorted $SV_FILE_B
bgzip -c ${SV_FILE_B}.sorted > ${SV_FILE_B}.gz
tabix ${SV_FILE_B}.gz

#Ensure parent directories set up before Truvari execution
mkdir -p $OUTPUT_DIR

#Truvari creates the output directory during execution and won't overwrite an existing directory. Remove target $OUTPUT_DIR if it already exists.
if [ -d $OUTPUT_DIR ]
then
	echo "$OUTPUT_DIR already exists! Removing to allow truvari to run!.. "
	rm -r $OUTPUT_DIR
fi

#Execute Truvari Bench to compare the VCF files provided in the script's arguments
truvari bench -o $OUTPUT_DIR -f $REF_GENOME -b ${SV_FILE_A}.gz -c ${SV_FILE_B}.gz -s $MIN_SIZE --sizemax $MAX_SIZE -r $MAX_REF_DIST -p 0 -P $OVERLAP -C $MAX_REF_DIST
gunzip -c $OUTPUT_DIR/tp-base.vcf.gz > $OUTPUT_DIR/tp-base.vcf
gunzip -c $OUTPUT_DIR/tp-comp.vcf.gz > $OUTPUT_DIR/tp-comp.vcf
