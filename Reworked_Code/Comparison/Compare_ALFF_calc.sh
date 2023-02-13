#!/bin/bash

subj=($(ls $HOME/BrainStates/RawData))
cond=(as ns vs)
measure=(ALFF fALFF)

a1_m2_path="$HOME/BrainStates/Analysis/Analysis1_Mask2/"
m1_a2_path="$HOME/BrainStates/Analysis/Mask1_Analysis2/"

for s in ${subj[@]}; do
    for c in ${cond[@]}; do
        for m in ${measure[@]}; do
        
        mkdir -p $HOME/BrainStates/Analysis/Comparison/${m}/${s}

        compare_path="$HOME/BrainStates/Analysis/Comparison/"
        
        # For the auditory cortex
        fslmaths ${a1_m2_path}/${m}/Auditory_Cortex/${s}/${s}-${c}-${m}-AC.nii.gz -sub ${m1_a2_path}/${m}/Auditory_Cortex/${s}/${s}-${c}-${m}-AC.nii.gz ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-AC
        
        # What is the maximum and minimum value of the division
        echo "${s}-${c}-${m}-AC difference"
        fslstats -t ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-AC -r
        
        # For the HG
        fslmaths ${a1_m2_path}/${m}/Heschls_Gyrus/${s}/${s}-${c}-${m}-HG.nii.gz -sub ${m1_a2_path}/${m}/Heschls_Gyrus/${s}/${s}-${c}-${m}-HG.nii.gz ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-HG
        
        # What is the maximum and minimum value of the division
        echo "${s}-${c}-${m}-HG difference"
        fslstats -t ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-HG -r
        
        # For the PT
        fslmaths ${a1_m2_path}/${m}/Planum_Temporale/${s}/${s}-${c}-${m}-PT.nii.gz -sub ${m1_a2_path}/${m}/Planum_Temporale/${s}/${s}-${c}-${m}-PT.nii.gz ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-PT
        
        # What is the maximum and minimum value of the division
        echo "${s}-${c}-${m}-HG difference"
        fslstats -t ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-PT -r

        # For the MGB
        fslmaths ${a1_m2_path}/${m}/Medial_Geniculate_Body/${s}/${s}-${c}-${m}-MGB.nii.gz -sub ${m1_a2_path}/${m}/Medial_Geniculate_Body/${s}/${s}-${c}-${m}-MGB.nii.gz ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-MGB
        
        # What is the maximum and minimum value of the division
        echo "${s}-${c}-${m}-HG difference"
        fslstats -t ${compare_path}/${m}/${s}/${s}-${c}-${m}sub-MGB -r
        
        done
    done
done
