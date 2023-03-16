#!/bin/bash

mkdir -p $HOME/BrainStates_Test/Surface

# Step ONE of surface processing is to perform recon-all on the structural T1 images

# Define the function
free_surfing () {

# Make a new directory for the freesurfer files
mkdir -p $HOME/Brain_States_Test/Surface/Freesurfer

#Set the path variables
data_path="$HOME/BrainStates_Test"
vol_path="$HOME/BrainStates_Test/Volumetric"
surf_path="$HOME/BrainStates_Test/Surface"
fs_path="$HOME/BrainStates_Test/Surface/Freesurfer";s=$1


#Array of conditions
cond=(as ns vs)

#PREPARE THE T1 IMAGE
# Make a directory for the free surfer files
mkdir -p ${fs_path}/Struct/$s

#Copy of the T1 image which had previously undergone robust fov, bias correction and slight smoothing (for registration in the preprocessing code)
cp ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz ${fs_path}/Struct/$s/${s}_T1.nii.gz

# These sections are commented out, as these stages have already be performed as part of the registration in the Parallel_Preproc.sh

    # Take a robust field of view from the original t1 image
    # robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${fs_path}/Struct/$s/${s}_T1.nii.gz
    
    #Bias Correction (nonpve prevents fast from performing segmentation of the image)
    # fast -B --nopve ${fs_path}/Struct/$s/${s}_T1.nii.gz

    #Spatial Smoothing
    # fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    # susan ${fs_path}/Struct/$s/${s}_T1_restore -1 $sigma 3 1 0 ${fs_path}/Struct/$s/${s}_T1

    #Remove the unecessary files
    # imrm ${fs_path}/Struct/$s/${s}_T1_*

#APPLY FREESURFER

# Create a folder for the results of recon-all
mkdir -p ${fs_path}/Recon

# export the subjects_dir to the folder desired, make sure there are no subject folders already here (recon-all won't like that!
export SUBJECTS_DIR="${fs_path}/Recon"

# Executes freesurfer ( as long as it hasn't been previously done)
 if [ ! -d $SUBJECTS_DIR/${s} ]; then

        recon-all -i ${fs_path}/Struct/$s/${s}_T1.nii.gz -s ${s} -all
fi
}

# Exports the function
export -f free_surfing

# Creates the subjects array, as the subjects are found in the RawData folder
#s=($(ls $HOME/BrainStates/RawData))
s=(sub-06)

# Check the contents of the subjects array
echo ${s[@]}

# Runs the function in parallel (essential as free surfer takes so long)
# Setting the jobs to 0 -> allows parallel to divide the jobs across the CPUs in the most efficient way
parallel --jobs 0 'free_surfing {1}' ::: ${s[@]}
