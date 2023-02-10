#!/bin/bash

readDataDir=$1
shortReadSRAFilePath=$2
longReadSRAFilePath=$3

echo "Spliting and converting Short-read PE file to Fastq format..."
fastq-dump -O $readDataDir --split-files $shortReadSRAFilePath
echo "Short-read file splitting complete!.."

echo "Converting Long-read file to Fastq format..."
fastq-dump -O $readDataDir $longReadSRAFilePath
echo "Long-read file converting complete!.."
