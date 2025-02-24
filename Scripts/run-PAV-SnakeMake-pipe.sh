#!/bin/bash

CORES=$1
ANALYSIS_DIR=$2
REF_GENOME=$3
QRY_GENOME=$4
QRY_ID=$5
WORKING_DIR=`pwd` # Stores pipeline's working directory to allow for return


#PAV Snakemake operates on zipped ref genome file, verify it exists before proceeding
if [ ! -f ${REF_GENOME}.gz ]
then
	echo "Zipping and indexing $REF_GENOME as PAV setup!.."
	bgzip -c $REF_GENOME > ${REF_GENOME}.gz
	faidx ${REF_GENOME}.gz
fi

#Build config.json for PAV based on inputs
REF_ABS_PATH=`echo "$(cd "$(dirname "$REF_GENOME")"; pwd)/$(basename "$REF_GENOME")"` #Convert Relative to Abs path for PAV Config
echo "{" > $ANALYSIS_DIR/config.json; echo "	\"reference\": \"${REF_ABS_PATH}.gz\"" >> $ANALYSIS_DIR/config.json; echo "}" >> $ANALYSIS_DIR/config.json

#Add required query information file to PAV before starting execution
QRY_ABS_PATH=`echo "$(cd "$(dirname "$QRY_GENOME")"; pwd)/$(basename "$QRY_GENOME")"` #Convert Relative to Abs path for PAV Config
echo "NAME	HAP1	HAP2" > $ANALYSIS_DIR/assemblies.tsv
echo "$QRY_ID	$QRY_ABS_PATH" >> $ANALYSIS_DIR/assemblies.tsv

#Change to PAV working directory before starting per instruction on PAV repo
echo "Changing directory to $ANALYSIS_DIR and starting PAV's SnakeMake pipeline!.."
cd $ANALYSIS_DIR


if [ ! -e ./Snakefile ]
then
        ln -s $PAV/Snakefile ./
fi

#Check if runlocal in ANALYSIS_DIR is successfully linked to run local in $PAV and link if not
#if [ ! -e ./runlocal ]
#then
#	ln -s $PAV/files/run_scripts/runlocal.sh ./
#fi



#Run PAV
#./runlocal #$CORES
snakemake -s ${PAV}/Snakefile --cores $CORES

#Return to SV-JIM Working directory
echo "Pipeline complete! Returning to $WORKING_DIR!.."
cd $WORKING_DIR
