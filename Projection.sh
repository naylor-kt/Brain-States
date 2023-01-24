#!/bin/bash

projection (){

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

#Make directory to save the projected data for 0.01 to 0.1 filtered image
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected/Temporally_Filtered/001-01/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${data_path}/Percent_Signal_Change/Temporally_Filtered/001-01/${s}/${s}-${c}-psc-tf.nii.gz \
             --hemi ${h} \
             --o ${fs_path}/Registration/$s/Projected/Temporally_Filtered/001-01/${s}-${c}-${h}-tf-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${fs_path}/Registration/$s/Projected/Temporally_Filtered/001-01/${s}-${c}-${h}-tf-fsavg.mgz \
                   --o ${fs_path}/Registration/$s/Projected/Temporally_Filtered/001-01/${s}-${c}-${h}-tf-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

#Make directory to save the projected data for 0-0.25hz  Temporally filtered image
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected/Temporally_Filtered/0-025/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${data_path}/Percent_Signal_Change/Temporally_Filtered/0-025/${s}/${s}-${c}-psc-tf025.nii.gz \
             --hemi ${h} \
             --o ${fs_path}/Registration/$s/Projected/Temporally_Filtered/0-025/${s}-${c}-${h}-tf025-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${fs_path}/Registration/$s/Projected/Temporally_Filtered/0-025/${s}-${c}-${h}-tf025-fsavg.mgz \
                   --o ${fs_path}/Registration/$s/Projected/Temporally_Filtered/0-025/${s}-${c}-${h}-tf025-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

}
# Exports the function
export -f projection

# Create an array of the subjects, as they appear in the RawData folder
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subjects array
echo ${s[@]}

parallel --jobs 0 'projection {1}' ::: ${s[@]}
