# lnl-tools

Collection of tools for use with OOLogNormalLung.

## collate_data.sh

syntax is ./collate_data.sh [csv filename with experiment timestamp eg Asthma_Data.csv] [column number in csv where
experiment timestamps are eg 2] [prefix to describe set of experiments eg Asthma_Study_Jan_2022] [fit profile used to
fit data eg lnl_recovery_BurrXII_DS] full example command to run in the terminal is "./process_data.sh Asthma_Data.csv
2 Asthma_Study_Jan_2022 lnl_recovery_BurrXII_DS" $n refers to the nth input to come after the command runs eg $3 calls
the prefix chosen this file runs from ones data folder eg data/coml-lognormal-lung/newc5233 for me on arcus, so you
must be in this directory for the command to work move to the correct directory using "cd $DATA" on arcus
