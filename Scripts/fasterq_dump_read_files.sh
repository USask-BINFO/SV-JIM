#!/bin/bash

THREADS=$1
READS_DIR=$2
READ_FILES_LIST=$3

echo "Reformatting SRA Files for all Accessions detailed in $READ_FILES_LIST to FASTQ..."
mkdir -p $READS_DIR

readarray ACCESSIONS_ARRAY < $READ_FILES_LIST
for ACCESSION in "${ACCESSIONS_ARRAY[@]}"
do
	STRIP_ACCESSION=$(echo $ACCESSION | tr -d "\n")
	#fasterq-dump --threads $THREADS -O $READS_DIR ${READS_DIR}/${STRIP_ACCESSION}.sra
        if [[ ! -f "${READS_DIR}/${STRIP_ACCESSION}.fastq" ]]; then
		fastq-dump -O $READS_DIR ${READS_DIR}/${STRIP_ACCESSION}.sra
        else
                echo "${READS_DIR}/${STRIP_ACCESSION}.fastq already Exists! Skipping fastq-dump..."
	fi
	#fastq-dump -O $READS_DIR ${READS_DIR}/${STRIP_ACCESSION}.sra
done

echo "Reformatting complete!.."
