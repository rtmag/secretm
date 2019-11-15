library('TFregulomeR')
rara <- loadPeaks(id = "MM1_HSA_HepG2_RARA", includeMotifOnly = TRUE)
write.table(rara,"HepG2_RARA.bed",sep="\t",quote=F,row.names=F,col.names=F)


annotatePeaks.pl HepG2_RARA.bed hg38 -annStats HepG2_RARA.annStats > HepG2_RARA.anno &
annotatePeaks.pl remap2018_RARA_nr_macs2_hg38_v1_2.bed hg38 -annStats remap2018_RARA_nr_macs2_hg38_v1_2.annStats > remap2018_RARA_nr_macs2_hg38_v1_2.anno &

more HepG2_RARA.anno| cut -f 8,9,10,16 > HepG2_RARA.txt
more remap2018_RARA_nr_macs2_hg38_v1_2.anno| cut -f 8,9,10,16 > remap2018_RARA_nr_macs2_hg38_v1_2.txt

###
#DW SRR
~/myPrograms/sra-tools/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump --split-files --gzip -Z SRR2056996 > SRR2056996.fastq

STAR --genomeDir /root/resources/mm10/ \
--readFilesCommand zcat \
--runThreadN 35 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/sjlab/deepa_tetoolkit/fastq/HCT116_siC_1_val_1.fq.gz \
/root/sjlab/deepa_tetoolkit/fastq/HCT116_siC_2_val_2.fq.gz \
--outFilterMultimapNmax 2 \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/sjlab/STAR/test_rna/sic1/siC_1_
