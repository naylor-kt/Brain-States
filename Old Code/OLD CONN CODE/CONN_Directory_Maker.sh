#!/bin/bash

# This script is necessary because CONN saves the data to the folder where it finds the input image

# Redefine the arrays (subjects and condition, as well as the paths
subj=($(ls $HOME/Brain_States/RawData))
cond=(as ns vs)
data_path="$HOME/Brain_States"


for s in ${subj[@]}; do
mkdir -p ${data_path}/CONN/Data/${s}

    for c in ${cond[@]}; do
    mkdir -p ${data_path}/CONN/Data/${s}/${c}
    
    #Copy of the preprocessing image which had previously undergone robust fov (for registration in the preprocessing code)
    
    cp ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz ${data_path}/CONN/Data/${s}/${c}/${s}-${c}-preproc.nii.gz
    done

done
