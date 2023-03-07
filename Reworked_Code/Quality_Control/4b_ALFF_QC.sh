#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_Smoothed"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"
analysis_path="$HOME/BrainStates/Analysis/Smoothed"
alt_analysis_path="$HOME/BrainStates/Alternative_Analysis"

cond=(as ns vs)
region=(AC HG PT V1)

# Check the values of Whole Brain ALFF

for c in ${cond[@]};do
    echo "${c} All subjects Whole Brain ALFF (alternative calculation)"
    cat ${alt_analysis_path}/ALFF/Whole_Brain/allsubs-${c}-MTS-ALFF.txt

    for r in ${region[@]}; do
        echo "${c} All subjects ${r} ALFF (alternative calculation)"
        ${alt_analysis_path}/ALFF/${r}/allsubs-${c}-MTS-ALFF-${r}.txt
    done
done 
    


for c in ${cond[@]};do
    for r in ${region[@]}; do
        echo "${c} All subjects ${r} ALFF (alternative calculation)"
        ${alt_analysis_path}/ALFF/${r}/allsubs-${c}-MTS-ALFF-${r}.txt
    done
done
