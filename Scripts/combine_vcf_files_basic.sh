#!/bin/bash

TRUVARI_DIR=$1
shift #remove output file as first arg so remainder can be added to bcftools command (concats all files provided after output)

TP_FILES=""
FP_FILES=""
FN_FILES=""
for DIR in $*
do
	bcftools sort -o $DIR/tp.sorted.vcf $DIR/tp-call.vcf
	bgzip -c $DIR/tp.sorted.vcf > $DIR/tp.sorted.vcf.gz
	tabix $DIR/tp.sorted.vcf.gz
	TP_FILES="$DIR/tp.sorted.vcf.gz $TP_FILES"

        bcftools sort -o $DIR/fp.sorted.vcf $DIR/fp.vcf
        bgzip -c $DIR/fp.sorted.vcf > $DIR/fp.sorted.vcf.gz
        tabix $DIR/fp.sorted.vcf.gz
        FP_FILES="$DIR/fp.sorted.vcf.gz $FP_FILES"

        bcftools sort -o $DIR/fn.sorted.vcf $DIR/fn.vcf
        bgzip -c $DIR/fn.sorted.vcf > $DIR/fn.sorted.vcf.gz
        tabix $DIR/fn.sorted.vcf.gz
        FN_FILES="$DIR/fn.sorted.vcf.gz $FN_FILES"
done

echo "Combining VCF files for each type to $OUTPUT_FILE!.."
bcftools concat --allow-overlaps -o $TRUVARI_DIR/ALL/tp.vcf -O v `echo $TP_FILES`
bcftools sort -o $TRUVARI_DIR/ALL/tp.sorted.vcf $TRUVARI_DIR/ALL/tp.vcf
bcftools concat --allow-overlaps -o $TRUVARI_DIR/ALL/fp.vcf -O v `echo $FP_FILES`
bcftools sort -o $TRUVARI_DIR/ALL/fp.sorted.vcf $TRUVARI_DIR/ALL/fp.vcf
bcftools concat --allow-overlaps -o $TRUVARI_DIR/ALL/fn.vcf -O v `echo $FN_FILES`
bcftools sort -o $TRUVARI_DIR/ALL/fn.sorted.vcf $TRUVARI_DIR/ALL/fn.vcf
echo "Job's done!.."
