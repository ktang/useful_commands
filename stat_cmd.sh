#!/bin/bash
FOLD=4
CUT=2
export FOLD
export CUT

echo "fold = $FOLD" 
echo "cut = $CUT" 

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

less raw/rdd_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
less raw/rdd_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt   | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt| perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
less raw/JKZ134_ros1-4_s1_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
less raw/idm1_kaust_pool_vs_JKZ131_Col0_hyper_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l
less raw/idm1_kaust_pool_vs_JKZ131_Col0_hypo_JacobsenMethod_Bin200_sliding50_gap0_BH_adj_p0.001_depth5_v3.0.txt  | perl -F"\t" -lane 'print $_ if($F[-2] / ($F[-1] + 0.000001) >= $ENV{"FOLD"} and $F[-2] >= $ENV{"CUT"})' | wc -l