#!/bin/bash

GENOME_FILE=$1
REGIONS_LIST=$2
OUTPUT_FILE=$3

#Check for an index of the reference file and create it if it does not exist
if [ ! -f ${GENOME_FASTA}.fai ]
then
	echo "Creating index for $GENOME_FILE..."
	samtools faidx $GENOME_FILE
fi

#Extract regions of interest based on contents of the CHROM_LIST_FILE path provided
echo "Extracting regions specified in $REGIONS_LIST..."
samtools faidx $GENOME_FILE -r $REGIONS_LIST > $OUTPUT_FILE
