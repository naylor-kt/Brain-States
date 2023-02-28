#!/bin/bash

MNI_ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

mkdir -p $HOME/BrainStates/Analysis/Analysis1_Mask2

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates/Analysis/"
vol_path="$HOME/BrainStates/Volumetric"

cond=(as ns vs)
hemi=(lh rh)

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do

    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-MNI.nii.gz
   
    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-MNI.nii.gz

done

}

export -f MNI_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'MNI_ALFF {1}' ::: ${s[@]}


