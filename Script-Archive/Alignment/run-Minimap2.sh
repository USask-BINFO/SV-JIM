#!/bin/bash

threads=$1
minimapDataPreset=$2
refGenomeFilePath=$3
longReadFilePath=$4
minimap2OutputFilePathPrefix=$5

echo "Starting Minimap2 align.."
if [ $((threads)) > 3 ];then
	minimapThreads=3
else
	minimapThreads=$((threads))
fi
minimap2 -t $minimapThreads --MD -a -z 600,200 -x $minimapDataPreset -Y $refGenomeFilePath $longReadFilePath > ${minimap2OutputFilePathPrefix}.sam
