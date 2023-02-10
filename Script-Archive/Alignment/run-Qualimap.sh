#!/bin/bash

bowtie2OutputFilePathPrefix=$1
qualimapReportDirPath=$2

echo "Reviewing Bowtie2 output file..."
qualimap bamqc -bam ${bowtie2OutputFilePathPrefix}.sorted.bam -outdir $qualimapReportDirPath -outformat PDF --java-mem-size=8G
