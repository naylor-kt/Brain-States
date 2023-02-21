#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"
analysis_path="$HOME/BrainStates/Mask1_Analysis2"

s=(sub-11)
cond=(as ns vs)

# Check the values of the masked ALFF and fALFF
  #ALFF
    # ALFF for AC, HG, PT and MGB
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral AC"
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC -r
        
        echo "ALFF ${s}-${c} in Bilateral HG"
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG -r
        
        echo "ALFF ${s}-${c} in Bilateral PT"
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT -r
        
        echo "ALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-ALFF-MGB -r
        
    done
   
   
  #fALFF
    # fALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in the bilateral AC"
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC -r
        
        echo "fALFF ${s}-${c} in the bilateral HG"
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-fALFF-HG -r
        
        echo "fALFF ${s}-${c} in bilateral PT"
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-fALFF-PT -r
        
        echo "fALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-fALFF-MGB -r
        
    done
