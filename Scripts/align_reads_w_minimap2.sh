#!/bin/bash

THREADS=$1
Z_DROP=$2
PRESET_VAL=$3
REF_GENOME=$4
OUTPUT_FILE=$5
ALIGN_DIR=$6
READS_DIR=$7
READS_LIST=$8

echo "Starting Minimap2 Alignment..."
mkdir -p $ALIGN_DIR

#Extract all target read files' Accessions from provided list file
READ_INPUT_FILES=""
readarray ACCESSIONS_ARRAY < $READS_LIST
for ACCESSION in "${ACCESSIONS_ARRAY[@]}"
do
	READ_INPUT_FILES="${READS_DIR}/$(echo $ACCESSION | tr -d "\n").fastq $READ_INPUT_FILES"
done

minimap2 -t $THREADS --MD -a -z $Z_DROP -x $PRESET_VAL -Y $REF_GENOME $READ_INPUT_FILES > $OUTPUT_FILE
echo "Alignment complete!.."
