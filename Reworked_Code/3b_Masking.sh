#!/bin/bash

masking () {
data_path="$HOME/BrainStates_Test";s=$1
mask_path="$HOME/BrainStates_Test/Mask"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"

cond=(as ns vs)
hemi=(lh rh)
region=(AC HG PT MGB V1 Thal)


for r in ${region[@]};do

    mkdir -p ${mask_path}/Masked_Time_Series/${r}/${s}
    
    for h in ${hemi[@]}; do
    mkdir -p ${mask_path}/Masked_Time_Series/${r}/${h}/${s}
    done
done

for r in ${region[@]}; do

    for c in ${cond[@]}; do

    # For the restricted filtered functional time series

    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_${r}mask2func ${mask_path}/Masked_Time_Series/${r}/${s}/${s}-${c}-psc-Rtf-${r}.nii.gz

    # For the wide filtered functional time series

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_${r}mask2func ${mask_path}/Masked_Time_Series/${r}/${s}/${s}-${c}-psc-Wtf-${r}.nii.gz

        for h in ${hemi[@]}; do

        #For the restricted temporal filtering
        fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${r}mask2func-${h}.nii.gz ${mask_path}/Masked_Time_Series/${r}/${h}/${s}/${s}-${c}-psc-Rtf-${r}-${h}.nii.gz
         
        # For the wide temporally filtered image
        fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${r}mask2func-${h}.nii.gz ${mask_path}/Masked_Time_Series/${r}/${h}/${s}/${s}-${c}-psc-Wtf-${r}-${h}.nii.gz
        done
    done
done
}

export -f masking

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'masking {1}' ::: ${s[@]}
