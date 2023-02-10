#!/bin/bash

intersectConfigFilePath="./Intersection/configIntersect.config" # update to reflect correct path
source $intersectConfigFilePath

## 1) Segment Delly VCF results
./Intersection/segment-VCF-type-and-size.sh $dellyVCFFileName $dellyOutputDir $dellyName

## 2) Segment Manta VCF results
./Intersection/segment-VCF-type-and-size.sh $mantaVCFFileName $mantaOutputDir $mantaName

## 3) Segment CuteSV VCF results
./Intersection/segment-VCF-type-and-size.sh $cuteSVVCFFileName $cuteSVOutputDir $cuteSVName

## 4) Segment CuteSV VCF results
./Intersection/segment-VCF-type-and-size.sh $snifflesVCFFileName $snifflesOutputDir $snifflesName

## 5) Segment CuteSV VCF results
./Intersection/segment-VCF-type-and-size.sh $svimVCFFileName $svimOutputDir $svimName



## 6) Intersect Manta-Delly VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $mantaOutputDir/$mantaName $mantaName $dellyOutputDir/$dellyName $dellyName $intersectOutputDir

## 7) Intersect Sniffles-CuteSV VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $snifflesOutputDir/$snifflesName $snifflesName $cuteSVOutputDir/$cuteSVName $cuteSVName $intersectOutputDir

## 8) Intersect SVIM-CuteSV VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $svimOutputDir/$svimName $svimName $cuteSVOutputDir/$cuteSVName $cuteSVName $intersectOutputDir

## 9) Intersect SVIM-Sniffles VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $svimOutputDir/$svimName $svimName $snifflesOutputDir/$snifflesName $snifflesName $intersectOutputDir

## 10) Intersect all long-read VCF results
./Intersection/run-Bedtools-Intersect-Pairs.sh $intersectOutputDir/svim-sniffles "all" $cuteSVOutputDir/$cuteSVName "long-read" $intersectOutputDir


