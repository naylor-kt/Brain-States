#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask"

s=(sub-01)
cond=(as ns vs)

# Check the segmentation in the T1 space
fsleyes ${mask_path}/Segmentation/${s}/Structural/${s}_T1_brain_bet.nii.gz ${mask_path}/Segmentation/${s}/Segments/${s}_T1_csf.nii.gz -cm yellow ${mask_path}/Segmentation/${s}/Segments/${s}_T1_grey.nii.gz -cm green ${mask_path}/Segmentation/${s}/Segments/${s}_T1_white.nii.gz -cm -blue-lightblue &

# Check the production of T1 masks

fsleyes ${mask_path}/Segmentation/${s}/Structural/${s}_T1_brain_bet.nii.gz ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_csf_mask.nii.gz -cm yellow ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_grey_mask.nii.gz -cm green ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_white_mask.nii.gz -cm blue-lightblue &

# Check the segmentation of in the functional space

for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Segmentation/${s}/Func_Segments/csf/${s}-${c}-csf-func.nii.gz -cm yellow ${mask_path}/Segmentation/${s}/Func_Segments/grey/${s}-${c}-grey-func.nii.gz -cm green ${mask_path}/Segmentation/${s}/Func_Segments/white/${s}-${c}-white-func.nii.gz -cm blue-lightblue &
done

# Check the production of segmented masks in the functional space

for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Segmentation/${s}/Func_Segment_Mask/csf/${s}-${c}-csf-funcmask.nii.gz -cm yellow ${mask_path}/Segmentation/${s}/Func_Segment_Mask/grey/${s}-${c}-grey-funcmask.nii.gz -cm green ${mask_path}/Segmentation/${s}/Func_Segment_Mask/white/${s}-${c}-white-funcmask.nii.gz -cm blue-lightblue &
done



