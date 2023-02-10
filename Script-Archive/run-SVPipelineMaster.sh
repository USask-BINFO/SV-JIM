#!/bin/bash

masterConfigFilePath="./configSVPipelineMaster.config" # update to reflect correct path
source $masterConfigFilePath

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

## 8) Run Delly short-read SV calling
./SVCalling/run-Delly.sh $minMAPQ $dellyBCFOutputFilePath $refGenomeFilePath $bowtie2OutputFilePathPrefix $dellyVCFOutputFilePath

## 9) Run Manta short-read SV calling
./SVCalling/run-Manta.sh $bowtie2OutputFilePathPrefix $refGenomeFilePath $threads

## 10) Run cuteSV long-read SV calling
./SVCalling/run-cuteSV.sh $PYTHON_ENV $minSVSize $maxSVSize $minSupport $minimap2OutputFilePathPrefix $refGenomeFilePath $cuteSVOutputDir $cuteSVOutputFileName

## 11) Run Sniffles long-read SV calling
./SVCalling/run-Sniffles.sh $PYTHON_ENV $threads $minMAPQ $minSupport $minSVSize $refGenomeFilePath $minimap2OutputFilePathPrefix $snifflesOutputFilePath

## 12) Run SVIM long-read SV calling
./SVCalling/run-SVIM.sh $PYTHON_ENV $minSVSize $maxSVSize $svimOutputDir $minimap2OutputFilePathPrefix $refGenomeFilePath

## 13) Segment Delly VCF results
./Intersection/segment-VCF-type-and-size.sh $dellyVCFFileName $dellyOutputDir $dellyName

## 14) Segment Manta VCF results
./Intersection/segment-VCF-type-and-size.sh $mantaVCFFileName $mantaOutputDir $mantaName

## 15) Segment CuteSV VCF results
./Intersection/segment-VCF-type-and-size.sh $cuteSVVCFFileName $cuteSVOutputDir $cuteSVName

## 16) Segment Sniffles VCF results
./Intersection/segment-VCF-type-and-size.sh $snifflesVCFFileName $snifflesOutputDir $snifflesName

## 17) Segment SVIM VCF results
./Intersection/segment-VCF-type-and-size.sh $svimVCFFileName $svimOutputDir $svimName

## 18) Intersect Manta-Delly VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $mantaOutputDir/$mantaName $mantaName $dellyOutputDir/$dellyName $dellyName $intersectOutputDir

## 19) Intersect Sniffles-CuteSV VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $snifflesOutputDir/$snifflesName $snifflesName $cuteSVOutputDir/$cuteSVName $cuteSVName $intersectOutputDir

## 20) Intersect SVIM-CuteSV VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $svimOutputDir/$svimName $svimName $cuteSVOutputDir/$cuteSVName $cuteSVName $intersectOutputDir

## 21) Intersect SVIM-Sniffles VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $svimOutputDir/$svimName $svimName $snifflesOutputDir/$snifflesName $snifflesName $intersectOutputDir

## 22) Intersect all long-read VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $intersectOutputDir/svim-sniffles "all" $cuteSVOutputDir/$cuteSVName "long-read" $intersectOutputDir
