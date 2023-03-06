#!/bin/bash

TRUVARI_DIR=$1
shift #remove output file as first arg so remainder can be added to bcftools command (concats all files provided after output)

TP_CALL_FILES=""
TP_BASE_FILES=""
FP_FILES=""
FN_FILES=""
for DIR in $*
do
	bcftools sort -o $DIR/tp-call.sorted.vcf $DIR/tp-call.vcf
	bgzip -c $DIR/tp-call.sorted.vcf > $DIR/tp-call.sorted.vcf.gz
	tabix $DIR/tp-call.sorted.vcf.gz
	TP_CALL_FILES="$DIR/tp-call.sorted.vcf.gz $TP_CALL_FILES"

        bcftools sort -o $DIR/tp-base.sorted.vcf $DIR/tp-base.vcf
        bgzip -c $DIR/tp-base.sorted.vcf > $DIR/tp-base.sorted.vcf.gz
        tabix $DIR/tp-base.sorted.vcf.gz
        TP_BASE_FILES="$DIR/tp-base.sorted.vcf.gz $TP_BASE_FILES"

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
bcftools concat --allow-overlaps -o $TRUVARI_DIR/tp-call.vcf -O v `echo $TP_CALL_FILES`
bcftools sort -o $TRUVARI_DIR/tp-call.sorted.vcf $TRUVARI_DIR/tp-call.vcf
bcftools concat --allow-overlaps -o $TRUVARI_DIR/tp-base.vcf -O v `echo $TP_BASE_FILES`
bcftools sort -o $TRUVARI_DIR/tp-base.sorted.vcf $TRUVARI_DIR/tp-base.vcf
bcftools concat --allow-overlaps -o $TRUVARI_DIR/fp.vcf -O v `echo $FP_FILES`
bcftools sort -o $TRUVARI_DIR/fp.sorted.vcf $TRUVARI_DIR/fp.vcf
bcftools concat --allow-overlaps -o $TRUVARI_DIR/fn.vcf -O v `echo $FN_FILES`
bcftools sort -o $TRUVARI_DIR/fn.sorted.vcf $TRUVARI_DIR/fn.vcf
echo "Job's done!.."
