#!/bin/bash

ALL_SV_FILE=$1
SV_FILE_PREFIX=$2

# Segment VCF files by type for all types based on the values found in the SVTYPE field of each  VCF output
bcftools filter -i 'SVTYPE == "DEL"' -o ${SV_FILE_PREFIX}.DEL.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INS"' -o ${SV_FILE_PREFIX}.INS.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "DUP" || SVTYPE == "DUP:INT" || SVTYPE == "DUP:TANDEM"' -o ${SV_FILE_PREFIX}.DUP.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INV"' -o ${SV_FILE_PREFIX}.INV.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "BND"' -o ${SV_FILE_PREFIX}.BND.vcf $ALL_SV_FILE
