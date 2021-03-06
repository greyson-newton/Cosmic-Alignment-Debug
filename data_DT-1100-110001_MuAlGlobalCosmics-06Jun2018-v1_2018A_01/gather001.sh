#/bin/sh
# ./createJobs.py data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_ 1 data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db MuAlGlobalCosmics-06Jun2018-v1_2018A.py --inputInBlocks -s data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A.sh --validationLabel data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A --b --user_mail youremail --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 1.6 --station123params 110001 --station4params 100001 --cscparams 100001 --useResiduals 1100 --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag 105X_dataRun2_v6 --createAlignNtuple --noCleanUp --noCSC --gprcdconnect sqlite_file:GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db --gprcd IdealGeometry --is_Alca --T0 --iscosmics

export ALIGNMENT_CAFDIR=`pwd`

cd /afs/cern.ch/work/g/grnewton/public/CMSSW_10_5_0/src
eval `scramv1 run -sh`
export ALIGNMENT_AFSDIR=`pwd`

export ALIGNMENT_INPUTFILES='/store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/1007CE4F-8673-E811-936F-00215A49197E.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/9A7A3701-C274-E811-86FB-00215AAA5746.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/AE83BAD9-7B74-E811-A978-00215A490902.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/70618BBE-E073-E811-85BA-38EAA78E2C94.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/900304D9-C174-E811-BD84-3417EBE70003.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/B8175AAD-7E74-E811-BC90-441EA1616D30.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/38D4AB43-B573-E811-8B4D-441EA1616DE6.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/B61689E0-CF73-E811-81BF-D48564456546.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/7E893A68-7F73-E811-B935-38EAA78D8F94.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/5A3B2F01-C274-E811-AB9F-00215AAA5746.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/562CFA8F-AD74-E811-A876-E4115BCE00BE.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/82F3F16A-8671-E811-A32D-FA163ED89392.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/1CC6AC6F-E473-E811-84A8-441EA161DC8E.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/8E0CBC4E-AC73-E811-A2E1-441EA1615F8A.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/58B8F857-4574-E811-9114-3C4A92F8DC66.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/646DAE32-BC74-E811-9D5E-D4856445D5D6.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/3448F4D7-C174-E811-BA4B-7CD30AC030A2.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/26C732C2-8D73-E811-826F-984BE16440C6.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/CA6D1D7C-DA73-E811-BD0C-38EAA78D8960.root /store/data/Run2018A/Cosmics/ALCARECO/MuAlGlobalCosmics-06Jun2018-v1/80000/D609B4D2-7B74-E811-90FC-8CDCD4A99E60.root'
export ALIGNMENT_ITERATION=1
export ALIGNMENT_JOBNUMBER=1
export ALIGNMENT_MAPPLOTS=True
export ALIGNMENT_SEGDIFFPLOTS=True
export ALIGNMENT_CURVATUREPLOTS=True
export ALIGNMENT_GLOBALTAG=105X_dataRun2_v6
export ALIGNMENT_INPUTDB=data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db
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
export ALIGNMENT_MUONCOLLECTIONTAG=
export ALIGNMENT_MINTRACKPT=30
export ALIGNMENT_MAXTRACKPT=200
export ALIGNMENT_MINTRACKP=0
export ALIGNMENT_MAXTRACKP=10000
export ALIGNMENT_MAXDXY=0.2
export ALIGNMENT_MINTRACKERHITS=15
export ALIGNMENT_MAXTRACKERREDCHI2=10
export ALIGNMENT_MINNCROSSEDCHAMBERS=1
export ALIGNMENT_ALLOWTIDTEC=True
export ALIGNMENT_TWOBIN=None
export ALIGNMENT_WEIGHTALIGNMENT=None
export ALIGNMENT_MINALIGNMENTHITS=5
export ALIGNMENT_COMBINEME11=True
export ALIGNMENT_MAXEVENTS=-1
export ALIGNMENT_SKIPEVENTS=0
export ALIGNMENT_MAXRESSLOPEY=10
export ALIGNMENT_DO_DT=True
export ALIGNMENT_DO_CSC=False
export ALIGNMENT_JSON=
export ALIGNMENT_CREATEMAPNTUPLE=False
#export ALIGNMENT_CREATEALIGNNTUPLE=True
export ALIGNMENT_PREFILTER=False
export ALIGNMENT_T0CORR=True
export ALIGNMENT_ISALCARECO=True
export ALIGNMENT_ISMC=None
export ALIGNMENT_STORELAYERDT=None
export ALIGNMENT_STORELAYERCSC=None

if [ "zzz$ALIGNMENT_JSON" != "zzz" ]; then
  cp -f $ALIGNMENT_JSON $ALIGNMENT_CAFDIR/
fi

cp -f data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/gather_cfg.py data_DT-1100-111111_2018UL_IOV1_CMSSW106_JSON-313041-320377_dataRun2_MuAl_v1_01.db GPR_Aug03_2019_SW1060_GT106X_dataRun2_newTkAl_v18_IOV2_dL_iter1.db  $ALIGNMENT_CAFDIR/
cd $ALIGNMENT_CAFDIR/
cmsRun gather_cfg.py
cp -f *.tmp plotting*.root $ALIGNMENT_AFSDIR/data_DT-1100-110001_MuAlGlobalCosmics-06Jun2018-v1_2018A_01/
