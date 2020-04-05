#!/bin/sh

cd data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/gather000.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather000" -u youremail.tamu.edu  gather000.sh
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/gather001.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather001" -u youremail.tamu.edu  gather001.sh
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/gather002.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather002" -u youremail.tamu.edu  gather002.sh
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/hadd.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_hadd" -u youremail -w "ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather000) && ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather001) && ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather002)" hadd.sh
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/align.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_align" -u youremail -w "ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather000) && ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather001) && ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_gather002)" align.sh
echo data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/validation.sh
bsub -R "type==SLC6_64" -q cmscaf1nd -J "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_validation" -u youremail -w "ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_align) && ended(data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_hadd)" validation.sh
cd ..
