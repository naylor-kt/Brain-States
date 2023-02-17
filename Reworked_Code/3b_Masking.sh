#!/bin/bash

masking () {
data_path="$HOME/BrainStates";s=$1
mask_path="$HOME/BrainStates/Mask"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"

cond=(as ns vs)
hemi=(lh rh)


for h in ${hemi[@]}; do
mkdir -p ${mask_path}/Masked_Time_Series/Auditory_Cortex/${h}/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Heschls_Gyrus/${h}/${s}/
mkdir -p ${mask_path}/Masked_Time_Series/Planum_Temporale/${h}/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Medial_Geniculate_Body/${h}/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Visual_Cortex_1/${h}/${s}
done

mkdir -p ${mask_path}/Masked_Time_Series/Auditory_Cortex/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Heschls_Gyrus/${s}/
mkdir -p ${mask_path}/Masked_Time_Series/Planum_Temporale/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Medial_Geniculate_Body/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Visual_Cortex_1/${s}

AC_path="${mask_path}/Masked_Time_Series/Auditory_Cortex"
HG_path="${mask_path}/Masked_Time_Series/Heschls_Gyrus"
PT_path="${mask_path}/Masked_Time_Series/Planum_Temporale"
MGB_path="${mask_path}/Masked_Time_Series/Medial_Geniculate_Body"
V1_path="${mask_path}/Masked_Time_Series/Visual_Cortex_1"



for c in ${cond[@]}; do

# For the restricted filtered functional time series

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${AC_path}/${s}/${s}-${c}-psc-Rtf-AC.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${HG_path}/${s}/${s}-${c}-psc-Rtf-HG.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${PT_path}/${s}/${s}-${c}-psc-Rtf-PT.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${MGB_path}/${s}/${s}-${c}-psc-Rtf-MGB.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${V1_path}/${s}/${s}-${c}-psc-Rtf-V1.nii.gz

# For the wide filtered functional time series

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${AC_path}/${s}/${s}-${c}-psc-Wtf-AC.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${HG_path}/${s}/${s}-${c}-psc-Wtf-HG.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${PT_path}/${s}/${s}-${c}-psc-Wtf-PT.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${MGB_path}/${s}/${s}-${c}-psc-Wtf-MGB.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${V1_path}/${s}/${s}-${c}-psc-Wtf-V1.nii.gz

 done

for c in ${cond[@]}; do
    for h in ${hemi[@]}; do

    #For the restricted temporal filtering
    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h}.nii.gz ${AC_path}/${h}/${s}/${s}-${c}-psc-Rtf-AC-${h}.nii.gz

    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h}.nii.gz ${HG_path}/${h}/${s}/${s}-${c}-psc-Rtf-HG-${h}.nii.gz

    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h}.nii.gz ${PT_path}/${h}/${s}/${s}-${c}-psc-Rtf-PT-${h}.nii.gz
        
    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h}.nii.gz ${MGB_path}/${h}/${s}/${s}-${c}-psc-Rtf-MGB-${h}.nii.gz
    
    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h}.nii.gz ${V1_path}/${h}/${s}/${s}-${c}-psc-Rtf-V1-${h}.nii.gz
     
    # For the wide temporally filtered image
    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h}.nii.gz ${AC_path}/${h}/${s}/${s}-${c}-psc-Wtf-AC-${h}.nii.gz

    fslmaths  ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h}.nii.gz ${HG_path}/${h}/${s}/${s}-${c}-psc-Wtf-HG-${h}.nii.gz

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h}.nii.gz ${PT_path}/${h}/${s}/${s}-${c}-psc-Wtf-PT-${h}.nii.gz
        
    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h}.nii.gz ${MGB_path}/${h}/${s}/${s}-${c}-psc-Wtf-MGB-${h}.nii.gz
    
    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h}.nii.gz ${V1_path}/${h}/${s}/${s}-${c}-psc-Wtf-V1-${h}.nii.gz
 
    done
done
}

export -f masking

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'masking {1}' ::: ${s[@]}
