#!/bin/bash

threads=$1
refGenomeFilePath=$2
refGenomeIndexFilePathPrefix=$3
shortReadPEFilePathPrefix=$4
bowtie2OutputFilePathPrefix=$5

echo "Building Bowtie2 index for the reference genome..."
bowtie2-build $refGenomeFilePath $refGenomeIndexFilePathPrefix

echo "Starting Bowtie2..."
bowtie2 --threads $threads -x $refGenomeIndexFilePathPrefix -1 ${shortReadPEFilePathPrefix}_1_Paired.fastq -2 ${shortReadPEFilePathPrefix}_2_Paired.fastq -q --no-discordant --very-sensitive --score-min L,-10,-0.1 -S ${bowtie2OutputFilePathPrefix}.sam
