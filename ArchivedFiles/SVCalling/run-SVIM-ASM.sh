#!/bin/bash

PYTHON_ENV=$1
minSVMAPQ=$2
minSVSize=$3
maxSVSize=$4
svimOutputDir=$5
minimap2OutputFilePathPrefix=$6
refGenomeFilePath=$7


echo "Setting up python environment.."
source $PYTHON_ENV/bin/activate
echo "Environment established..."

echo "Starting SVIM alignment..."
svim-asm haploid --min_mapq $minSVMAPQ --min_sv_size $minSVSize --max_sv_size $maxSVSize $svimOutputDir $minimap2OutputFilePathPrefix.sorted.bam $refGenomeFilePath
echo "SVIM complete..."
deactivate
