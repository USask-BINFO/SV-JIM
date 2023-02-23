#!/bin/bash

PYTHON_ENV=$1
minSVSize=$2
maxSVSize=$3
minSupport=$4
minimap2OutputFilePathPrefix=$5
refGenomeFilePath=$6
cuteSVOutputDir=$7
cuteSVOutputFileName=$8

source $PYTHON_ENV/bin/activate

echo "Starting cuteSV alignment..."
cuteSV --min_size $minSVSize --max_size $maxSVSize -s $minSupport --max_cluster_bias_INS 100 --diff_ratio_merging_INS 0.3 --max_cluster_bias_DEL 100 --diff_ratio_merging_DEL 0.3 ${minimap2OutputFilePathPrefix}.sorted.bam $refGenomeFilePath $cuteSVOutputDir/$cuteSVOutputFileName $cuteSVOutputDir 
deactivate
echo "cuteSV complete..."
deactivate
