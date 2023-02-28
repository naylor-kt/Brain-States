#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask"

s=(sub-11)
cond=(as ns vs)


# Check the extraction of the AC
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func.nii.gz ${mask_path}/Masked_Time_Series/AC/${s}/${s}-${c}-psc-Rtf-AC.nii.gz ${mask_path}/Masked_Time_Series/AC/${s}/${s}-${c}-psc-Wtf-AC.nii.gz &
done

# Check the extraction of the HG
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func.nii.gz ${mask_path}/Masked_Time_Series/HG/${s}/${s}-${c}-psc-Rtf-HG.nii.gz ${mask_path}/Masked_Time_Series/HG/${s}/${s}-${c}-psc-Wtf-HG.nii.gz &
done
    
# Check the extraction of the PT
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func.nii.gz ${mask_path}/Masked_Time_Series/PT/${s}/${s}-${c}-psc-Rtf-PT.nii.gz ${mask_path}/Masked_Time_Series/PT/${s}/${s}-${c}-psc-Wtf-PT.nii.gz &
done

# Check the extraction of the MGB
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func.nii.gz ${mask_path}/Masked_Time_Series/MGB/${s}/${s}-${c}-psc-Rtf-MGB.nii.gz ${mask_path}/Masked_Time_Series/MGB/${s}/${s}-${c}-psc-Wtf-MGB.nii.gz &
done


# Check the extraction of the V1
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func.nii.gz ${mask_path}/Masked_Time_Series/V1/${s}/${s}-${c}-psc-Rtf-V1.nii.gz ${mask_path}/Masked_Time_Series/V1/${s}/${s}-${c}-psc-Wtf-V1.nii.gz &
done

# Check the extraction of the THALAMUS
for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_Thalmask2func.nii.gz ${mask_path}/Masked_Time_Series/Thal/${s}/${s}-${c}-psc-Rtf-Thal.nii.gz ${mask_path}/Masked_Time_Series/Thal/${s}/${s}-${c}-psc-Wtf-Thal.nii.gz &
done
