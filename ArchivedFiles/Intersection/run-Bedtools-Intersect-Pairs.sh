#!/bin/bash

svCaller1=$1
name1=$2
svCaller2=$3
name2=$4
intersectOutputDir=$5

echo "Intersecting ${name1} with ${name2}.."
bedtools intersect -f 0.5 -F 0.5 -a ${svCaller1}.results.DEL.vcf -b ${svCaller2}.results.DEL.vcf | sort | uniq > $intersectOutputDir/${name1}-${name2}.results.DEL.vcf
echo "DEL intersection complete"
bedtools intersect -f 0.5 -F 0.5 -a ${svCaller1}.results.INS.vcf -b ${svCaller2}.results.INS.vcf | sort | uniq > $intersectOutputDir/${name1}-${name2}.results.INS.vcf
echo "INS intersection complete"
bedtools intersect -f 0.5 -F 0.5 -a ${svCaller1}.results.DUP.vcf -b ${svCaller2}.results.DUP.vcf | sort | uniq > $intersectOutputDir/${name1}-${name2}.results.DUP.vcf
echo "DUP intersection complete"
bedtools intersect -f 0.5 -F 0.5 -a ${svCaller1}.results.INV.vcf -b ${svCaller2}.results.INV.vcf | sort | uniq > $intersectOutputDir/${name1}-${name2}.results.INV.vcf
echo "INV intersection complete"
bedtools intersect -f 0.5 -F 0.5 -a ${svCaller1}.results.BND.vcf -b ${svCaller2}.results.BND.vcf | sort | uniq > $intersectOutputDir/${name1}-${name2}.results.BND.vcf
echo "BND intersection complete"
