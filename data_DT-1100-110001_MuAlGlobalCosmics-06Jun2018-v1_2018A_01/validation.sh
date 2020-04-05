#!/bin/sh
# ./createJobs.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_ 1 data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db MuAlGlobalCosmics-06Jun2018-v1_2018A.py --inputInBlocks -s data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A.sh --validationLabel data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A --b --user_mail youremail --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 1.6 --station123params 110001 --station4params 100001 --cscparams 100001 --useResiduals 1100 --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag 105X_dataRun2_v6 --createAlignNtuple --noCleanUp --noCSC --gprcdconnect sqlite_file:GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db --gprcd IdealGeometry --is_Alca --T0 --iscosmics

export ALIGNMENT_CAFDIR=`pwd`
mkdir files
mkdir out

cd /afs/cern.ch/work/g/grnewton/public/CMSSW_10_5_0/src
eval `scramv1 run -sh`
ALIGNMENT_AFSDIR=`pwd`
ALIGNMENT_ITERATION=1
ALIGNMENT_MAPPLOTS=None
ALIGNMENT_SEGDIFFPLOTS=None
ALIGNMENT_CURVATUREPLOTS=None
ALIGNMENT_EXTRAPLOTS=True
export ALIGNMENT_GPRCDCONNECT=sqlite_file:GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db
export ALIGNMENT_GPRCD=IdealGeometry
export ALIGNMENT_DO_DT=True
export ALIGNMENT_DO_CSC=False


# copy the scripts to CAFDIR
cd Alignment/MuonAlignmentAlgorithms/scripts/
cp -f plotscripts.py $ALIGNMENT_CAFDIR/
cp -f mutypes.py $ALIGNMENT_CAFDIR/
cp -f alignmentValidation.py $ALIGNMENT_CAFDIR/
cp -f phiedges_fitfunctions.C $ALIGNMENT_CAFDIR/
cp -f createTree.py $ALIGNMENT_CAFDIR/
cp -f signConventions.py $ALIGNMENT_CAFDIR/
cp -f convertSQLiteXML.py $ALIGNMENT_CAFDIR/
cp -f wrapperExtraPlots.sh $ALIGNMENT_CAFDIR/
cd -
cp Alignment/MuonAlignmentAlgorithms/test/browser/tree* $ALIGNMENT_CAFDIR/out/

# copy the results to CAFDIR
cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_report.py $ALIGNMENT_CAFDIR/files/
cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_report.py $ALIGNMENT_CAFDIR/files/
cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.root $ALIGNMENT_CAFDIR/files/
cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.root $ALIGNMENT_CAFDIR/files/
if [ -e data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_plotting.root ] && [ -e data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_plotting.root ]; then
  cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_plotting.root $ALIGNMENT_CAFDIR/files/
  cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_plotting.root $ALIGNMENT_CAFDIR/files/
  ALIGNMENT_MAPPLOTS=True
  ALIGNMENT_SEGDIFFPLOTS=True
  ALIGNMENT_CURVATUREPLOTS=True
fi

dtcsc=""
if [ $ALIGNMENT_DO_DT == "True" ]; then
  dtcsc="--dt"
fi
if [ $ALIGNMENT_DO_CSC == "True" ]; then
  dtcsc="${dtcsc} --csc"
fi


cd $ALIGNMENT_CAFDIR/
echo " ### Start running ###"
date

# do fits and median plots first 
./alignmentValidation.py -l data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 --iNprefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 -o $ALIGNMENT_CAFDIR/out  --createDirSructure --dt --csc --fit --median

if [ $ALIGNMENT_MAPPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 --iNprefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 -o $ALIGNMENT_CAFDIR/out  $dtcsc --map
fi

if [ $ALIGNMENT_SEGDIFFPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 --iNprefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 -o $ALIGNMENT_CAFDIR/out  $dtcsc --segdiff
fi                   

if [ $ALIGNMENT_CURVATUREPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 --iNprefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 -o $ALIGNMENT_CAFDIR/out  $dtcsc --curvature
fi

if [ $ALIGNMENT_EXTRAPLOTS == "True" ]; then
  if [ "zzzGPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db " != "zzz" ]; then
    cp -f $ALIGNMENT_AFSDIR/GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db  $ALIGNMENT_CAFDIR/
  fi
  cp $ALIGNMENT_AFSDIR/inertGlobalPositionRcd.db .
  ./convertSQLiteXML.py $ALIGNMENT_AFSDIR/data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db g0.xml --noLayers  --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD
  ./wrapperExtraPlots.sh -n $ALIGNMENT_ITERATION -i $ALIGNMENT_AFSDIR -0 g0.xml -z -w 110001 data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A
  mkdir out/extra
  cd data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A
  mv MB ../out/extra/
  mv ME ../out/extra/
  cd -
fi

# run simple diagnostic
./alignmentValidation.py -l data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 --iNprefix data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01 -o $ALIGNMENT_CAFDIR/out --dt --csc --diagnostic

# fill the tree browser structure: 
./createTree.py -i $ALIGNMENT_CAFDIR/out

timestamp=`date "+%y-%m-%d %H:%M:%S"`
echo "data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A.plots (${timestamp})" > out/label.txt

ls -l out/
timestamp=`date +%Y%m%d%H%M%S`
tar czf data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_${timestamp}.tgz out
cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_${timestamp}.tgz $ALIGNMENT_AFSDIR/

