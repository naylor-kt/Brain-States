#!/bin/bash 

# This script takes the T1 image and segments into the csf, grey and white matter

#Define the function, ready to be used in parallel

segmentation () {

data_path="$HOME/Brain_States";s=$1

mkdir -p ${data_path}/Segmentation/${s}

#Copy the t1 image which was used for registration 
  # This T1 image has already undergone rostfov, bias correction, and spatial smoothing (fwhm=2.5)
  # Therefore if  this image is not available these steps would need to be completed 

cp ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz ${data_path}/Segmentation/${s}/${s}_T1.nii.gz 

# Brain extract the image, saving only the brain extracted image and the mask 
bet ${data_path}/Segmentation/${s}/${s}_T1.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_brain.nii.gz -m -f 0.25

# Performs the segmentation
# type=1 specifies that the image is a T1 weighted image 

fast --type=1 ${data_path}/Segmentation/${s}/${s}_T1_brain.nii.gz 

# RESULTS -> pve_0 corresponds to the CSF, pve_1 corresponds to the grey matter, pve_2 corresponds to the white matter 

# Remove all the unnecessary files that are produced
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_mixeltype.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_pveseg.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_mixeltype.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_seg.nii.gz

# Rename the segmented images
mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_0.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_csf.nii.gz
mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_1.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_gm.nii.gz
mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_2.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_wm.nii.gz

# Make a new folder to save the brain masks 
mkdir -p mkdir -p ${data_path}/Segmentation/${s}/Masks

# Create binary masks of the csf, grey and white matter, and save them to masks folder
fslmaths ${data_path}/Segmentation/${s}/${s}_T1_csf.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_csf_mask.nii.gz
fslmaths ${data_path}/Segmentation/${s}/${s}_T1_gm.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_gm_mask.nii.gz
fslmaths ${data_path}/Segmentation/${s}/${s}_T1_wm.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_wm_mask.nii.gz

}

# Exports the function 
export -f segmentation

# Create an array of the subjects, as they appear in the RawData folder 
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subjects array 
echo ${s[@]}

# Run the function in parallel using GNU parallel
# Setting jobs to 0, allows paralllel to automatically divide jobs across the CPUs as it sees fit 
# Provide the subjects array as the argument 

parallel --jobs 0 'segmentation {1}' ::: ${s[@]}

