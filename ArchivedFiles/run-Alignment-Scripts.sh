#!/bin/bash

alignConfigFilePath="./Alignment/configAlignment.config" # update to reflect correct path
source $alignConfigFilePath

## 1) Convert Run files from SRA to FASTQ format
./Alignment/sraFileToFastq.sh $readDataDir $shortReadSRAFilePath $longReadSRAFilePath

## 2) Run Trimmomatic on Short Read Files
./Alignment/run-Trimmomatic.sh $trimmomaticFilePath $trimmomaticJARFile $shortReadPEFilePathPrefix

## 3) Perform short-read quality control
./Alignment/run-Fastqc.sh $threads $shortReadPEFilePathPrefix $fastQCOutputDir

## 4) Run short-read alignment with Bowtie2
./Alignment/run-Bowtie2.sh $threads $refGenomeFilePath $refGenomeIndexFilePathPrefix $shortReadPEFilePathPrefix $bowtie2OutputFilePathPrefix

## 5) Run long-read alignment with Minimap2
./Alignment/run-Minimap2.sh $threads $minimapDataPreset $refGenomeFilePath $longReadFilePath $minimap2OutputFilePathPrefix

## 6) Convert SAM files to BAM, sort, and index BAM files
./Alignment/convert-sam-to-bam.sh $threads $bowtie2OutputFilePathPrefix $minimap2OutputFilePathPrefix

## 7) Run Qualimap alignment quality control
./Alignment/run-Qualimap.sh $bowtie2OutputFilePathPrefix $qualimapReportDirPath


