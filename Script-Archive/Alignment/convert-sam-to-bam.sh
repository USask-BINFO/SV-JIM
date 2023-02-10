#!/bin/bash

threads=$1
bowtie2OutputFilePathPrefix=$2
minimap2OutputFilePathPrefix=$3
samtoolThreads=$((threads-1))

echo "Starting Bowtie2 SR SAM File Conversion to BAM, sorting, and Indexing..."
samtools view -@ $samtoolThreads -b -o ${bowtie2OutputFilePathPrefix}.bam ${bowtie2OutputFilePathPrefix}.sam
echo "SAM File converted to BAM..."
samtools sort -@ $samtoolThreads -o ${bowtie2OutputFilePathPrefix}.sorted.bam ${bowtie2OutputFilePathPrefix}.bam
echo "BAM File sorted..."
samtools index -@ $samtoolThreads ${bowtie2OutputFilePathPrefix}.sorted.bam
echo "BAM File indexed..."

echo "Starting Minimap2 SAM File Conversion to BAM, sorting, and Indexing..."
samtools view -@ $samtoolThreads -b -o ${minimap2OutputFilePathPrefix}.bam ${minimap2OutputFilePathPrefix}.sam
echo "SAM File converted to BAM..."
samtools sort -@ $samtoolThreads -o ${minimap2OutputFilePathPrefix}.sorted.bam ${minimap2OutputFilePathPrefix}.bam
echo "BAM File sorted..."
samtools index -@ $samtoolThreads ${minimap2OutputFilePathPrefix}.sorted.bam
echo "BAM File indexed..."
