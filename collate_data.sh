#!/bin/bash

# syntax is ./collate_data.sh [csv filename with experiment timestamp eg Asthma_Data.csv] [column number in csv where
# experiment timestamps are eg 2] [prefix to describe set of experiments eg Asthma_Study_Jan_2022] [fit profile used to
# fit data eg lnl_recovery_BurrXII_DS] full example command to run in the terminal is "./process_data.sh Asthma_Data.csv
# 2 Asthma_Study_Jan_2022 lnl_recovery_BurrXII_DS" $n refers to the nth input to come after the command runs eg $3 calls
# the prefix chosen this file runs from ones data folder eg data/coml-lognormal-lung/newc5233 for me on arcus, so you
# must be in this directory for the command to work move to the correct directory using "cd $DATA" on arcus

if [ ! -d ./Collated_Fits ]; then

mkdir Collated_Fits

fi

filename=$3_$4
mkdir Collated_Fits/$filename

rm ./Collated_Fits/$filename'_output.csv'

for timestamp in $(cut -d, -f$2 '$1' | sed 1d)

do

for directory in $timestamp*lung/fits/$4
do find $directory | xargs grep -nr "vResidual"  | sed -e 's/\//,/g' | sort -nt, -k6 | head -n 1 >> Collated_Fits/$filename'_output.csv'
done

done

for jobid in $(cut -d, -f4 Collated_Fits/$filename'_output.csv')
do
find *lung/fits/$4/$jobid/*data.txt -execdir cp {} $DATA/Collated_Fits/$filename/{} \;
done

for jobid in $(cut -d, -f4 Collated_Fits/$filename'_output.csv')
do
find *lung/fits/$1/$jobid/*data.csv -execdir cp {} $DATA/Collated_Fits/$filename/{} \;
find *lung/fits/$1/$jobid/*params.csv -execdir cp {} $DATA/Collated_Fits/$filename/{} \;
find *lung/fits/$1/$jobid/*all.pdf -execdir cp {} $DATA/Collated_Fits/$filename/{} \;
done
