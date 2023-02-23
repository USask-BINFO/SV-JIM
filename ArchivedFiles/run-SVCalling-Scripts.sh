#!/bin/bash

svCallConfigFilePath="./SVCalling/configSVCall.config" # update to reflect correct path
source $svCallConfigFilePath

## 1) Run Delly short-read SV calling
./SVCalling/run-Delly.sh $minMAPQ $dellyBCFOutputFilePath $refGenomeFilePath $bowtie2OutputFilePathPrefix $dellyVCFOutputFilePath

## 2) Run Manta short-read SV calling
./SVCalling/run-Manta.sh $bowtie2OutputFilePathPrefix $refGenomeFilePath $threads

## 3) Run cuteSV long-read SV calling
./SVCalling/run-cuteSV.sh $PYTHON_ENV $minSVSize $maxSVSize $minSupport $minimap2OutputFilePathPrefix $refGenomeFilePath $cuteSVOutputDir $cuteSVOutputFileName

## 4) Run Sniffles long-read SV calling
./SVCalling/run-Sniffles.sh $PYTHON_ENV $threads $minMAPQ $minSupport $minSVSize $refGenomeFilePath $minimap2OutputFilePathPrefix $snifflesOutputFilePath

## 5) Run SVIM long-read SV calling
./SVCalling/run-SVIM.sh $PYTHON_ENV $minSVSize $maxSVSize $svimOutputDir $minimap2OutputFilePathPrefix $refGenomeFilePath


