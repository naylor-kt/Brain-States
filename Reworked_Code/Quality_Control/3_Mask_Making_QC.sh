#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"

# Check the initial extracted of the HG, as well as the left and right
    # Start looking at the bilateral image
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-HGprob ${mask_path}/Extracted_Region/lh/HarvOx-HGprob-lh ${mask_path}/Extracted_Region/rh/HarvOx-HGprob-rh &

# Check the initial extracted of the PT, as well as the left and right
    # Start looking at the bilateral image
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PTprob ${mask_path}/Extracted_Region/lh/HarvOx-PTprob-lh ${mask_path}/Extracted_Region/rh/HarvOx-PTprob-rh &

# Look at the individual subjects

s=(sub-X)
cond=(as ns vs)

# Check the reslicing of the mask from MNI space to subject specific T1 space

# Heschel's Gyrus
    # Start looking at the bilateral image (set to green)
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

fsleyes ${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz ${mask_path}/T1_Mask/${s}/${s}_HGmask2T1.nii.gz ${mask_path}/T1_Mask/lh/${s}/${s}_HGmask2T1-lh.nii.gz ${mask_path}/T1_Mask/rh/${s}/${s}_HGmask2T1-rh.nii.gz &

# Planum Temporale
    # Start looking at the bilateral image (set to yellow)
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

fsleyes ${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz ${mask_path}/T1_Mask/${s}/${s}_PTmask2T1.nii.gz ${mask_path}/T1_Mask/lh/${s}/${s}_PTmask2T1-lh.nii.gz ${mask_path}/T1_Mask/rh/${s}/${s}_PTmask2T1-rh.nii.gz &

# Check the reslicing of the mask from MNI to the functional time series

# Heschel's Gyrus
    # Start looking at the bilateral image (set to green)
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func.nii.gz ${mask_path}/Func_Mask/lh/${s}/${s}-${c}_HGmask2func-lh.nii.gz ${mask_path}/Func_Mask/rh/${s}/${s}-${c}_HGmask2func-rh.nii.gz &
done

# Planum Temporale
    # Start looking at the bilateral image (set to yellow)
    # Set the left to blue, and check where this overlaps
    # Set the right to red, and check where this overlaps

for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func.nii.gz ${mask_path}/Func_Mask/lh/${s}/${s}-${c}_PTmask2func-lh.nii.gz ${mask_path}/Func_Mask/rh/${s}/${s}-${c}_PTmask2func-rh.nii.gz &
done


# Check the combination of the HG and PT masks to create the auditory cortex mask
    # Set the PT to yellow
    # Set the HG to green
    # Set the AC to (Blue-Light Blue) and check this correctly overlaps the two regions

    # For the bilateral mask
    for c in ${cond[@]}; do
        fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz  ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func.nii.gz ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func.nii.gz &
    done
    
    # Check the unilateral masks -left
    for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/lh/${s}/${s}-${c}_HGmask2func-lh.nii.gz ${mask_path}/Func_Mask/lh/${s}/${s}-${c}_PTmask2func-lh.nii.gz    ${mask_path}/Func_Mask/lh/${s}/${s}-${c}_ACmask2func-lh.nii.gz &
    done
    
    # Check the unilateral masks -right
    for c in ${cond[@]}; do
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${mask_path}/Func_Mask/rh/${s}/${s}-${c}_HGmask2func-rh.nii.gz    ${mask_path}/Func_Mask/rh/${s}/${s}-${c}_PTmask2func-rh.nii.gz   ${mask_path}/Func_Mask/rh/${s}/${s}-${c}_ACmask2func-rh.nii.gz &
    done
