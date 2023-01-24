#!/bin/bash

projection_smoothed (){

#Set the regular data_path, as has been used in the preprocessing script
data_path="$HOME/Brain_States"

#Set the freesurfer path (just to simplfy the later code)
fs_path="$HOME/Brain_States/Freesurfer";s=$1

#Provide the location of SUBJECTS_DIR
SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

#Make directory to save the projected data for filtered image (0.01 to 0.1 Hz)
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${data_path}/Percent_Signal_Change/Temporally_Filtered/001-01/${s}/${s}-${c}-psc-tf.nii.gz \
             --hemi ${h} \
             --o ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
# Smoothe the vol2surf projected image
  fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz \
        --tval ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz \
                   --o ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

#Make directory to save the projected data for Temporally filtered image (0 to 0.25 Hz)
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${data_path}/Percent_Signal_Change/Temporally_Filtered/0-025/${s}/${s}-${c}-psc-tf025.nii.gz \
             --hemi ${h} \
             --o ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
# Smoothe the vol2surf projected image
    fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz \
        --tval ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        
        done
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz \
                   --o ${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

}
# Exports the function
export -f projection_smoothed

# Create an array of the subjects, as they appear in the RawData folder
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subjects array
echo ${s[@]}

parallel --jobs 0 'projection_smoothed {1}' ::: ${s[@]}
