#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask"
analysis_path="$HOME/BrainStates_Test/Analysis"

s=(sub-01)
cond=(as ns vs)

# Check the values of Whole Brain ALFF

for c in ${cond[@]};do
    echo "Whole Braine ALFF ${s} ${c}"
    fslstats -t ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -r
done

# Check the values of the Whole Brain fALFF - should all be between 0 and 1

for c in ${cond[@]};do
    echo "Whole Brain fALFF ${s} ${c}"
    fslstats -t ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz -r
done

# Check the values of the masked ALFF and fALFF
  #ALFF
    # ALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral AC"
        fslstats -t ${analysis_path}/ALFF/AC/${s}/${s}-${c}-ALFF-AC -r
        echo "ALFF ${s}-${c} in the Left AC"
        fslstats -t ${analysis_path}/ALFF/AC/lh/${s}/${s}-${c}-ALFF-AC-lh -r
        echo "ALFF ${s}-${c} in the Right AC"
        fslstats -t ${analysis_path}/ALFF/AC/rh/${s}/${s}-${c}-ALFF-AC-rh -r
    done
    
    # ALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral HG"
        fslstats -t ${analysis_path}/ALFF/HG/${s}/${s}-${c}-ALFF-HG -r
        echo "ALFF ${s}-${c} in Left HG"
        fslstats -t ${analysis_path}/ALFF/HG/lh/${s}/${s}-${c}-ALFF-HG-lh -r
        echo "ALFF ${s}-${c} in Right HG"
        fslstats -t ${analysis_path}/ALFF/HG/rh/${s}/${s}-${c}-ALFF-HG-rh -r
    done
    
    # ALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral PT"
        fslstats -t ${analysis_path}/ALFF/PT/${s}/${s}-${c}-ALFF-PT -r
        echo "ALFF ${s}-${c} in Left PT"
        fslstats -t ${analysis_path}/ALFF/PT/lh/${s}/${s}-${c}-ALFF-PT-lh -r
        echo "ALFF ${s}-${c} in Right PT"
        fslstats -t ${analysis_path}/ALFF/PT/rh/${s}/${s}-${c}-ALFF-PT-rh -r
    done
  
  # ALFF for MGB, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/ALFF/MGB/${s}/${s}-${c}-ALFF-MGB -r
        echo "ALFF ${s}-${c} in Left MGB"
        fslstats -t ${analysis_path}/ALFF/MGB/lh/${s}/${s}-${c}-ALFF-MGB-lh -r
        echo "ALFF ${s}-${c} in Right MGB"
        fslstats -t ${analysis_path}/ALFF/MGB/rh/${s}/${s}-${c}-ALFF-MGB-rh -r
    done
   
     # ALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${analysis_path}/ALFF/V1/${s}/${s}-${c}-ALFF-V1 -r
        echo "ALFF ${s}-${c} in Left V1"
        fslstats -t ${analysis_path}/ALFF/V1/lh/${s}/${s}-${c}-ALFF-V1-lh -r
        echo "ALFF ${s}-${c} in Right V1"
        fslstats -t ${analysis_path}/ALFF/V1/rh/${s}/${s}-${c}-ALFF-V1-rh -r
    done
   
    # ALFF for THALAMUS, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral Thalamus"
        fslstats -t ${analysis_path}/ALFF/Thal/${s}/${s}-${c}-ALFF-Thal -r
        echo "ALFF ${s}-${c} in Left Thalamus"
        fslstats -t ${analysis_path}/ALFF/Thal/lh/${s}/${s}-${c}-ALFF-Thal-lh -r
        echo "ALFF ${s}-${c} in Right Thalamus"
        fslstats -t ${analysis_path}/ALFF/Thal/rh/${s}/${s}-${c}-ALFF-Thal-rh -r
    done
   
  #fALFF
    # fALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in the bilateral AC"
        fslstats -t ${analysis_path}/fALFF/AC/${s}/${s}-${c}-fALFF-AC -r
        echo "fALFF ${s}-${c} in the left AC"
        fslstats -t ${analysis_path}/fALFF/AC/lh/${s}/${s}-${c}-fALFF-AC-lh -r
        echo "fALFF ${s}-${c} in the right AC"
        fslstats -t ${analysis_path}/fALFF/AC/rh/${s}/${s}-${c}-fALFF-AC-rh -r
    done
    
    # fALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in the bilateral HG"
        fslstats -t ${analysis_path}/fALFF/HG/${s}/${s}-${c}-fALFF-HG -r
        echo "fALFF ${s}-${c} in the left HG"
        fslstats -t ${analysis_path}/fALFF/HG/lh/${s}/${s}-${c}-fALFF-HG-lh -r
        echo "fALFF ${s}-${c} in the right HG"
        fslstats -t ${analysis_path}/fALFF/HG/rh/${s}/${s}-${c}-fALFF-HG-rh -r
    done
    
    # fALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in bilateral PT"
        fslstats -t ${analysis_path}/fALFF/PT/${s}/${s}-${c}-fALFF-PT -r
        echo "fALFF ${s}-${c} in left PT"
        fslstats -t ${analysis_path}/fALFF/PT/lh/${s}/${s}-${c}-fALFF-PT-lh -r
        echo "fALFF ${s}-${c} in right PT"
        fslstats -t ${analysis_path}/fALFF/PT/rh/${s}/${s}-${c}-fALFF-PT-rh -r
    done
  
  # fALFF for MGB, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${analysis_path}/fALFF/MGB/${s}/${s}-${c}-fALFF-MGB -r
        echo "fALFF ${s}-${c} in Left MGB"
        fslstats -t ${analysis_path}/fALFF/MGB/lh/${s}/${s}-${c}-fALFF-MGB-lh -r
        echo "fALFF ${s}-${c} in Right MGB"
        fslstats -t ${analysis_path}/fALFF/MGB/rh/${s}/${s}-${c}-fALFF-MGB-rh -r
    done

  # fALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${analysis_path}/fALFF/V1/${s}/${s}-${c}-fALFF-V1 -r
        echo "fALFF ${s}-${c} in Left V1"
        fslstats -t ${analysis_path}/fALFF/V1/lh/${s}/${s}-${c}-fALFF-V1-lh -r
        echo "fALFF ${s}-${c} in Right V1"
        fslstats -t ${analysis_path}/fALFF/V1/rh/${s}/${s}-${c}-fALFF-V1-rh -r
    done
    
    # fALFF for Thalamus, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral Thalamus"
        fslstats -t ${analysis_path}/fALFF/Thal/${s}/${s}-${c}-fALFF-Thal -r
        echo "fALFF ${s}-${c} in Left Thalamus"
        fslstats -t ${analysis_path}/fALFF/Thal/lh/${s}/${s}-${c}-fALFF-Thal-lh -r
        echo "fALFF ${s}-${c} in Right Thalamus"
        fslstats -t ${analysis_path}/fALFF/Thal/rh/${s}/${s}-${c}-fALFF-Thal-rh -r
    done


