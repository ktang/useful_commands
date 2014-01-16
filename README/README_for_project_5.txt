Project_5(start from Nov 16,2010)

most used
;date;perl -e 'print "\a"'

Name
using BWA and IGV to view whole genome sequencing data.

&&&&&&&&&&&&&&
0 directory description
&&&&&&&&&&&&&&
dir	./try
is used to test command, software, 
I download .sam file from before to test IGV

BWA has been installed.
TAIR9 index for BWA is in
/Users/kaitang/Desktop/TAIR/BWA_index

bwa output should be in
/Users/kaitang/Desktop/Project_5/BWA_output


should record the parameter I used.


&&&&&&&&&&&&&&
1 orignal data
&&&&&&&&&&&&&&


all the original data are in
/Users/kaitang/Desktop/zhu_lab_data_orignal

There are four library on Nov 16.
Mut77
Srs1_gl_luc
ros2
#32

They are all Col-0 background. Mut77 and Srs1_gl_luc are backcross F2(dark_luc). Srs1_gl_luc and ros2 should be same mutant.

&&&&&&&&&&&&&&
2 BWA map
&&&&&&&&&&&&&&
(1)  index db
date; bwa index -a is TAIR9_chr_all.fas ;date;
Tue Nov 16 17:22:28 PST 2010
[bwa_index] Pack FASTA... 1.31 sec
[bwa_index] Reverse the packed sequence... 0.45 sec
[bwa_index] Construct BWT for the packed sequence...
[bwa_index] 50.43 seconds elapse.
[bwa_index] Construct BWT for the reverse packed sequence...
[bwa_index] 49.93 seconds elapse.
[bwa_index] Update BWT... 0.50 sec
[bwa_index] Update reverse BWT... 0.47 sec
[bwa_index] Construct SA from BWT and Occ... 16.44 sec
[bwa_index] Construct SA from reverse BWT and Occ... 16.40 sec
Tue Nov 16 17:24:59 PST 2010


##############################
Nov 16
first try default parameter on ros2_2
not default

@@@@@@@@@@@@
for ros2_2
@@@@@@@@@@@@
-l 20
date;bwa aln -l 20 /Users/kaitang/Desktop/TAIR/BWA_index/TAIR9_chr_all.fas ~/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_2/flowcell18_lane5_pair1.fastq.fastq > ros2_ID25_ros2_2_flowcell18_lane5_pair1_l_20.sai ;date
#start time:Tue Nov 16 20:58:09 PST 2010
#end time: Tue Nov 16 21:33:06 PST 2010


date;bwa aln -l 20 /Users/kaitang/Desktop/TAIR/BWA_index/TAIR9_chr_all.fas ~/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_2/flowcell18_lane5_pair2.fastq.fastq > ros2_ID25_ros2_2_flowcell18_lane5_pair2_l_20.sai ;date
#Tue Nov 16 21:01:23 PST 2010
#Tue Nov 16 21:40:25 PST 2010

date; bwa sampe /Users/kaitang/Desktop/TAIR/BWA_index/TAIR9_chr_all.fas ros2_ID25_ros2_2_flowcell18_lane5_pair1_l_20.sai ros2_ID25_ros2_2_flowcell18_lane5_pair2_l_20.sai ~/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_2/flowcell18_lane5_pair1.fastq.fastq ~/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_2/flowcell18_lane5_pair2.fastq.fastq > ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.sam ;date
#Tue Nov 16 22:24:24 PST 2010
#Tue Nov 16 22:30:01 PST 2010


@@@@@@@@@@@@@@@@@@@
samtools
@@@@@@@@@@@@@@@@@@@
date;samtools faidx /Users/kaitang/Desktop/TAIR/BWA_index/TAIR9_chr_all.fas;date

old sam->bam
#date; samtools import /Users/kaitang/Desktop/TAIR/BWA_index/TAIR9_chr_all.fas.fai ./ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.sam ./#ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.bam;date
#Tue Nov 16 22:59:50 PST 2010
#[samopen] SAM header is present: 7 sequences.
#Tue Nov 16 23:03:07 PST 2010

date;samtools sort ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.bam ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.sorted;date
Tue Nov 16 23:55:40 PST 2010
[bam_sort_core] merging from 5 files...
Wed Nov 17 00:01:43 PST 2010

date; samtools index ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.sorted.bam;date;perl -e 'print "\a"';
Wed Nov 17 00:04:04 PST 2010
Wed Nov 17 00:04:18 PST 2010


$$$$$$$$$$$$$$ new command to sam->bam
samtools view -bS aln.sam > aln.bam
date;samtools view -bS ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.sam > ./ros2_ID25_ros2_2_flowcell18_lane5_pair12_l_20.bam;date;perl -e 'print "\a"'



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Nov 17 
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
no display in IGV, possible reason is that the chromosome name is not exactly the same.
change chr to Chr to see .
this morning do ros2_1

