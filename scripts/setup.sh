#!/bin/bash
cmsrel CMSSW_12_1_0
cd CMSSW_12_1_0/src
cmsenv
mkdir SusyStopProduction
cd SusyStopProduction
git clone kaechb/SusyStopProduction
git clone git@github.com:cms-sw/genproductions.git