# REPEAT FOR THE GREY MATTER SPECIFIC MASKS

# Check the values of the masked ALFF and fALFF
  #ALFF
  grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
  
    # ALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral AC"
        fslstats -t ${grey_ALFF}/AC/${s}/${s}-${c}-ALFF-AC-grey.nii.gz -r
        echo "ALFF ${s}-${c} in the Left AC"
        fslstats -t ${grey_ALFF}/AC/lh/${s}/${s}-${c}-ALFF-AC-grey-lh.nii.gz -r
        echo "ALFF ${s}-${c} in the Right AC"
        fslstats -t ${grey_ALFF}/AC/rh/${s}/${s}-${c}-ALFF-AC-grey-rh.nii.gz -r
    done
    
    # ALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral HG"
        fslstats -t ${grey_ALFF}/HG/${s}/${s}-${c}-ALFF-HG-grey.nii.gz -r
        echo "ALFF ${s}-${c} in Left HG"
        fslstats -t ${grey_ALFF}/HG/lh/${s}/${s}-${c}-ALFF-HG-grey-lh.nii.gz -r
        echo "ALFF ${s}-${c} in Right HG"
        fslstats -t ${grey_ALFF}/HG/rh/${s}/${s}-${c}-ALFF-HG-grey-rh.nii.gz -r
    done
    
    # ALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral PT"
        fslstats -t ${grey_ALFF}/PT/${s}/${s}-${c}-ALFF-PT-grey.nii.gz -r
        echo "ALFF ${s}-${c} in Left PT"
        fslstats -t ${grey_ALFF}/PT/lh/${s}/${s}-${c}-ALFF-PT-grey-lh.nii.gz -r
        echo "ALFF ${s}-${c} in Right PT"
        fslstats -t ${grey_ALFF}/PT/rh/${s}/${s}-${c}-ALFF-PT-grey-rh.nii.gz -r
    done
  
  # ALFF for MGB, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral MGB"
        fslstats -t ${grey_ALFF}/MGB/${s}/${s}-${c}-ALFF-MGB-grey.nii.gz -r
        echo "ALFF ${s}-${c} in Left MGB"
        fslstats -t ${grey_ALFF}/MGB/lh/${s}/${s}-${c}-ALFF-MGB-grey-lh.nii.gz -r
        echo "ALFF ${s}-${c} in Right MGB"
        fslstats -t ${grey_ALFF}/PT/rh/${s}/${s}-${c}-ALFF-PT-grey-rh.nii.gz -r
    done
   
     # ALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "ALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${grey_ALFF}/V1/${s}/${s}-${c}-ALFF-V1-grey.nii.gz -r
        echo "ALFF ${s}-${c} in Left V1"
        fslstats -t ${grey_ALFF}/V1/lh/${s}/${s}-${c}-ALFF-V1-grey-lh.nii.gz -r
        echo "ALFF ${s}-${c} in Right V1"
        fslstats -t ${grey_ALFF}/PT/rh/${s}/${s}-${c}-ALFF-PT-grey-rh.nii.gz -r
    done
   
