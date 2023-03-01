#!/bin/bash

seg_mask () {
data_path="$HOME/BrainStates_Test";s=$1
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
vol_path="$HOME/BrainStates_Test/Volumetric"

mkdir -p $HOME/BrainStates_Test/Mask
mask_path="$HOME/BrainStates_Test/Mask"

#Array of conditions
cond=(as ns vs)
region=(AC HG PT MGB V1)
hemi=(lh rh)
# Create new masks for grey matter within the specific ROIs

for c in ${cond[@]}; do
    for r in ${region[@]}; do
    
    mkdir -p ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}
    
    fslmaths ${mask_path}/Func_Mask/${s}/${s}-${c}_${r}mask2func-bin -mul  ${mask_path}/Segmentation/${s}/Func_Segment_Mask/grey/${s}-${c}-grey-funcmask.nii.gz ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz
    
        for h in ${hemi[@]}; do
        
        mkdir -p ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}
            
        fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${r}mask2func-bin-${h} -mul ${mask_path}/Segmentation/${s}/Func_Segment_Mask/grey/${s}-${c}-grey-funcmask.nii.gz ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-${r}-grey_funcmask-${h}.nii.gz
        done
    done
done
                   
}

export -f seg_mask

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'seg_mask {1}' ::: ${s[@]}
