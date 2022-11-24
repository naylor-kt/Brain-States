data_path="${HOME}/Brain_States"

# Create a subject list

ls ${data_path}/RawData >> ${data_path}/subject_list.txt

for s in `cat ${data_path}/subject_list.txt`; do
    # Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/$s
    
    # Remove the first 10 volumes from each image
    fslroi ${data_path}/RawData/${s}/func/*_task-ns_bold.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz 10 -1
    
    #Calculate the motion parameters to save but not to use
    mkdir -p ${data_path}/OriginalMotion/$s
    mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}_oringal_motion -plots -rmsrel -rmsabs -spline_final
       
    #Perform Slice Timing Correction
    slicetimer -i ${data_path}/Preproc/$s/${s}-preproc.nii.gz -o ${data_path}/Preproc/$s/${s}-preproc.nii.gz -r 2 --odd
    
    #Perform Motion Correction
        # Make a single image file with the mean negative and positive images
        fslmaths ${data_path}/RawData/$s/fmap/*_field_map.nii.gz -Tmean /${data_path}/RawData/$s/fmap/${s}_neg_mean
        fslmaths ${data_path}/RawData/$s/fmap/*_field_map_reverse.nii.gz -Tmean /${data_path}/RawData/$s/fmap/${s}_pos_mean
        fslmerge -t ${data_path}/RawData/$s/fmap/${s}_combined ${data_path}/RawData/$s/fmap/${s}_neg_mean ${data_path}/RawData/$s/fmap/${s}_pos_mean
        
        # Call the TOPUP Function
        topup --imain=${data_path}/RawData/$s/fmap/${s}_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/RawData/$s/fmap/${s}_topup_results
        
        # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/RawData/$s/fmap/${s}_topup_results --method=jac --out=${data_path}/RawData/$s/fmap/${s}_neg_tuapp
        
                
        # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/RawData/$s/fmap/${s}_topup_results --method=jac --out=${data_path}/RawData/$s/fmap/${s}_pos_tuapp
        
        # Call the APPLYTOPUP Function to the functional image
        applytopup  --imain=${data_path}/Preproc/$s/${s}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/RawData/$s/fmap/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-preproc.nii.gz
        
    #Create a binary mask for the image
        # Generate a mean image from the preprocessed functional image
        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}_preproc_mean
        # Generate a binary mask
        bet ${data_path}/Preproc/$s/${s}_preproc_mean ${data_path}/Preproc/$s/${s}_preproc_bet -f 0.25 -m
        
        # Multiply the image with the brain mask
        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -mas ${data_path}/Preproc/$s/${s}_preproc_bet_mask ${data_path}/Preproc/$s/${s}-preproc.nii.gz
        
        #Find the outliers
        mkdir -p ${data_path}/DVARS/$s
        fsl_motion_outliers -i ${data_path}/Preproc/$s/${s}-preproc.nii.gz -o ${data_path}/DVARS/$s/${s}_dvars --dvars --nomoco -s ${data_path}/DVARS/$s/${s}_dvars.txt
        
    
    imrm ${data_path}/Preproc/$s/${s}_preproc_bet_mask.nii.gz ${data_path}/Preproc/$s/${s}_preproc_bet.nii.gz ${data_path}/Preproc/$s/${s}_preproc_mean.nii.gz
   
    done
