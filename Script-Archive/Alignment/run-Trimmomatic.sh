#!/bin/bash

trimmomaticFilePath=$1
trimmomaticJARFile=$2
shortReadPEFilePathPrefix=$3

echo "Running Trimmomatic..."
java -jar $trimmomaticFilePath/$trimmomaticJARFile PE ${shortReadPEFilePathPrefix}_1.fastq ${shortReadPEFilePathPrefix}_2.fastq ${shortReadPEFilePathPrefix}_1_Paired.fastq ${shortReadPEFilePathPrefix}_1_Unpaired.fastq ${shortReadPEFilePathPrefix}_2_Paired.fastq ${shortReadPEFilePathPrefix}_2_Unpaired.fastq ILLUMINACLIP:$trimmomaticFilePath/adapters/TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50