# Check the values of the masked ALFF and fALFF
  #fALFF
  grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"
  
    # ALFF for AC, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral AC"
        fslstats -t ${grey_fALFF}/AC/${s}/${s}-${c}-fALFF-AC-grey.nii.gz -r
        echo "fALFF ${s}-${c} in the Left AC"
        fslstats -t ${grey_fALFF}/AC/lh/${s}/${s}-${c}-fALFF-AC-grey-lh.nii.gz -r
        echo "fALFF ${s}-${c} in the Right AC"
        fslstats -t ${grey_fALFF}/AC/rh/${s}/${s}-${c}-fALFF-AC-grey-rh.nii.gz -r
    done
    
    # ALFF for HG, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral HG"
        fslstats -t ${grey_fALFF}/HG/${s}/${s}-${c}-fALFF-HG-grey.nii.gz -r
        echo "fALFF ${s}-${c} in Left HG"
        fslstats -t ${grey_fALFF}/HG/lh/${s}/${s}-${c}-fALFF-HG-grey-lh.nii.gz -r
        echo "fALFF ${s}-${c} in Right HG"
        fslstats -t ${grey_fALFF}/HG/rh/${s}/${s}-${c}-fALFF-HG-grey-rh.nii.gz -r
    done
    
    # ALFF for PT, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral PT"
        fslstats -t ${grey_fALFF}/PT/${s}/${s}-${c}-fALFF-PT-grey.nii.gz -r
        echo "fALFF ${s}-${c} in Left PT"
        fslstats -t ${grey_fALFF}/PT/lh/${s}/${s}-${c}-fALFF-PT-grey-lh.nii.gz -r
        echo "fALFF ${s}-${c} in Right PT"
        fslstats -t ${grey_fALFF}/PT/rh/${s}/${s}-${c}-fALFF-PT-grey-rh.nii.gz -r
    done
  

     # ALFF for V1, 1) bilateral 2) left 3) right
    for c in ${cond[@]};do
        echo "fALFF ${s}-${c} in Bilateral V1"
        fslstats -t ${grey_fALFF}/V1/${s}/${s}-${c}-fALFF-V1-grey.nii.gz -r
        echo "fALFF ${s}-${c} in Left V1"
        fslstats -t ${grey_fALFF}/V1/lh/${s}/${s}-${c}-fALFF-V1-grey-lh.nii.gz -r
        echo "fALFF ${s}-${c} in Right V1"
        fslstats -t ${grey_fALFF}/PT/rh/${s}/${s}-${c}-fALFF-PT-grey-rh.nii.gz -r
    done
  
