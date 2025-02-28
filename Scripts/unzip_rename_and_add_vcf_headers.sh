#!/bin/bash

ZIPPED_VCF=$1
UNZIPPED_VCF=$2
DEST_DIR=$3
HEADERS_FILE=$4
TEMP_FILE=$5

#Unzip the PAVs VCF result file
gunzip -c $ZIPPED_VCF > $UNZIPPED_VCF

#If the file is missing a definition for the END tag inf the INFO field, add it so truvari & pysam can work
bcftools view -h "$UNZIPPED_VCF" | grep -q '^##INFO=<ID=END,'
if [ $? -eq 0 ]; then
    echo "The END field is already defined in the VCF file's metadata, so no changes were made."
    exit 0

else
    echo "No END INFO TAG detected in the metadata, appending with bcftools to allow truvari to run without error!.."
    bcftools annotate -h $HEADERS_FILE -o $TEMP_FILE $UNZIPPED_VCF 
    mv $TEMP_FILE $UNZIPPED_VCF 
fi





