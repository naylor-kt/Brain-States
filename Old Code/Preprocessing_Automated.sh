data_path="${HOME}/Brain_States"

# Create a subject list

ls ${data_path}/RawData >> ${data_path}/subject_list.txt

for s in `cat ${data_path}/subject_list.txt`; do
    # Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/$s
    
    # Remove the first 10 volumes from each image
    fslroi ${data_path}/RawData/${s}/func/*_task-ns_bold.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz 10 -1
    
    #ORIGINAL MOTION PARAMETERS
    #Calculate the motion parameters to save but not to use
    mkdir -p ${data_path}/OriginalMotion/$s
    mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}_oringal_motion -plots -rmsrel -rmsabs -spline_final
       
    #SLICE TIMING CORRECTION
    
    #Selects the repetition time from the file header, using the fslhd function with grep
    line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[2]}
    
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
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_neg_tuapp
        
                
        # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
        applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_pos_tuapp
        
        # Call the APPLYTOPUP Function to the functional image
        applytopup  --imain=${data_path}/Preproc/$s/${s}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-preproc.nii.gz
        done
