#!/bin/bash 

#Define the function, ready to be used in parallel

segmentation () {

data_path="$HOME/Brain_States";s=$1

mkdir -p ${data_path}/Segmentation/${s}

#Copy the t1 image which was used for Freesurfer
  # This T1 image has already undergone rostfov, bias correction, and spatial smoothing (fwhm=2.5)

cp ${data_path}/Freesurfer/Struct/$s/${s}_T1.nii.gz ${data_path}/Segmentation/${s}/${s}_T1.nii.gz 

#Brain extract the image, saving only the brain extracted image and the mask 
bet ${data_path}/Segmentation/${s}/${s}_T1.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_brain.nii.gz -m -f 0.25

fast --type=1 ${data_path}/Segmentation/${s}/${s}_T1_brain.nii.gz 

#pve_0 corresponds to the CSF, pve_1 corresponds to the grey matter, pve_2 corresponds to the white matter 

imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_mixeltype.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_pveseg.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_mixeltype.nii.gz 
imrm ${data_path}/Segmentation/${s}/${s}_T1_brain_seg.nii.gz

mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_0.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_csf.nii.gz
mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_1.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_gm.nii.gz
mv ${data_path}/Segmentation/${s}/${s}_T1_brain_pve_2.nii.gz ${data_path}/Segmentation/${s}/${s}_T1_wm.nii.gz

mkdir -p mkdir -p ${data_path}/Segmentation/${s}/Masks

fslmaths ${data_path}/Segmentation/${s}/${s}_T1_csf.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_csf_mask.nii.gz
fslmaths ${data_path}/Segmentation/${s}/${s}_T1_gm.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_gm_mask.nii.gz
fslmaths ${data_path}/Segmentation/${s}/${s}_T1_wm.nii.gz -thr 0.5 ${data_path}/Segmentation/${s}/Masks/${s}_T1_wm_mask.nii.gz

}

export -f segmentation 

s=($(ls $HOME/Brain_States/RawData))
echo ${s[@]}

parallel --jobs 0 'segmentation {1}' ::: ${s[@]}

