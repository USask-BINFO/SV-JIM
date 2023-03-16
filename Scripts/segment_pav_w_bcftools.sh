#!/bin/bash

ALL_SV_FILE=$1
SV_FILE_PREFIX=$2

# Segment only those SV types identifiable by PAV based on their SVTYPE field found in the VCF output
bcftools filter -i 'SVTYPE == "DEL"' -o ${SV_FILE_PREFIX}.DEL.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INS"' -o ${SV_FILE_PREFIX}.INS.vcf $ALL_SV_FILE
bcftools filter -i 'SVTYPE == "INV"' -o ${SV_FILE_PREFIX}.INV.vcf $ALL_SV_FILE

#Segment SV types by size thresholds
for TYPE in DEL INS INV
do
	bcftools filter -e 'INFO/SVLEN > 100 || INFO/SVLEN < -100' -o ${SV_FILE_PREFIX}.${TYPE}.SSm.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
	bcftools filter -i '(INFO/SVLEN > 100 && INFO/SVLEN <= 1000) || (INFO/SVLEN < -100 && INFO/SVLEN >= -1000)' -o ${SV_FILE_PREFIX}.${TYPE}.Sml.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
	bcftools filter -i '(INFO/SVLEN > 1000 && INFO/SVLEN <= 100000) || (INFO/SVLEN < -1000 && INFO/SVLEN >= -100000)' -o ${SV_FILE_PREFIX}.${TYPE}.Med.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
	bcftools filter -i 'INFO/SVLEN > 100000 || INFO/SVLEN < -100000' -o ${SV_FILE_PREFIX}.${TYPE}.Lrg.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
done
