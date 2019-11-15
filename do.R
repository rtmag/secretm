library('TFregulomeR')
rara <- loadPeaks(id = "MM1_HSA_HepG2_RARA", includeMotifOnly = TRUE)
write.table(rara,"HepG2_RARA.bed",sep="\t",quote=F,row.names=F,col.names=F)


annotatePeaks.pl HepG2_RARA.bed hg38 -annStats HepG2_RARA.annStats > HepG2_RARA.anno &
annotatePeaks.pl remap2018_RARA_nr_macs2_hg38_v1_2.bed hg38 -annStats remap2018_RARA_nr_macs2_hg38_v1_2.annStats > remap2018_RARA_nr_macs2_hg38_v1_2.anno &

more HepG2_RARA.anno| cut -f 8,9,10,16 > HepG2_RARA.txt
more remap2018_RARA_nr_macs2_hg38_v1_2.anno| cut -f 8,9,10,16 > remap2018_RARA_nr_macs2_hg38_v1_2.txt
