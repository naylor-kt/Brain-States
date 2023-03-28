#!/bin/bash

### Calculate ALFF of the Mean Time Series
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
MTS_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation
thal_corr="$HOME/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation"

subj=($(ls $HOME/BrainStates_Test/RawData))
cond=(as ns vs)
hemi=(lh rh)

alt_ALFF="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS"

## Copy and rename the thalmus mean time series
       
#cp -R /Users/mszkcn/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Thal ${thal_corr}/Thalmus_MTS


#for s in ${subj[@]}; do
    #for c in ${cond[@]};do
    
       # mv  ${thal_corr}/Thalmus_MTS/${s}/${s}-${c}-psc-Rtf-MTS-Thal.txt ${thal_corr}/Thalmus_MTS/${s}/${s}-${c}-Thalamus-MTS.txt
            
            
        #for h in ${hemi[@]};do
       
             #  mv  ${thal_corr}/Thalmus_MTS/${h}/${s}/${s}-${c}-psc-Rtf-MTS-Thal-${h}.txt ${thal_corr}/Thalmus_MTS/${s}/${s}-${c}-Thalamus-${h}-MTS.txt
        #done
   # done
#done


for s in ${subj[@]}; do
    for c in ${cond[@]};do
        for r in `cat ${mask_path}/Region_List.txt`; do

                mkdir -p ${thal_corr}/Correlation/${r}/${s}

            matlab -batch "startup_gen" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); Thal_corr('/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series/${r}/${s}/${s}-${c}-${r}-MTS.txt', '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation/Thalmus_MTS/sub-01/sub-01-as-Thalamus-MTS.txt', 'corr', '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation/Correlation/${r}/${s}/sub-01-as-${r}-corr2Thalamus.txt')" -nojvm


            for h in ${hemi[@]}; do
            
            matlab -batch "startup_gen" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); Thal_corr('/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series/${r}/${s}/${s}-${c}-${r}-${h}-MTS.txt', '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation/Thalmus_MTS/${s}/${s}-${c}-Thalamus-${h}-MTS.txt', 'corr', '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation/Correlation/${r}/${s}/sub-01-as-${r}-corr2Thalamus-${h}.txt')" -nojvm
            done
        done
    done
done
