#!/bin/bash

SV_FILE_A_PREFIX=$1
ALL_SV_A=$2
SV_FILE_B_PREFIX=$3
ALL_SV_B=$4
OVERLAP=$5
INTERSECT_PREFIX=$6

sizeA=`cat $ALL_SV_A | wc -l`
sizeB=`cat $ALL_SV_B | wc -l`

if [ $sizeA -lt $sizeB ]
then
	SMALLER=$SV_FILE_A_PREFIX
	LARGER=$SV_FILE_B_PREFIX
else
	SMALLER=$SV_FILE_B_PREFIX
	LARGER=$SV_FILE_A_PREFIX
fi

for TYPE in DEL INS INV
do
	bedtools intersect -f $OVERLAP -F $OVERLAP -a ${SMALLER}.${TYPE}.vcf -b ${LARGER}.${TYPE}.vcf | sort -k 1,1 -k 2,2n | uniq > ${INTERSECT_PREFIX}.${TYPE}.vcf # intersect files
	grep "^##" ${SMALLER}.${TYPE}.vcf > ${INTERSECT_PREFIX}.results.${TYPE}.vcf #prepend vcf headers
	echo -e "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT\tSAMPLE" >> ${INTERSECT_PREFIX}.results.${TYPE}.vcf # add column labels
	cat ${INTERSECT_PREFIX}.${TYPE}.vcf >> ${INTERSECT_PREFIX}.results.${TYPE}.vcf # add vcf entries to result file
done
