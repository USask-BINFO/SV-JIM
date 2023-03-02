#!/bin/bash

SV_FILE_A_PREFIX=$1
ALL_SV_A=$2
SV_FILE_B_PREFIX=$3
ALL_SV_B=$4
OVERLAP=$5
INTERSECT_PREFIX=$6

for TYPE in DEL INS DUP INV BND
do
	bedtools intersect -f $OVERLAP -F $OVERLAP -a ${SV_FILE_A_PREFIX}.results.${TYPE}.vcf -b ${SV_FILE_B_PREFIX}.${TYPE}.vcf | sort -k 1,1 -k 2,2n | uniq > ${INTERSECT_PREFIX}.${TYPE}.vcf # intersect files
	grep "^##" ${SV_FILE_A_PREFIX}.results.${TYPE}.vcf > ${INTERSECT_PREFIX}.results.${TYPE}.vcf #prepend vcf headers
	echo -e "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\tSAMPLE" >> ${INTERSECT_PREFIX}.results.${TYPE}.vcf # add column labels
	cat ${INTERSECT_PREFIX}.${TYPE}.vcf >> ${INTERSECT_PREFIX}.results.${TYPE}.vcf # add vcf entries to result file
done
