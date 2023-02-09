#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"
analysis_path="$HOME/BrainStates/Analysis"

s=(sub-01)
cond=(as ns vs)

# Check the values of Whole Brain ALFF

for c in ${cond[@]};do
    fslstats -t ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -r
done

# Check the values of the Whole Brain fALFF - should all be between 0 and 1

for c in ${cond[@]};do
    fslstats -t ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz -r
done

# Check the values of the masked ALFF and fALFF
  #ALFF
    # ALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC -r
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/lh/${s}/${s}-${c}-ALFF-AC-lh -r
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/rh/${s}/${s}-${c}-ALFF-AC-rh -r
    done
    
    # ALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG -r
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/lh/${s}/${s}-${c}-ALFF-HG-lh -r
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/rh/${s}/${s}-${c}-ALFF-HG-rh -r
    done
    
    # ALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT -r
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/lh/${s}/${s}-${c}-ALFF-PT-lh -r
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/rh/${s}/${s}-${c}-ALFF-PT-rh -r
    done
    
  #fALFF
    # fALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC -r
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/lh/${s}/${s}-${c}-fALFF-AC-lh -r
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/rh/${s}/${s}-${c}-fALFF-AC-rh -r
    done
    
    # fALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-fALFF-HG -r
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/lh/${s}/${s}-${c}-fALFF-HG-lh -r
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/rh/${s}/${s}-${c}-fALFF-HG-rh -r
    done
    
    # fALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-fALFF-PT -r
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/lh/${s}/${s}-${c}-fALFF-PT-lh -r
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/rh/${s}/${s}-${c}-fALFF-PT-rh -r
    done
