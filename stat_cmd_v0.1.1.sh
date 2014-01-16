#!/bin/bash
#FOLD=4
#CUT=2
#export FOLD
#export CUT
#echo "fold = $FOLD" 
#echo "cut = $CUT" 

CG=30
CHG=15
CHH=10

LEN=100

export LEN
export CG
export CHG
export CHH

echo "CG = $CG" 
echo "CHG = $CHG" 
echo "CHH = $CHH" 
echo "length=$LEN"

#1 chr
#      2 start
#      3 end
#      4 hyper_DMC_num
#      5 hyper_DMC_type
#      6 hypo_DMC_num
#      7 hypo_DMC_type
#      8 CG
#      9 CHG
#     10 CHH
#     11 total
#     12 wmCG_mut
#     13 wmCHG_mut
#     14 wmCHH_mut
#     15 wmC_mut
#     16 wmCG_wt
#     17 wmCHG_wt
#     18 wmCHH_wt
#  19 wmC_wt

<<COMMENT1
echo "comment"
    20 fmCG_mut
     21 fmCHG_mut
     22 fmCHH_mut
     23 fmC_mut
     24 fmCG_wt
     25 fmCHG_wt
     26 fmCHH_wt
     27 fmC_wt
     28 mmCG_mut
     29 mmCHG_mut
     30 mmCHH_mut
     31 mmC_mut
     32 mmCG_wt
     33 mmCHG_wt
     34 mmCHH_wt
     35 mmC_wt
COMMENT1


#for i in *detail.txt; do echo $i;  less $i | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]", @F[3..$#F])) if( $F[12]-$F[18]>=$ENV{"CG"} or $F[14]-$F[20]>=$ENV{"CHG"} or $F[16]-$F[22]>=$ENV{"CHH"}  )' | wc -l; done

  for i in *.txt; do echo $i;  less $i | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]", @F[3..$#F])) if( ( $F[2] -$F[1] +1 >= $ENV{"LEN"}  )  and (  $F[11]-$F[15]>=$ENV{"CG"} or $F[12]-$F[16]>=$ENV{"CHG"} or $F[13]-$F[27]>=$ENV{"CHH"} ) )' | wc -l; done
  
#   | perl -F"\t" -lane 'print join("\t", ("$F[0]:$F[1]-$F[2]" )) if( ( $F[2] -$F[1] >= 100 )  and (  $F[12]-$F[18]>= 30 or $F[14]-$F[20]>= 15 or $F[16]-$F[22]>= 10 ) )' | less