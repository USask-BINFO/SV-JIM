#!/bin/bash

READS_DIR=$1
FILE_MAX=$2
READ_FILES_LIST=$3

echo "Starting prefetching of all Accessions detailed in $READ_FILES_LIST..."
mkdir -p $READS_DIR

readarray ACCESSIONS_ARRAY < $READ_FILES_LIST
for ACCESSION in "${ACCESSIONS_ARRAY[@]}"
do
	STRIP_ACCESSION=$(echo $ACCESSION | tr -d "\n")
	if [[ ! -f "${READS_DIR}/${STRIP_ACCESSION}.sra" ]]; then
    		prefetch --max-size $FILE_MAX -o ${READS_DIR}/${STRIP_ACCESSION}.sra ${STRIP_ACCESSION}
	else
		echo "${READS_DIR}/${STRIP_ACCESSION}.sra already Exists! Skipping prefetch..."
	fi
	#prefetch --max-size $FILE_MAX -o ${READS_DIR}/${STRIP_ACCESSION}.sra ${STRIP_ACCESSION}
done

echo "Prefetching complete!.."
