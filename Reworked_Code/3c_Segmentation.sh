#!/bin/bash

segmentation () {
data_path="$HOME/BrainStates_Test";s=$1
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_2_Smoothed"
vol_path="$HOME/BrainStates/Volumetric"

mkdir -p $HOME/BrainStates_Test/Mask
mask_path="$HOME/BrainStates_Test/Mask"

#Array of conditions
cond=(as ns vs)

#REGISTRATION

#Preparation of the T1 image - it is usually unecessary to do this because it has already been done
   # mkdir -p ${vol_path}/Registration/$s/Struct
   # mkdir -p ${vol_path}/Registration/$s/Inverse
    
    #Perform ROBUST FIELD OF VIEW on the structural, T1 image
    # robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz
    
    #Bias Correction (nonpve prevents fast from performing segmentation of the image)
    # fast -B --nopve ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

    #Spatial Smoothing
    # fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    # susan ${vol_path}/Registration/$s/Struct/${s}_crop_struct_restore -1 $sigma 3 1 0 ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

    #Remove the unecessary files
    # imrm ${vol_path}/Registration/$s/Struct/${s}_crop_struct_*
    
# Alternatively copy the already prepared T1 image into the segmentation folder
mkdir -p ${mask_path}/Segmentation/${s}

cp ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz ${mask_path}/Segmentation/${s}/${s}_T1_brain.nii.gz

# Brain extraction is required prior to segmentation

bet ${mask_path}/Segmentation/${s}/${s}_T1_brain.nii.gz ${mask_path}/Segmentation/${s}/${s}_T1_brain.nii.gz -m -f 0.25

# Perform the segmentation
# type=1 specifies that the image is a T1 weighted image

fast --type=1 ${mask_path}/Segmentation/${s}/${s}_T1_brain.nii.gz

# RESULTS -> pve_0 corresponds to the CSF, pve_1 corresponds to the grey matter, and pve_2 corresponds to the white matter
# Rename the results files to make more sense
mkdir -p ${mask_path}/Segmentation/${s}/Segments
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_pve_0.nii.gz ${mask_path}/Segmentation/${s}/Segments/${s}_T1_csf.nii.gz
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_pve_1.nii.gz ${mask_path}/Segmentation/${s}/Segments/${s}_T1_grey.nii.gz
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_pve_2.nii.gz ${mask_path}/Segmentation/${s}/Segments/${s}_T1_white.nii.gz

# Move the structural files
mkdir -p ${mask_path}/Segmentation/${s}/Structural
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain.nii.gz ${mask_path}/Segmentation/${s}/Structural/${s}_T1_brain_bet.nii.gz
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_mask.nii.gz ${mask_path}/Segmentation/${s}/Structural/${s}_T1_brain_mask.nii.gz

# Move the unnecessary files that are produced
mkdir -p ${mask_path}/Segmentation/${s}/Other_FAST_files
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_mixeltype.nii.gz ${mask_path}/Segmentation/${s}/Other_FAST_files/${s}_T1_brain_mixeltype.nii.gz
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_pveseg.nii.gz ${mask_path}/Segmentation/${s}/Other_FAST_files/${s}_T1_brain_pveseg.nii.gz
mv ${mask_path}/Segmentation/${s}/${s}_T1_brain_seg.nii.gz ${mask_path}/Segmentation/${s}/Other_FAST_files/${s}_T1_brain_seg.nii.gz
    
# Create T1 Masks from the segmented regions
mkdir -p ${mask_path}/Segmentation/${s}/T1_Segment_Masks
fslmaths ${mask_path}/Segmentation/${s}/Segments/${s}_T1_csf.nii.gz -thr 0.5 -bin ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_csf_mask.nii.gz
fslmaths ${mask_path}/Segmentation/${s}/Segments/${s}_T1_grey.nii.gz -thr 0.5 -bin ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_grey_mask.nii.gz
fslmaths ${mask_path}/Segmentation/${s}/Segments/${s}_T1_white.nii.gz -thr 0.5 -bin ${mask_path}/Segmentation/${s}/T1_Segment_Masks/${s}_T1_white_mask.nii.gz

# Reslice the mask from T1 to MNI space
cond=(as ns vs)
masks=(csf grey white)

for m in ${masks[@]}; do
    mkdir -p ${mask_path}/Segmentation/${s}/Func_Segments/${m}
    mkdir -p ${mask_path}/Segmentation/${s}/Func_Segment_Mask/${m}
            
            for c in ${cond[@]}; do
                    applywarp --in=${mask_path}/Segmentation/${s}/Segments/${s}_T1_${m}.nii.gz  \
                              --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                              --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                              --out=${mask_path}/Segmentation/${s}/Func_Segments/${m}/${s}-${c}-${m}-func
                              
                    fslmaths ${mask_path}/Segmentation/${s}/Func_Segments/${m}/${s}-${c}-${m}-func.nii.gz -thr 0.5 -bin ${mask_path}/Segmentation/${s}/Func_Segment_Mask/${m}/${s}-${c}-${m}-funcmask.nii.gz
                done
done
                    
}

export -f segmentation

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'segmentation {1}' ::: ${s[@]}
