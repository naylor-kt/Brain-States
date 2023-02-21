#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_Smoothed"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"
analysis_path="$HOME/BrainStates/Analysis/Smoothed"

s=(sub-01)
cond=(as ns vs)

# Check the values of Whole Brain ALFF

for c in ${cond[@]};do
    fslstats -t ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -r
done

# Check the values of the Whole Brain fALFF - should all be between 0 and 1

for c in ${cond[@]};do
    fslstats -t ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -r
done

# Check the values of the masked ALFF and fALFF
  #ALFF
    # ALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral AC"
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-SM-ALFF-AC -r
        echo "ALFF ${s}-${c} in the Left AC"
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/lh/${s}/${s}-${c}-SM-ALFF-AC-lh -r
        echo "ALFF ${s}-${c} in the Right AC"
        fslstats -t ${analysis_path}/ALFF/Auditory_Cortex/rh/${s}/${s}-${c}-SM-ALFF-AC-rh -r
    done
    
    # ALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral HG"
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-SM-ALFF-HG -r
        echo "ALFF ${s}-${c} in Left HG"
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/lh/${s}/${s}-${c}-SM-ALFF-HG-lh -r
        echo "ALFF ${s}-${c} in Right HG"
        fslstats -t ${analysis_path}/ALFF/Heschls_Gyrus/rh/${s}/${s}-${c}-SM-ALFF-HG-rh -r
    done
    
    # ALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral PT"
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-SM-ALFF-PT -r
        echo "ALFF ${s}-${c} in Left PT"
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/lh/${s}/${s}-${c}-SM-ALFF-PT-lh -r
        echo "ALFF ${s}-${c} in Right PT"
        fslstats -t ${analysis_path}/ALFF/Planum_Temporale/rh/${s}/${s}-${c}-SM-ALFF-PT-rh -r
    done
  
  # ALFF for MGB, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-SM-ALFF-MGB -r
        echo "ALFF ${s}-${c} in Left MGB"
        fslstats -t ${analysis_path}/ALFF/Medial_Geniculate_Body/lh/${s}/${s}-${c}-SM-ALFF-MGB-lh -r
        echo "ALFF ${s}-${c} in Right MGB"
        fslstats -t ${analysis_path}/ALFF/Medial_Geniculate_Body/rh/${s}/${s}-${c}-SM-ALFF-MGB-rh -r
    done
   
     # ALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-SM-ALFF-V1 -r
        echo "ALFF ${s}-${c} in Left V1"
        fslstats -t ${analysis_path}/ALFF/Visual_Cortex_1/lh/${s}/${s}-${c}-SM-ALFF-V1-lh -r
        echo "ALFF ${s}-${c} in Right V1"
        fslstats -t ${analysis_path}/ALFF/Visual_Cortex_1/rh/${s}/${s}-${c}-SM-ALFF-V1-rh -r
    done
   
   
  #fALFF
    # fALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in the bilateral AC"
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-SM-fALFF-AC -r
        echo "fALFF ${s}-${c} in the left AC"
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/lh/${s}/${s}-${c}-SM-fALFF-AC-lh -r
        echo "fALFF ${s}-${c} in the right AC"
        fslstats -t ${analysis_path}/fALFF/Auditory_Cortex/rh/${s}/${s}-${c}-SM-fALFF-AC-rh -r
    done
    
    # fALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in the bilateral HG"
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-SM-fALFF-HG -r
        echo "fALFF ${s}-${c} in the left HG"
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/lh/${s}/${s}-${c}-SM-fALFF-HG-lh -r
        echo "fALFF ${s}-${c} in the right HG"
        fslstats -t ${analysis_path}/fALFF/Heschls_Gyrus/rh/${s}/${s}-${c}-SM-fALFF-HG-rh -r
    done
    
    # fALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in bilateral PT"
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-SM-fALFF-PT -r
        echo "fALFF ${s}-${c} in left PT"
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/lh/${s}/${s}-${c}-SM-fALFF-PT-lh -r
        echo "fALFF ${s}-${c} in right PT"
        fslstats -t ${analysis_path}/fALFF/Planum_Temporale/rh/${s}/${s}-${c}-SM-fALFF-PT-rh -r
    done
  
  # fALFF for MGB, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-SM-fALFF-MGB -r
        echo "fALFF ${s}-${c} in Left MGB"
        fslstats -t ${analysis_path}/fALFF/Medial_Geniculate_Body/lh/${s}/${s}-${c}-SM-fALFF-MGB-lh -r
        echo "fALFF ${s}-${c} in Right MGB"
        fslstats -t ${analysis_path}/fALFF/Medial_Geniculate_Body/rh/${s}/${s}-${c}-SM-fALFF-MGB-rh -r
    done

  # fALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-SM-fALFF-V1 -r
        echo "fALFF ${s}-${c} in Left V1"
        fslstats -t ${analysis_path}/fALFF/Visual_Cortex_1/lh/${s}/${s}-${c}-SM-fALFF-V1-lh -r
        echo "fALFF ${s}-${c} in Right V1"
        fslstats -t ${analysis_path}/fALFF/Visual_Cortex_1/rh/${s}/${s}-${c}-SM-fALFF-V1-rh -r
    done
