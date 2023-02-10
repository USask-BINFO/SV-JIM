#!/bin/bash

PYTHON_ENV=$1
threads=$2
minMAPQ=$3
minSupport=$4
minSVSize=$5
refGenomeFilePath=$6
minimap2OutputFilePathPrefix=$7
snifflesOutputFilePath=$8

source $PYTHON_ENV/bin/activate

echo "Starting Sniffles alignment w Minimap2..."
sniffles --threads $threads --mapq $minMAPQ --minsupport $minSupport --minsvlen $minSVSize --reference $refGenomeFilePath -i ${minimap2OutputFilePathPrefix}.sorted.bam -v $snifflesOutputFilePath
deactivate
echo "Sniffles complete..."
