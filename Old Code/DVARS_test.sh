 #!/bin/bash
rsfmri_preproc () {
data_path="$HOME/BS_Test";s=$1

# Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/$s

# Remove the first 10 volumes from each image
   fslroi ${data_path}/RawData/${s}/func/*_task-ns_bold.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz 10 -1

#ORIGINAL MOTION PARAMETERS
#Calculate the motion parameters to save but not to use
    mkdir -p ${data_path}/OriginalMotion/$s
    mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}_oringal_motion -plots -rmsrel -rmsabs -spline_final

#SLICE TIMING CORRECTION
    
    #Selects the repetition time from the file header, using the fslhd function with grep # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}
    
    #Performs slice time correction -r --> repetition time --odd --> specifies interleaved data
    slicetimer -i ${data_path}/Preproc/$s/${s}-preproc.nii.gz -o ${data_path}/Preproc/$s/${s}-preproc.nii.gz -r $tr --odd
    
# MOTION CORRECTION
       mkdir -p ${data_path}/Preproc/$s/Motion_Correction
       
       #Create a mean image to use as the reference for the motion correction
       fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/Motion_Correction/${s}_preproc_mean
       
       #Perform the motion correction
       mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/Preproc/$s/${s}-preproc -reffile ${data_path}/Preproc/$s/Motion_Correction/${s}_preproc_mean -mats -spline_final
       
       #Move the MAT file to the motion correction folder and rename
       mv ${data_path}/Preproc/$s/${s}-preproc.mat ${data_path}/Preproc/$s/Motion_Correction/${s}_motion_correction.mat
       
# DISTORTION CORRECTION
       # Make a single image file with the mean negative and positive fieldmap images
        mkdir -p ${data_path}/Preproc/$s/TopUp/fmap
        
        fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz -Tmean /${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean
        fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz -Tmean /${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
        fslmerge -t /${data_path}/Preproc/$s/TopUp/fmap/${s}_combined /${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean /${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
        
        # Make a directory to save the results from calling the TopUP function
        mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Results/
        
        # Call the TOPUP Function
        topup --imain=/${data_path}/Preproc/$s/TopUp/fmap/${s}_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results
        
        # Make a directory to save the results from calling APPLYTOPUP
        mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Applied
        
        # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_fmap_tuapp
        
        # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_revfmap_tuapp
        
        # Call the APPLYTOPUP Function to the functional image
        applytopup  --imain=${data_path}/Preproc/$s/${s}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-preproc.nii.gz
       

#SAVE MEAN AND BRAIN EXTRACTED IMAGES

    #Make a directory for registration to the standard space
    mkdir -p ${data_path}/Registration/$s/Mean_Before_Filter
    
    #Take the mean of the functional image
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz
    
    # Save a copy of the brain extracted image
    bet ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func_bet -f 0.25 -m

# TEMPORAL FILTERING
    # Line --> sets the repetition time from the file header, using fslhd with grep
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass
    # tlp -> temporal low pass
    
    line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz

    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -bptf $thp $tlp  -add ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz
        
    imrm ${data_path}/Preproc/$s/${s}-mean.nii.gz

#DVARS
    #Create directory for the DVARS files
        mkdir -p ${data_path}/Preproc/$s/DVARS
    
    #Create a binary mask for the image
    # Generate a mean image from the preprocessed functional image

    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS
       
    # Generate a binary mask
        
    bet ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet -f 0.25 -m
        
    # Multiply the image with the brain mask
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -mas ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet_mask ${data_path}/Preproc/$s/DVARS/${s}_preproc_bet
        
    #Find the outliers
    fsl_motion_outliers -i ${data_path}/Preproc/$s/DVARS/${s}_preproc_bet -o ${data_path}/Preproc/$s/DVARS/${s}_dvars --dvars --nomoco -s ${data_path}/Preproc/$s/DVARS/${s}_dvars.txt
}
export -f rsfmri_preproc

s=($(ls $HOME/BS_Test/RawData))



parallel --jobs 3 'rsfmri_preproc {1}' ::: ${s[@]}
