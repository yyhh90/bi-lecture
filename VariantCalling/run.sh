#!/bin/bash

sample=$1
fq1=${sample}_1.fastq.gz
fq2=${sample}_2.fastq.gz

echo "##START: `date`" > ${sample}.log.txt

# PROGRAMS
BWA="/usr/bin/bwa"
SAMTOOLS="/usr/bin/samtools"
JAVA="/usr/bin/java"
PICARD="/home/ubuntu/etc/picard/picard.jar"
GATK="/home/ubuntu/etc/gatk/gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar"
SNPEFF="/home/ubuntu/Downloads/snpEff/snpEff.jar"

# RESOURCES
REFERENCE="/home/ubuntu/etc/reference/chr21.fa.gz"

# FILES
mapped_sam="${sample}.chr21.sam"
mapped_bam="${sample}.chr21.bam"
sorted_bam="${sample}.chr21.sorted.bam"
markdup_bam="${sample}.chr21.markdup.bam"
gvcf="${sample}.chr21.g.vcf.gz"
vcf="${sample}.chr21.vcf.gz"
annotated_vcf="${sample}.ann.vcf.gz"

# MAPPING
${BWA} mem -t 1 -R "@RG\tID:${sample}\tSM:${sample}\tPL:platform" ${REFERENCE} ${fq1} ${fq2} > ${mapped_sam}
${SAMTOOLS} view -Sb ${mapped_sam} > ${mapped_bam}
${SAMTOOLS} sort ${mapped_bam} -o ${sorted_bam}
${SAMTOOLS} index ${sorted_bam}

# MARK DUPLICATE
${JAVA} -jar ${PICARD} MarkDuplicates -I ${sorted_bam} -O ${markdup_bam} -M ${sample}.metrics.txt
${SAMTOOLS} index ${markdup_bam}

# VARIANT CALLING
${JAVA} -jar ${GATK} HaplotypeCaller -I ${markdup_bam} -O ${gvcf} -R ${REFERENCE} -ERC GVCF
${JAVA} -jar ${GATK} GenotypeGVCFs -V ${gvcf} -O ${vcf} -R ${REFERENCE}

# ANNOTATION
${JAVA} -jar -Xmx4000m ${SNPEFF} -v hg38 ${vcf} > ${annotated_vcf}

echo "##END: `date`" >> ${sample}.log.txt

