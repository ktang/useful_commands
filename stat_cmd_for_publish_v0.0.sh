#!/bin/bash
FOLD=2
#CUT=2
export FOLD
#export CUT
echo "fold = $FOLD" 
#echo "cut = $CUT" 

FR_DIFF=20
export FR_DIFF
echo "frac_diff = $FR_DIFF"

#CG=30
#CHG=15
#CHH=10

LEN=100

export LEN
#export CG
#export CHG
#export CHH

#echo "CG = $CG" 
#echo "CHG = $CHG" 
#echo "CHH = $CHH" 
#echo "length=$LEN"
#function useperl{
#	#perl -F "\t" -lane "print $_ if($F[-2] / ($F[-1] + 0.000001) >= $FOLD and $F[-2] >= $CUT)";
#	#  | perl -F"\t" -lane 'print $_ if($F[19] / ($F[20] + 0.000001) >= 2 and $F[19] >= 15  or $F[0] eq "chr")'  | less  
#}

#less raw/idm1_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | useperl | wc -l
#less raw/idm1_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | useperl | wc -l
#less raw/rdd_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | useperl | wc -l
#less raw/rdd_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt   | useperl | wc -l
#less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt| useperl | wc -l
#less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | useperl | wc -l

#less raw/rdd_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
#less raw/rdd_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt   | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
#less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt| perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
#less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
#less raw/idm1_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
#less raw/idm1_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l

#for i in *detail.txt; do echo $i;  less $i | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]", @F[3..$#F])) if( $F[12]-$F[18]>=$ENV{"CG"} or $F[14]-$F[20]>=$ENV{"CHG"} or $F[16]-$F[22]>=$ENV{"CHH"}  )' | wc -l; done

#  for i in *detail.txt; do echo $i;  less $i | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]", @F[3..$#F])) if( ( $F[2] -$F[1] +1 >= $ENV{"LEN"}  )  and (  $F[12]-$F[18]>=$ENV{"CG"} or $F[14]-$F[20]>=$ENV{"CHG"} or $F[16]-$F[22]>=$ENV{"CHH"} ) )' | wc -l; done

for i in *.txt; do echo $i; less $i | perl -F"\t" -lane ' $a = "$F[0]:$F[1]-$F[2]"; $l =$F[2] -  $F[1] + 1;  print join("\t", ( $a, $l, $F[10], $F[14],$F[18], $F[22],$F[26]  ) ) if ($l>= $ENV{"LEN"} ) ' | perl -lane 'print if($F[-4] / ($F[-3]+ 0.00001)  >= $ENV{"FOLD"}   and $F[-2] -$F[-1] >= $ENV{"FR_DIFF"}  )' | wc -l ; done

  
#   | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]" )) if( ( $F[2] -$F[1] >= 100 )  and (  $F[12]-$F[18]>= 30 or $F[14]-$F[20]>= 15 or $F[16]-$F[22]>= 10 ) )' | less