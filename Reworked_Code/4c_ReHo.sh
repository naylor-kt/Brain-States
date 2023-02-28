#!/bin/bash

data_path="$HOME/BrainStates"
mkdir -p $HOME/BrainStates/Analysis/ReHo

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"
mask_path="$HOME/BrainStates_Test/Mask/Func_Mask"

subj=($(ls $HOME/BrainStates/RawData))
cond=(as ns vs)
neighbourhood=(7 19 27)
#region=(AC HG PT MGB V1 Thal)
region=(Thal)


#Calculation of ReHo
for s in ${subj[@]}; do

    for c in ${cond[@]}; do
        for n in ${neighbourhood[@]}; do
        
        mkdir -p ${reho_path}/ReHo_${n}/Whole_Brain/${s}
        
        3dReHo -prefix ${reho_path}/ReHo_${n}/Whole_Brain/${s}/${s}-${c}-ReHo-${n}.nii.gz -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -nneigh ${n}
        
        
            for r in ${region[@]}; do
                
                mkdir -p ${reho_path}/ReHo_${n}/${r}/${s}
        
                3dReHo -prefix ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-ReHo-${n}-${r}.nii.gz \
                       -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                       -nneigh ${n} \
                       -mask ${mask_path}/${s}/${s}-${c}_${r}mask2func.nii.gz
            done
        done
    done
done
   
