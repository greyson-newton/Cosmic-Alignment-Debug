#/bin/sh
# ./createJobs.py data_DT-1100-111111_2017B_CMSSW925p2_SingMu_MuAlCalIsoMuv1_92XdataRun2Promptv5_T0_ 3 data_DT-1100-111111_SingleMuon_Run2016G_MuAlCalIsolatedMu_278820_280385_8_0_24_Rerecov1_03.db SingleMuon_Run2017B-MuAlCalIsolatedMu-PromptReco-v1_297031_297723.py --json Cert_294927-297723_13TeV_PromptReco_Collisions17_JSON.txt --inputInBlocks -s data_DT-1100-111111_2017B_CMSSW925p2_SingMu_MuAlCalIsoMuv1_92XdataRun2Promptv5_T0.sh --validationLabel data_DT-1100-111111_2017B_CMSSW925p2_SingMu_MuAlCalIsoMuv1_92XdataRun2Promptv5_T0 --b --user_mail youremail --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 1.6 --station123params 111111 --station4params 101111 --cscparams 100001 --useResiduals 1100 --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag 92X_dataRun2_Prompt_v5 --createAlignNtuple --noCleanUp --noCSC --gprcdconnect sqlite_file:GPR_July11_2017_SW924_Run2017B_dL4_iter1.db --gprcd IdealGeometry --is_Alca --T0

export ALIGNMENT_CAFDIR=`pwd`

cd /afs/cern.ch/work/g/grnewton/public/CMSSW_10_5_0/src
eval `scramv1 run -sh`
export ALIGNMENT_AFSDIR=`pwd`

export ALIGNMENT_INPUTFILES='/store/data/Run2017B/SingleMuon/ALCARECO/MuAlCalIsolatedMu-PromptReco-v1/000/297/485/00000/8E642754-485B-E711-85E9-02163E019D18.root /store/data/Run2017B/SingleMuon/ALCARECO/MuAlCalIsolatedMu-PromptReco-v1/000/297/722/00000/A641580E-D35E-E711-85D7-02163E0119EE.root'
export ALIGNMENT_ITERATION=1
export ALIGNMENT_JOBNUMBER=247
export ALIGNMENT_MAPPLOTS=True
export ALIGNMENT_SEGDIFFPLOTS=True
export ALIGNMENT_CURVATUREPLOTS=True
export ALIGNMENT_GLOBALTAG=92X_dataRun2_Prompt_v5
export ALIGNMENT_INPUTDB=data_DT-1100-111111_SingleMuon_Run2016G_MuAlCalIsolatedMu_278820_280385_8_0_24_Rerecov1_03.db
export ALIGNMENT_TRACKERCONNECT=
export ALIGNMENT_TRACKERALIGNMENT=Alignments
export ALIGNMENT_TRACKERAPECONNECT=
export ALIGNMENT_TRACKERAPE=AlignmentErrorsExtended
export ALIGNMENT_TRACKERBOWSCONNECT=
export ALIGNMENT_TRACKERBOWS=TrackerSurfaceDeformations
export ALIGNMENT_GPRCDCONNECT=sqlite_file:GPR_July11_2017_SW924_Run2017B_dL4_iter1.db
export ALIGNMENT_GPRCD=IdealGeometry
export ALIGNMENT_ISCOSMICS=None
export ALIGNMENT_STATION123PARAMS=111111
export ALIGNMENT_STATION4PARAMS=101111
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
export ALIGNMENT_JSON=Cert_294927-297723_13TeV_PromptReco_Collisions17_JSON.txt
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

cp -f data_DT-1100-111111_2017B_CMSSW925p2_SingMu_MuAlCalIsoMuv1_92XdataRun2Promptv5_T0_01/gather_cfg.py data_DT-1100-111111_SingleMuon_Run2016G_MuAlCalIsolatedMu_278820_280385_8_0_24_Rerecov1_03.db GPR_July11_2017_SW924_Run2017B_dL4_iter1.db  $ALIGNMENT_CAFDIR/
cd $ALIGNMENT_CAFDIR/
cmsRun gather_cfg.py
cp -f *.tmp plotting*.root $ALIGNMENT_AFSDIR/data_DT-1100-111111_2017B_CMSSW925p2_SingMu_MuAlCalIsoMuv1_92XdataRun2Promptv5_T0_01/