I also want to write a perl script to change chr to Chr in ros2_2 sam file.
all the perl code should be in ~/Desktop/perl_code/Project_5
name:

write a perl script 


321m28.449s for two 6.51G files.
160m45.741s for two 2.89G
218m47.540s for tow 4.85G

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Nov 20
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
1 generate C24 chr.
write a perl script, core is
perl -e '$a ="AAAAA"; substr($a,1,1,"C");print "$a\n"'
ACAAA


time bwa aln -n 2 -k 1 -l 25 ~/Desktop/C24_genome/BWA_index/C24_TAIR9_5Chr.fas


#########################################################
Nov 23, 2010
combine two ros2 fastq together.
time cat ./ros2_1/flowcell18_lane3_pair1_trim_end.fastq ./ros2_2/flowcell18_lane5_pair1_trim_end.fastq > ros2_lane3_5_pair1_trim_end.fastq


trim adaptor
#pair 1
time fastx_clipper -a GATCGGAAGAGCGGTTCAGCAGGAATGCCGAG -l 20 -n -v -i ros2_lane3_5_pair1_trim_end.fastq -o ros2_lane3_5_pair1_trim_end_adapter.fastq >ros2_lane3_5_pair1_trim_adapter.stat

#pair2
time fastx_clipper -a AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -l 20 -n -v -i ros2_lane3_5_pair2_trim_end.fastq -o  ros2_lane3_5_pair2_trim_end_adapter.fastq>  ros2_lane3_5_pair2_trim_adapter.stat


#fastx_clipper -a GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -l 20 -n -v -i adaptor_3RV.fasta -o trim_ad.fasta > trim_ad.stat 

time soap -a ros2_lane3_5_pair1_trim_end_adapter.fastq -b ros2_lane3_5_pair2_trim_end_adapter.fastq -D /Users/kaitang/Desktop/TAIR/SOAP_index/TAIR9_Chr_all_bigBegin.fas.index -o /Users/kaitang/Desktop/Project_5/soap_output/ros2_ucr_illumina_ID25/ros2_combine_trim_adaper_pair_m0x1000n2r0M4.soapout -2 /Users/kaitang/Desktop/Project_5/soap_output/ros2_ucr_illumina_ID25/ros2_combine_trim_adaper_SE_m0x1000n2r0M4.soapout -m 0 -x 1000 -n 2 -r 0 -M 4
Total Pairs: 12660530 PE
Paired:      4884 ( 0.04%) PE
Singled:     15452562 (61.03%) SE
Total Elapsed Time:         2921.94
      - Load Index Table:      1.59
      - Alignment:          2920.35

SOAPaligner/soap2 End
Tue Nov 23 21:06:34 2010


real	48m42.135s
user	47m9.686s
sys	0m19.732s


time ~/Desktop/Software/SOAP2/SOAPsnpZ/soapsnp -i ros2_combine_trim_adaper_pair_m0x1000n2r0M4_sorted.soapout -d ~/Desktop/TAIR/SOAP_index/TAIR9_Chr_all_bigBegin.fas -o ros2_combine_trim_adaper_pair_m0x1000n2r0M4_sorted.snp -t -u -q -L 77 -M qulity.matrix
real	164m24.482s
user	153m29.110s
sys	0m42.686s




time soapsnp -i ros2_combine_trim_adaper_SE_m0x1000n2r0M4_sorted.soapout -d ~/Desktop/TAIR/SOAP_index/TAIR9_Chr_all_bigBegin.fas -o ros2_combine_trim_adaper_SE_m0x1000n2r0M4_qL77.snp -q -L 77
real	227m6.019s
user	218m35.823s
sys	1m3.300s



batch-keen-178-125:Project_5 kaitang$ date;time ./find_pairs_for_pair_end_reads_v2.pl /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_lane3_5_pair1_trim_end_adapter.fastq /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/ros2_lane3_5_pair2_trim_end_adapter.fastq /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/clean_fasta_for_soap/ros2_lane3_5_pair1_clean.fasta /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/clean_fasta_for_soap/ros2_lane3_5_pair2_clean.fasta /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/clean_fasta_for_soap/ros2_lane3_5_single_clean.fasta > /Users/kaitang/Desktop/zhu_lab_data_orignal/ros2_ID25/clean_fasta_for_soap/pair_single.stat;date;perl -e 'print "\a"'
Wed Nov 24 15:53:44 PST 2010

real	213m14.403s
user	209m28.293s
sys	2m39.118s
Wed Nov 24 19:26:59 PST 2010


