# SusyStopProduction
# SusyStopEvents Generation:
First run
```
cmsrel CMSSW_12_1_0
cd CMSSW_12_1_0/src
```
Then run the scripts in scripts/setup.sh, this clones the repo
 ## Outline:
 1. Generate MadGraph calculations of Feynmann Matrix elements -> Gridpack
 2. Generate MadEvents with gridpack -> .lhe files
 3. Hadronization in Pythia
 4. Fastsim 
 5. Skimming and nanoAOD?
 

## Gridpack:

`SusyStopProduction/scripts/writeallcards_SMS-StopStop.sh`

*  this creates the cards for the gridpack generation, here you need to change the masses of interest (in our case a script creates many different sets of cards, note that for each mass constellation we need a grid pack)
* 3 main ingredients are created with the script:
	1.  run_card changes depending on run (we just cp that from the current one)
	2. proc_card this describes the processes that we want to generate, we only generate here the stops

	3. customize_cards, this is really important as this sets the mass during genereation in madgraph

	(4.) it also generate a .slha which is needed for Pythia showering later
* Now move all the .dat cards to `genproductions/bin/MadGraph5_aMCatNLO/cards`, 
* `/gridpack_generation.sh SMS-T2X1tbWX0-950-525-100 cards/SMS-T2X1tbWX0-950-525-100\n\n`
 this creates a tar.xzf from which madevents can be generated, see below
## MadEvents 
 
`runcmsgrid.sh <NEvents> <RandomSeed> <NumberOfCPUs>`
* This generates an .lhe file, which can be used with pythia for hadronization

Running pythia to shower Madgraph gridpacks:

```
./runPythiaJob.sh SMS_STOP /nfs/dust/cms/user/kaechben/GenLHEfiles/GridpackWorkflow/test/cards/SMS-StopStop_mStop-950-525-100.slha 80 ./ /nfs/dust/cms/user/kaechben/SMS_test_MadGraph/cmsgrid_final.lhe 2

```
behind the curtain, this creates a genfragment.py with the currect values for qcut, the slha and the NJETMAX. This is then fed into cmsDriver.py with the following command:
```
cmsDriver.py Configuration/GenProduction/python/genfragment.py --mc --eventcontent RAWSIM --datatier GEN-SIM --conditions auto:run2_mc --step GEN --filein file:${INFILES} --fileout file:${GENFILE} -n -1
````


