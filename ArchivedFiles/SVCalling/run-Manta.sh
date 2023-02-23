#!/bin/bash

bowtie2OutputFilePathPrefix=$1
refGenomeFilePath=$2
threads=$3


echo "Starting Config Manta..."
configManta.py --bam=${bowtie2OutputFilePathPrefix}.sorted.bam --referenceFasta=$refGenomeFilePath
echo "Starting workflow..."
./MantaWorkflow/runWorkflow.py -m local -j $threads

