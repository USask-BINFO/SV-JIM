#!/bin/bash

TRUVARI_DIR=$1
shift #remove output file as first arg so remainder can be added to bcftools command (concats all files provided after output)

TP_CALL_FILES=""
TP_BASE_FILES=""
FP_FILES=""
FN_FILES=""

for DIR in $*
do
	echo $DIR
	bcftools sort -o $DIR/tp-comp.sorted.vcf $DIR/tp-comp.vcf
	bgzip -c $DIR/tp-comp.sorted.vcf > $DIR/tp-comp.sorted.vcf.gz
	tabix $DIR/tp-comp.sorted.vcf.gz
	TP_CALL_FILES="$DIR/tp-comp.sorted.vcf.gz $TP_CALL_FILES"

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

echo "Combining VCF files for each type to $TRUVARI_DIR!.."
TP_FILES_HAVE_ENTRIES=0 #Assume all related tp vcf files do not contain any records, if tp-base is non-empty tp-comp should be too (they have to have found a match in each)
for BASE_FILE in $TP_BASE_FILES
do
	if [ "$(bcftools view -H "${BASE_FILE}" | wc -l)" -ne 0 ];then
		TP_FILES_HAVE_ENTRIES=1 #At least one entry found, set to true
		break #break early, only need one file to posses an entry to avoid seg fault?
	fi
done

if [ $TP_FILES_HAVE_ENTRIES -eq 1 ]; then
	bcftools concat --allow-overlaps -o $TRUVARI_DIR/tp-comp.vcf -O v `echo $TP_CALL_FILES`
	bcftools sort -o $TRUVARI_DIR/tp-comp.sorted.vcf $TRUVARI_DIR/tp-comp.vcf
	bcftools concat --allow-overlaps -o $TRUVARI_DIR/tp-base.vcf -O v `echo $TP_BASE_FILES`
	bcftools sort -o $TRUVARI_DIR/tp-base.sorted.vcf $TRUVARI_DIR/tp-base.vcf
else # just store header formbase caller since contactenated record would be empty anyway
	FIRST_TP_BASE_FILE=`echo $TP_BASE_FILES | awk '{print $1;}'`
	FIRST_TP_CALL_FILE=`echo $TP_CALL_FILES | awk '{print $1;}'`
	bcftools view -h $FIRST_TP_CALL_FILE > $TRUVARI_DIR/tp-comp.vcf
	bcftools view -h $FIRST_TP_CALL_FILE > $TRUVARI_DIR/tp-comp.sorted.vcf
	bcftools view -h $FIRST_TP_BASE_FILE > $TRUVARI_DIR/tp-base.vcf
	bcftools view -h $FIRST_TP_BASE_FILE > $TRUVARI_DIR/tp-base.sorted.vcf
fi


FP_FILES_HAVE_ENTRIES=0 #Assume all related fp vcf files do not contain any records
for EACH_FP_FILE in $FP_FILES
do
        if [ "$(bcftools view -H "${EACH_FP_FILE}" | wc -l)" -ne 0 ];then
                FP_FILES_HAVE_ENTRIES=1 #At least one entry found, set to true
                break #break early, only need one file to posses an entry to avoid seg fault?
        fi
done

if [ $FP_FILES_HAVE_ENTRIES -eq 1 ]; then
	bcftools concat --allow-overlaps -o $TRUVARI_DIR/fp.vcf -O v `echo $FP_FILES`
	bcftools sort -o $TRUVARI_DIR/fp.sorted.vcf $TRUVARI_DIR/fp.vcf
else
	FIRST_FP_FILE=`echo $FP_FILES | awk '{print $1;}'`
	bcftools view -h $FIRST_FP_FILE > $TRUVARI_DIR/fp.vcf
        bcftools view -h $FIRST_FP_FILE > $TRUVARI_DIR/fp.sorted.vcf
fi


FN_FILES_HAVE_ENTRIES=0 #Assume all related fp vcf files do not contain any records 
for EACH_FN_FILE in $FN_FILES
do
        if [ "$(bcftools view -H "${EACH_FN_FILE}" | wc -l)" -ne 0 ];then
                FN_FILES_HAVE_ENTRIES=1 #At least one entry found, set to true
                break #break early, only need one file to posses an entry to avoid seg fault?
        fi
done

if [ $FP_FILES_HAVE_ENTRIES -eq 1 ]; then
	bcftools concat --allow-overlaps -o $TRUVARI_DIR/fn.vcf -O v `echo $FN_FILES`
	bcftools sort -o $TRUVARI_DIR/fn.sorted.vcf $TRUVARI_DIR/fn.vcf
else
        FIRST_FN_FILE=`echo $FN_FILES | awk '{print $1;}'`
        bcftools view -h $FIRST_FN_FILE > $TRUVARI_DIR/fn.vcf
        bcftools view -h $FIRST_FN_FILE > $TRUVARI_DIR/fn.sorted.vcf

fi

echo "Job's done!.."
