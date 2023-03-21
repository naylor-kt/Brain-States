#!/bin/bash

# This script will calculate ALFF and fALFF of the mean time series, using a matlab function built for this

data_path="$HOME/BrainStates_Test"

mkdir -p $HOME/BrainStates_Test/Alternative_Analysis

#subj=($(ls $HOME/BrainStates/RawData))
subj=(sub-06)


cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)


for s in ${subj[@]}; do
    for c in ${cond[@]};do
        for r in ${region[@]}; do
        mkdir -p /Users/mszkcn/BrainStates_Test/Alternative_Analysis/ALFF/${r}/${s}
        
        matlab -batch "startup_gen" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}.txt', 'ALFF', '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/ALFF/${r}/${s}/${s}-${c}-MTS-ALFF-${r}.txt')" -nojvm
        done
    done

    for c in ${cond[@]}; do
        for r in ${region[@]}; do
            mkdir -p /Users/mszkcn/BrainStates_Test/Alternative_Analysis/fALFF/${r}/${s}
            matlab -batch "startup_gen" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}.txt', '/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/${r}/${s}/${s}-${c}-psc-Wtf-MTS-${r}.txt', 'fALFF', '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/fALFF/${r}/${s}/${s}-${c}-MTS-fALFF-${r}.txt')" -nojvm
        done
    done
    
# For the grey matter ROIs

    for c in ${cond[@]};do
        for r in ${region_2[@]}; do
        mkdir -p /Users/mszkcn/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs/${r}/${s}
        
        matlab -batch "startup_gen" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-grey.txt', 'ALFF', '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-MTS-ALFF-${r}-grey.txt')" -nojvm
        done
    done
    
    for c in ${cond[@]}; do
        for r in ${region_2[@]}; do
            mkdir -p /Users/mszkcn/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs/${r}/${s}
            matlab -batch "startup_gen" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-grey.txt', '/Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-psc-Wtf-MTS-${r}-grey.txt', 'fALFF', '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-MTS-fALFF-${r}-grey.txt')" -nojvm
        done
    done
done

