#!/bin/bash

inputFile=$1
outputDir=$2
SVCaller=$3

echo "Segmenting SVs by type..."
bcftools filter -i 'SVTYPE == "DEL"' -o $outputDir/${SVCaller}.results.DEL.vcf $inputFile
bcftools filter -i 'SVTYPE == "INS"' -o $outputDir/${SVCaller}.results.INS.vcf $inputFile
bcftools filter -i 'SVTYPE == "DUP" || SVTYPE == "DUP:INT" || SVTYPE == "DUP:TANDEM"' -o $outputDir/${SVCaller}.results.DUP.vcf $inputFile
bcftools filter -i 'SVTYPE == "INV"' -o $outputDir/${SVCaller}.results.INV.vcf $inputFile
bcftools filter -i 'SVTYPE == "BND"' -o $outputDir/${SVCaller}.results.BND.vcf $inputFile
echo "Done segmenting!.."
