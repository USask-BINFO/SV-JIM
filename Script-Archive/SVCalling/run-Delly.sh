#!/bin/bash

minMAPQ=$1
dellyBCFOutputFilePath=$2
refGenomeFilePath=$3
bowtie2OutputFilePathPrefix=$4
dellyVCFOutputFilePath=$5

echo "Starting Delly alignment w Bowtie..."
delly call -q $minMAPQ -o $dellyBCFOutputFilePath -g $refGenomeFilePath ${bowtie2OutputFilePathPrefix}.sorted.bam
bcftools view -O v -o $dellyVCFOutputFilePath $dellyBCFOutputFilePath
echo "Delly complete..."


