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

#FILTER SMOOTHE AND REGISTRATION 
for s in `cat ${data_path}/subject_list.txt`; do

#Temporal Filtering
line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[2]}; tf=$(bc -l <<< "100/($tr*2)"); tf2=$(bc -l <<< "10/($tr*2)")

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -bptf $tf $tf2  -add ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz
        
#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Preproc/$s/${s}-preproc.nii.gz -1 $sigma 3 1 1 ${data_path}/Preproc/$s/${s}-mean.nii.gz -1 ${data_path}/Preproc/$s/${s}-preproc.nii.gz


fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmin -bin  ${data_path}/Preproc/$s/${s}-mask0 -odt char
fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -mas ${data_path}/Preproc/$s/${s}-mask0 ${data_path}/Preproc/$s/${s}-preproc.nii.gz

imrm ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/*usan_size.nii.gz ${data_path}/Preproc/$s/${s}-mask0

<<<<<<< HEAD
# Registration of structural image to MNI Space
  mkdir -p ${data_path}/Registration/$s
  
  if [ ! -f ${data_path}/Registration/$s/${s}-t12std.nii.gz ]; then
    
    
    # Register the structural image to MNI
    
    #1) Brain extract the structural image
    bet ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz ${data_path}/Registration/$s/${s}-struct_betted.nii.gz -f 0.25
    
    #2) Use flirt with the brain extracted structural image and MNI-152 standard
    flirt -in ${data_path}/Registration/$s/${s}-struct_betted.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat ${data_path}/Registration/$s/${s}-struct2mni.mat \
    -cost mutualinfo \
    -dof 12

    #3) Use fnirt with the structural image and MNI152
    fnirt --in=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${data_path}/Registration/$s/${s}-struct2mni.mat \
          --cout=${data_path}/Registration/$s/${s}-struct2mni_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10
    
    #4) Apply the warp parameters to save the structural image which has been warped to MNI152 space
    applywarp -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
    -o ${data_path}/Registration/$s/${s}-struct2mni.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${data_path}/Registration/$s/${s}-struct2mni_warp

    #5) Produce in the inverse warp image for quality control
    invwarp --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${data_path}/Registration/$s/${s}-mni2struct_warp \
            --ref=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz

    
    # Register the functional image to the structural image
    # A) Produce the mean functional image
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz
    
    # B) Use flirt with the mean functional image, with the betted structural image as a reference
    # This is rigid body transformation therefore use 6 degrees of freedom
    flirt -in ${data_path}/Preproc/$s/${s}-mean.nii.gz \
    -ref ${data_path}/Registration/$s/${s}-struct_betted.nii.gz \
    -omat ${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
    -out ${data_path}/Registration/$s/${s}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6

    # C) Apply the warp field to transform the functional image into MNI152 space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/${s}-preproc.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
   --out=${data_path}/Registration/$s/${s}-func2mni.nii.gz \

    fi
done

