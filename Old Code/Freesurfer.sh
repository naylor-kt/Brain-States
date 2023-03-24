#!/bin/bash
# This script contains the preparation of the T1 image ready for freesurfer, the reconstruction of the cortical surface, and the conversion of file types.

# Define the initial function (preparation of the T1 image, and the execution of freesurfer) 

free_surfing (){

# Make a new directory for the freesurfer files
mkdir -p $HOME/Brain_States/Freesurfer

#Set the regular data_path, as has been used in the preprocessing script
data_path="$HOME/Brain_States"

#Set a new freesurfer path (just to simplfy the later code)
fs_path="$HOME/Brain_States/Freesurfer";s=$1

#PREPARE THE T1 IMAGE
# Make a directory for the free surfer files
mkdir -p ${fs_path}/Struct/$s

#Copy of the T1 image which had previously undergone robust fov, bias correction and slight smoothing (for registration in the preprocessing code)
cp ${data_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz ${fs_path}/Struct/$s/${s}_T1.nii.gz

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
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subjects array 
echo ${s[@]}

# Runs the function in parallel (essential as free surfer takes so long)
# Setting the jobs to 0 -> allows parallel to divide the jobs across the CPUs in the most efficient way
parallel --jobs 0 'free_surfing {1}' ::: ${s[@]}


# Convert files from the freesurfer form to the fsl form 

# Redefine the arrays (subjects and condition, as well as the paths
subj=($(ls $HOME/Brain_States/RawData))
cond=(as ns vs)
data_path="$HOME/Brain_States"
fs_path="$HOME/Brain_States/Freesurfer"
SUBJECTS_DIR="${fs_path}/Recon"

for s in ${subj[@]}; do
mkdir -p ${fs_path}/Registration/${s}

    for c in ${cond[@]}; do
#Make for loop for condition instead, just to be sure of preprocessing problem
    
        if [ ! -f $pth/reg/${s}-${c}_mean2fs.lta ]; then

        # obtain registration from t1 (fsl) to orig (fs) & concatenate with mean2t1;

        tkregister2 --mov ${fs_path}/Struct/$s/${s}_T1.nii.gz --targ $SUBJECTS_DIR/${s}/mri/orig.mgz --s ${s} \
        --reg ${fs_path}/Registration/${s}/${s}_fsl2fs.dat --ltaout ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --noedit --regheader

        lta_convert --inlta ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --outfsl ${fs_path}/Registration/${s}/${s}_fsl2fs.mat

        convert_xfm -omat ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat -concat ${fs_path}/Registration/${s}/${s}_fsl2fs.mat ${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat

        lta_convert --infsl ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat --outreg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.dat --outlta ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
        --subject ${s} --src ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz --trg $SUBJECTS_DIR/$subj/mri/orig.mgz
        fi
    done
done






    


