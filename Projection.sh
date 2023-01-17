#!/bin/bash

projection (){

#Set the regular data_path, as has been used in the preprocessing script
data_path="$HOME/Brain_States_Test"

#Set the freesurfer path (just to simplfy the later code)
fs_path="$HOME/Brain_States_Test/Freesurfer";s=$1

#Provide the location of SUBJECTS_DIR
SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

#Make directory to save the projected data
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz \
             --hemi ${h} \
             --o ${fs_path}/Registration/$s/Projected/${s}-${c}-${h}.fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${fs_path}/Registration/${s}/Projected/${s}-${c}-$h.fsavg.mgz \
                   --o ${fs_path}/Registration/${s}/Projected/${s}-${c}-${h}.fsavg.mgz \
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
parallel --jobs 1 'projection {1}' ::: ${s[@]}

        ${data_path}/Registration/${s}/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz
