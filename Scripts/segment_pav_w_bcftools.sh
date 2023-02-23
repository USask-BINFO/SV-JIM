#!/bin/bash

ALL_SV_FILE=$1
SV_FILE_PREFIX=$2

# Segment only those SV types identifiable by PAV base don their SVTYPE field found in the VCF output
bcftools filter -i 'SVTYPE == "DEL"' -o ${SV_FILE_PREFIX}.DEL.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INS"' -o ${SV_FILE_PREFIX}.INS.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INV"' -o ${SV_FILE_PREFIX}.INV.vcf $ALL_SV_FILE
