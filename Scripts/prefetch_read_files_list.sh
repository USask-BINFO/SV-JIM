#!/bin/bash

READS_DIR=$1
FILE_MAX=$2
READ_FILES_LIST=$3

echo "Starting prefetching of all Accessions detailed in $READ_FILES_LIST..."
mkdir -p $READS_DIR

readarray ASCESSIONS_ARRAY < $READ_FILES_LIST
for ACCESSION in "${ACCESSIONS_ARRAY[@]}"
do
	prefetch --max-size $FILE_MAX -o ${ACCESSION}.sra $ACCESSION
done

echo"Prefetching complete!.."
