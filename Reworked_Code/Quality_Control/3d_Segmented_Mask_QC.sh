#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask/Func_Mask/bin"
seg_mask_path="/Users/mszkcn/BrainStates_Test/Mask/Segmentation/Grey_Matter_ROIs"

s=(sub-01)
cond=(as ns vs)

# Check the production of grey matter ROI masks in the functional space

for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc-mean.nii.gz ${data_path}/Mask/Segmentation/${s}/Func_Segment_Mask/grey/${s}-${c}-grey-funcmask.nii.gz -cm blue-lightblue ${mask_path}/${s}/${s}-${c}_ACmask2func-bin.nii.gz -cm red  ${seg_mask_path}/AC/${s}/${s}-${c}-AC-grey_funcmask.nii.gz -cm blue -a 50 ${mask_path}/${s}/${s}-${c}_HGmask2func-bin.nii.gz -cm red ${seg_mask_path}/HG/${s}/${s}-${c}-HG-grey_funcmask.nii.gz -cm blue -a 50 ${mask_path}/${s}/${s}-${c}_PTmask2func-bin.nii.gz -cm red ${seg_mask_path}/PT/${s}/${s}-${c}-PT-grey_funcmask.nii.gz -cm blue -a 50 ${mask_path}/${s}/${s}-${c}_V1mask2func-bin.nii.gz -cm red ${seg_mask_path}/V1/${s}/${s}-${c}-V1-grey_funcmask.nii.gz -cm blue -a 50 &
done







