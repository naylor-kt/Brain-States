#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"

s=(sub-01)
cond=(as ns vs)

# Check the values of the masked ReHo
  #ALFF
    # ALFF for AC, HG, PT and MGB
    for c in ${cond[@]};do
        echo "ReHo 7nn ${s}-${c} in Whole Brain"
        fslstats -t ${reho_path}/ReHo_7/Whole_Brain/${s}/${s}-${c}-ReHo-7.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Whole Brain"
        fslstats -t ${reho_path}/ReHo_19/Whole_Brain/${s}/${s}-${c}-ReHo-19.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Whole Brain"
        fslstats -t ${reho_path}/ReHo_27/Whole_Brain/${s}/${s}-${c}-ReHo-27.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Auditory Cortex"
        fslstats -t ${reho_path}/ReHo_7/AC/${s}/${s}-${c}-ReHo-7-AC.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Auditory Cortex"
        fslstats -t ${reho_path}/ReHo_19/AC/${s}/${s}-${c}-ReHo-19-AC.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Auditory Cortex"
        fslstats -t ${reho_path}/ReHo_27/AC/${s}/${s}-${c}-ReHo-27-AC.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_7/HG/${s}/${s}-${c}-ReHo-7-HG.nii.gz -M -r
         
        echo "ReHo 19nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_19/HG/${s}/${s}-${c}-ReHo-19-HG.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_27/HG/${s}/${s}-${c}-ReHo-27-HG.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_7/PT/${s}/${s}-${c}-ReHo-7-PT.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_19/PT/${s}/${s}-${c}-ReHo-19-PT.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_27/PT/${s}/${s}-${c}-ReHo-27-PT.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_7/V1/${s}/${s}-${c}-ReHo-7-V1.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_19/V1/${s}/${s}-${c}-ReHo-19-V1.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_27/V1/${s}/${s}-${c}-ReHo-27-V1.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Thalamus"
        fslstats -t ${reho_path}/ReHo_7/Thal/${s}/${s}-${c}-ReHo-7-Thal.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Thalamus"
        fslstats -t ${reho_path}/ReHo_19/Thal/${s}/${s}-${c}-ReHo-19-Thal.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Thalamus"
        fslstats -t ${reho_path}/ReHo_27/Thal/${s}/${s}-${c}-ReHo-27-Thal.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Medial Geniculate Body"
        fslstats -t ${reho_path}/ReHo_7/MGB/${s}/${s}-${c}-ReHo-7-MGB.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Medial Geniculate Body"
        fslstats -t ${reho_path}/ReHo_19/MGB/${s}/${s}-${c}-ReHo-19-MGB.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Medial Geniculate Body"
        fslstats -t ${reho_path}/ReHo_27/MGB/${s}/${s}-${c}-ReHo-27-MGB.nii.gz -M -r
    done
   



# Check the values of the masked ReHo in the grey matter
  #ReHo
    # ReHo for AC, HG, PT and MGB
    for c in ${cond[@]};do
        
        echo "ReHo 7nn ${s}-${c} in Auditory Cortex Grey Matter"
        fslstats -t ${reho_path}/ReHo_7/Grey_Matter_ROIs/AC/${s}/${s}-${c}-ReHo-7-AC-grey.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Auditory Cortex Grey Matter"
        fslstats -t ${reho_path}/ReHo_19/Grey_Matter_ROIs/AC/${s}/${s}-${c}-ReHo-19-AC-grey.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Auditory Cortex"
        fslstats -t ${reho_path}/ReHo_27/Grey_Matter_ROIs/AC/${s}/${s}-${c}-ReHo-27-AC-grey.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_7/Grey_Matter_ROIs/HG/${s}/${s}-${c}-ReHo-7-HG-grey.nii.gz -M -r
         
        echo "ReHo 19nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_19/Grey_Matter_ROIs/HG/${s}/${s}-${c}-ReHo-19-HG-grey.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Heschl's Gyrus"
        fslstats -t ${reho_path}/ReHo_27/Grey_Matter_ROIs/HG/${s}/${s}-${c}-ReHo-27-HG-grey.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_7/Grey_Matter_ROIs/PT/${s}/${s}-${c}-ReHo-7-PT-grey.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_19/Grey_Matter_ROIs/PT/${s}/${s}-${c}-ReHo-19-PT-grey.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Planum Temporale"
        fslstats -t ${reho_path}/ReHo_27/Grey_Matter_ROIs/PT/${s}/${s}-${c}-ReHo-27-PT-grey.nii.gz -M -r
        
        echo "ReHo 7nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_7/Grey_Matter_ROIs/V1/${s}/${s}-${c}-ReHo-7-V1-grey.nii.gz -M -r
        
        echo "ReHo 19nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_19/Grey_Matter_ROIs/V1/${s}/${s}-${c}-ReHo-19-V1-grey.nii.gz -M -r
        
        echo "ReHo 27nn ${s}-${c} in Primary Visual Cortex"
        fslstats -t ${reho_path}/ReHo_27/Grey_Matter_ROIs/V1/${s}/${s}-${c}-ReHo-27-V1-grey.nii.gz -M -r
        
    done
