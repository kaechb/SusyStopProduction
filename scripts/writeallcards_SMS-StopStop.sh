#!/bin/sh
JOBS="jobs"
TEMP="templatecards"
PROC="SMS-StopStop"
PART="_mStop-"

### Create cards and SLHAs for all mass points
#TODO: expand this to different mass points
for MSTOP in "950"; do
    for MNEUT in "100"; do
        for MCHARG in "525"; do


        
    MODEL=${PROC}${PART}${MSTOP}-${MCHARG}-${MNEUT}
    mkdir -p "${JOBS}/${MODEL}"
    cp ${TEMP}/${PROC}_run_card.dat "${JOBS}/${MODEL}/${MODEL}_run_card.dat"
    sed "s/%MSTOP%/${MSTOP}/g" ${TEMP}/${PROC}_proc_card.dat > "${JOBS}/${MODEL}/${MODEL}_proc_card0.dat"
    sed "s/%MNEUT%/${MNEUT}/g" "${JOBS}/${MODEL}/${MODEL}_proc_card0.dat" > "${JOBS}/${MODEL}/${MODEL}_proc_card1.dat"
    sed "s/%MCHARG%/${MCHARG}/g" "${JOBS}/${MODEL}/${MODEL}_proc_card1.dat" > "${JOBS}/${MODEL}/${MODEL}_proc_card.dat"
    rm "${JOBS}/${MODEL}/${MODEL}_proc_card0.dat"
    rm "${JOBS}/${MODEL}/${MODEL}_proc_card1.dat"

    sed "s/%MSTOP%/${MSTOP}/g" ${TEMP}/${PROC}_customizecards.dat > "${JOBS}/${MODEL}/${MODEL}_customize_card0.dat"
    sed "s/%MNEUT%/${MNEUT}/g" "${JOBS}/${MODEL}/${MODEL}_customize_card0.dat" > "${JOBS}/${MODEL}/${MODEL}_customize_card1.dat"
    sed "s/%MCHARG%/${MCHARG}/g" "${JOBS}/${MODEL}/${MODEL}_customize_card1.dat" > "${JOBS}/${MODEL}/${MODEL}_customizecards.dat"
    rm "${JOBS}/${MODEL}/${MODEL}_customize_card0.dat"
    rm "${JOBS}/${MODEL}/${MODEL}_customize_card1.dat"

    sed "s/%MSTOP%/${MSTOP}/g" ${TEMP}/${PROC}.slha > "${JOBS}/${MODEL}/${MODEL}0.slha"
    sed "s/%MNEUT%/${MNEUT}/g" "${JOBS}/${MODEL}/${MODEL}0.slha" > "${JOBS}/${MODEL}/${MODEL}1.slha"
    sed "s/%MCHARG%/${MCHARG}/g" "${JOBS}/${MODEL}/${MODEL}1.slha" > "${JOBS}/${MODEL}/${MODEL}.slha"
    rm "${JOBS}/${MODEL}/${MODEL}0.slha"
    rm "${JOBS}/${MODEL}/${MODEL}1.slha"
    
    
done
done
done
