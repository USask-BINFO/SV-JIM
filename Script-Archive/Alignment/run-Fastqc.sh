#!/bin/bash

threads=$1
shortReadPEFilePathPrefix=$2
fastQCOutputDir=$3

echo "Reviewing PE fastq file 1 with FastQC..."
fastqc -t $threads ${shortReadPEFilePathPrefix}_1.fastq -o $fastQCOutputDir

echo "Reviewing PE fastq file 2 with FastQC..."
fastqc -t $threads ${shortReadPEFilePathPrefix}_2.fastq -o $fastQCOutputDir
