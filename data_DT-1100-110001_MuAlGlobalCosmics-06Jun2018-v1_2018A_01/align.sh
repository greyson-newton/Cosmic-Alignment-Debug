#!/bin/sh
# ./createJobs.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_ 1 data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db MuAlGlobalCosmics-06Jun2018-v1_2018A.py --inputInBlocks -s data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A.sh --validationLabel data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A --b --user_mail youremail --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 1.6 --station123params 110001 --station4params 100001 --cscparams 100001 --useResiduals 1100 --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag 105X_dataRun2_v6 --createAlignNtuple --noCleanUp --noCSC --gprcdconnect sqlite_file:GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db --gprcd IdealGeometry --is_Alca --T0 --iscosmics

export ALIGNMENT_CAFDIR=`pwd`

cd /afs/cern.ch/work/g/grnewton/public/CMSSW_10_5_0/src
eval `scramv1 run -sh`
export ALIGNMENT_AFSDIR=`pwd`
export ALIGNMENT_INPUTDB=data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db
export ALIGNMENT_ITERATION=1
export ALIGNMENT_GLOBALTAG=105X_dataRun2_v6
export ALIGNMENT_TRACKERCONNECT=
export ALIGNMENT_TRACKERALIGNMENT=Alignments
export ALIGNMENT_TRACKERAPECONNECT=
export ALIGNMENT_TRACKERAPE=AlignmentErrorsExtended
export ALIGNMENT_TRACKERBOWSCONNECT=
export ALIGNMENT_TRACKERBOWS=TrackerSurfaceDeformations
export ALIGNMENT_GPRCDCONNECT=sqlite_file:GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db
export ALIGNMENT_GPRCD=IdealGeometry
export ALIGNMENT_ISCOSMICS=True
export ALIGNMENT_STATION123PARAMS=110001
export ALIGNMENT_STATION4PARAMS=100001
export ALIGNMENT_CSCPARAMS=100001
export ALIGNMENT_MINTRACKPT=30
export ALIGNMENT_MAXTRACKPT=200
export ALIGNMENT_MINTRACKP=0
export ALIGNMENT_MAXTRACKP=10000
export ALIGNMENT_MINTRACKERHITS=15
export ALIGNMENT_MAXTRACKERREDCHI2=10
export ALIGNMENT_ALLOWTIDTEC=True
export ALIGNMENT_TWOBIN=None
export ALIGNMENT_WEIGHTALIGNMENT=None
export ALIGNMENT_MINALIGNMENTHITS=5
export ALIGNMENT_COMBINEME11=True
export ALIGNMENT_MAXRESSLOPEY=10
export ALIGNMENT_CLEANUP=False
export ALIGNMENT_CREATEALIGNNTUPLE=True
export ALIGNMENT_RESIDUALSMODEL=pureGaussian
export ALIGNMENT_PEAKNSIGMA=1.6
export ALIGNMENT_USERESIDUALS=1100
export ALIGNMENT_DO_DT=True
export ALIGNMENT_DO_CSC=False
export ALIGNMENT_ISMC=None

cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/align_cfg.py data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/*.tmp  GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db  $ALIGNMENT_CAFDIR/

export ALIGNMENT_PLOTTINGTMP=`find data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/plotting*.root -maxdepth 1 -size +0 -print 2> /dev/null`

cd $ALIGNMENT_CAFDIR/
export ALIGNMENT_ALIGNMENTTMP=`find alignment*.tmp -maxdepth 1 -size +1k -print 2> /dev/null`
ls -l

cmsRun align_cfg.py
cp -f MuonAlignmentFromReference_report.py $ALIGNMENT_AFSDIR/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_report.py
cp -f MuonAlignmentFromReference_outputdb.db $ALIGNMENT_AFSDIR/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.db
cp -f MuonAlignmentFromReference_plotting.root $ALIGNMENT_AFSDIR/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.root

cd $ALIGNMENT_AFSDIR
./Alignment/MuonAlignmentAlgorithms/scripts/convertSQLiteXML.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.db data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.xml --noLayers --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD

export ALIGNMENT_ALIGNMENTTMP=`find data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/alignment*.tmp -maxdepth 1 -size +1k -print 2> /dev/null`
if [ "$ALIGNMENT_CLEANUP" == "True" ] && [ "zzz$ALIGNMENT_ALIGNMENTTMP" != "zzz" ]; then
  rm $ALIGNMENT_ALIGNMENTTMP
  echo " "
fi

# if it's not 1st or last iteration, do some clean up:
if [ "$ALIGNMENT_ITERATION" != "1" ] && [ "$ALIGNMENT_ITERATION" != "1" ]; then
  if [ "$ALIGNMENT_CLEANUP" == "True" ] && [ -e data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.root ]; then
    rm data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.root
  fi
fi

# if it's last iteration, apply chamber motion policy
if [ "$ALIGNMENT_ITERATION" == "1" ]; then
  # convert this iteration's geometry into detailed xml
  ./Alignment/MuonAlignmentAlgorithms/scripts/convertSQLiteXML.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01.db data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_extra.xml --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD
  echo "Perform motion policy "
  echo "/Alignment/MuonAlignmentAlgorithms/scripts/motionPolicyChamber.py data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.xml  data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_extra.xml data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_report.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.xml --nsigma 3"
  ./Alignment/MuonAlignmentAlgorithms/scripts/motionPolicyChamber.py       data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.xml  data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_extra.xml       data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_report.py       data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.xml       --nsigma 3
  echo "Convert the resulting xml into the final sqlite geometry "
  echo "./Alignment/MuonAlignmentAlgorithms/scripts/convertSQLiteXML.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.xml data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.db --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD"
  ./Alignment/MuonAlignmentAlgorithms/scripts/convertSQLiteXML.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.xml data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01_final.db --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD
fi

