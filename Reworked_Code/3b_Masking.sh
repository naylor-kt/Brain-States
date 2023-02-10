#!/bin/bash

masking () {
data_path="$HOME/BrainStates";s=$1
mask_path="$HOME/BrainStates/Mask"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"


mkdir -p ${mask_path}/Masked_Time_Series/Auditory_Cortex/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Heschls_Gyrus/${s}
mkdir -p ${mask_path}/Masked_Time_Series/Planum_Temporale/${s}

AC_path="${mask_path}/Masked_Time_Series/Auditory_Cortex"
HG_path="${mask_path}/Masked_Time_Series/Heschls_Gyrus"
PT_path="${mask_path}/Masked_Time_Series/Planum_Temporale"


cond=(as ns vs)
hemi=(lh rh)
area=(HG PT)



for c in ${cond[@]}; do

# For the restricted filtered functional time series

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${AC_path}/${s}/${s}-${c}-psc-Rtf-AC.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${HG_path}/${s}/${s}-${c}-psc-Rtf-HG.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${PT_path}/${s}/${s}-${c}-psc-Rtf-PT.nii.gz

# For the wide filtered functional time series

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${AC_path}/${s}/${s}-${c}-psc-Wtf-AC.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${HG_path}/${s}/${s}-${c}-psc-Wtf-HG.nii.gz

fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${PT_path}/${s}/${s}-${c}-psc-Wtf-PT.nii.gz

done

}

export -f masking

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'masking {1}' ::: ${s[@]}
