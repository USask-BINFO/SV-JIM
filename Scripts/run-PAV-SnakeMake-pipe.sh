#!/bin/bash

CORES=$1
ANALYSIS_DIR=$2
REF_GENOME=$3
WORKING_DIR=`pwd` # Stores pipeline's working directory to allow for return

#PAV Snakemake operates on zipped ref genome file, verify it exists before proceeding
if [ ! -f ${REF_GENOME}.gz ]
then
	echo "Zipping and indexing $REF_GENOME as PAV setup!.."
	bgzip -c $REF_GENOME > ${REF_GENOME}.gz
	faidx ${REF_GENOME}.gz
fi

#Change to PAV working directory before starting per instruction on PAV repo
echo "Changing directory to $ANALYSIS_DIR and starting PAV's SnakeMake pipeline!.."
cd $ANALYSIS_DIR

#Check if runlocal in ANALYSIS_DIR is successfully linked to run local in $PAV and link if not
if [ ! -e ./runlocal ]
then
	ln -s $PAV/runlocal ./
fi

#Run PAV
./runlocal $CORES

#Return to SV-JIM Working directory
echo "Pipeline complete! Returning to $WORKING_DIR!.."
cd $WORKING_DIR
