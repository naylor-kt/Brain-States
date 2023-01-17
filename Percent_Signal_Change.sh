#!/bin/bash

#  Percent_Signal_Change.sh
# This will convert the raw signal into the percentage signal change
percent_sig_change (){
#Set the data_path to the relevant folder
data_path="$HOME/Brain_States";s=$1

# Make a new directory for the percent signal change data

mkdir -p ${data_path}/Percent_Signal_Change

# The conditions array
cond=(as ns vs)

# THIS IS FOR THE NON-REGISTERED FUNCTIONAL IMAGES

for c in ${cond[@]}; do

# NON-TEMPORALLY FILTERED IMAGE
mkdir -p ${data_path}/Percent_Signal_Change/Non_Filtered/${s}

#Take the mean of the non-filtered functional image
fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -Tmean ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-mean.nii.gz

#Create a brain mask from the mean functional image
bet ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-bet.nii.gz -m

# functional image - mean functional image = (func-mean)
fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -sub ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-func-mean.nii.gz

# (func-mean)/mean =psc
fslmaths ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-func-mean.nii.gz -div ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc.nii.gz

# psc * 100
fslmaths ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc.nii.gz -mul 100 ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc.nii.gz

# apply the brain mask to the psc image
fslmaths ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc.nii.gz -mas ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-bet_mask.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc.nii.gz

# The notation used above nft = non-temporally filtered and psc = percentage signal change
imrm ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-func-mean.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-bet_mask.nii.gz ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-bet.nii.gz


done


# THIS IS FOR THE NON-REGISTERED FUNCTIONAL IMAGES
for c in ${cond[@]}; do

# TEMPORALLY FILTERED IMAGE
mkdir -p ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}

#Take the mean of the functionally filtered image
fslmaths ${data_path}/Preproc/$s/Temp_Filt/${s}-${c}-preproc_TempFilt.nii.gz -Tmean ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-mean.nii.gz

#Create a brain mask from the mean functional image
bet ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-bet.nii.gz -m

# functional image - mean = (func-mean)
fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -sub ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-func-mean.nii.gz

# (func-mean) / mean =psc
fslmaths ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-func-mean.nii.gz -div ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-mean.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-tf-psc.nii.gz

# psc * 100
fslmaths ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-tf-psc.nii.gz -mul 100 ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-tf-psc.nii.gz

# The notation used above nft = non-temporally filtered and psc = percentage signal change

# apply the brain mask to the psc image
fslmaths ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-tf-psc.nii.gz -mas ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-bet_mask.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-tf-psc.nii.gz

# The notation used above nft = non-temporally filtered and psc = percentage signal change
imrm ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-func-mean.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-bet_mask.nii.gz ${data_path}/Percent_Signal_Change/Temp_Filtered/${s}/${s}-${c}-bet.nii.gz

  
done

}

export -f percent_sig_change

# The array of the subjects
s=($(ls $HOME/Brain_States/RawData))
# Check the contents of the subjects array
echo ${s[@]}

# Run the function in parallel
parallel --jobs 0 'percent_sig_change {1}' ::: ${s[@]}
