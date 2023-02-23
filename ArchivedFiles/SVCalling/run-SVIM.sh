#!/bin/bash

PYTHON_ENV=$1
minSVSize=$2
maxSVSize=$3
svimOutputDir=$4
minimap2OutputFilePathPrefix=$5
refGenomeFilePath=$6


echo "Setting up python environment.."
source $PYTHON_ENV/bin/activate
echo "Environment established..."

echo "Starting SVIM alignment..."
svim alignment --min_sv_size $minSVSize --max_sv_size $maxSVSize $svimOutputDir $minimap2OutputFilePathPrefix.sorted.bam $refGenomeFilePath
echo "SVIM complete..."
deactivate
