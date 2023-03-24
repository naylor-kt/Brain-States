#!/bin/bash

# In this script we will take the ALFF of the mean time series

MTS_ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

mkdir -p $HOME/BrainStates_Test/Alternative_Analysis

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis/"
MTS_path="$HOME/BrainStates_Test/Mean_Time_Series"

cond=(as ns vs)


#Calculation of ALFF for the whole brain

mkdir -p ${alt_analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do
    awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}' ${MTS_path}/Unsmoothed/Restricted/Whole_Brain/${s}/${s}-${c}-psc-Rtf-MTS.txt > ${alt_analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-MTS-ALFF.txt
done

#Calculation of fALFF for the whole brain
mkdir -p ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Wide_SD
mkdir -p ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Calculation

for c in ${cond[@]}; do
    awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}' ${MTS_path}/Unsmoothed/Wide/Whole_Brain/${s}/${s}-${c}-psc-Wtf-MTS.txt > ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD.txt

    cat ${alt_analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-MTS-ALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD.txt > ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Calculation/${s}-${c}-fALFF-calc.txt

    awk 'NR==1{a=$0} NR==2{b=$1} END {print a/b}' ${alt_analysis_path}/fALFF/Whole_Brain/${s}/Calculation/${s}-${c}-fALFF-calc.txt > ${alt_analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-MTS-fALFF.txt
done

########################### Repeat for the masked ROIs ##############################
region=(AC HG PT MGB V1)
hemi=(lh rh)

#Calculation of ALFF for the ROIs
for r in ${region[@]}; do

    mkdir -p ${alt_analysis_path}/ALFF/${r}/${s}/
    

    for c in ${cond[@]}; do
        awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}' ${MTS_path}/Unsmoothed/Restricted/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}.txt > ${alt_analysis_path}/ALFF/${r}/${s}/${s}-${c}-MTS-ALFF-${r}.txt
    done

    #Calculation of fALFF for the ROIs
    mkdir -p ${alt_analysis_path}/fALFF/${r}/${s}/Wide_SD
    mkdir -p ${alt_analysis_path}/fALFF/${r}/${s}/Calculation
    
    for c in ${cond[@]}; do
        awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}' ${MTS_path}/Unsmoothed/Wide/${r}/${s}/${s}-${c}-psc-Wtf-MTS-${r}.txt > ${alt_analysis_path}/fALFF/${r}/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD-${r}.txt

        cat ${alt_analysis_path}/ALFF/${r}/${s}/${s}-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD-${r}.txt > ${alt_analysis_path}/fALFF/${r}/${s}/Calculation/${s}-${c}-fALFF-calc-${r}.txt

        awk 'NR==1{a=$0} NR==2{b=$1} END {print a/b}' ${alt_analysis_path}/fALFF/${r}/${s}/Calculation/${s}-${c}-fALFF-calc-${r}.txt > ${alt_analysis_path}/fALFF/${r}/${s}/${s}-${c}-MTS-fALFF-${r}.txt
    done

            ###### Repeat for the ROI in each hemisphere individually
        for h in ${hemi[@]}; do
        
            mkdir -p ${alt_analysis_path}/ALFF/${r}/${h}/${s}/
    
                
            for c in ${cond[@]}; do
                awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}' ${MTS_path}/Unsmoothed/Restricted/${r}/${h}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-${h}.txt > ${alt_analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-MTS-ALFF-${r}-${h}.txt
            done

            #Calculation of fALFF for the ROIs
            mkdir -p ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Wide_SD
            mkdir -p ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Calculation
            
            for c in ${cond[@]}; do
                awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}'  ${MTS_path}/Unsmoothed/Wide/${r}/${h}/${s}/${s}-${c}-psc-Wtf-MTS-${r}-${h}.txt > ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD-${r}.txt

                cat ${alt_analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-MTS-ALFF-${r}-${h}.txt ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Wide_SD/${s}-${c}-MTS-Wtf-SD-${r}.txt > ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Calculation/${s}-${c}-fALFF-calc-${r}-${h}.txt

                awk 'NR==1{a=$0} NR==2{b=$1} END {print a/b}' ${alt_analysis_path}/fALFF/${r}/${h}/${s}/Calculation/${s}-${c}-fALFF-calc-${r}-${h}.txt > ${alt_analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-MTS-fALFF-${r}-${h}.txt
            done
        done
done

}

export -f MTS_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'MTS_ALFF {1}' ::: ${s[@]}

    
