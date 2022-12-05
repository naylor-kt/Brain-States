 # This script will run the native image (not registered to MNI) through temporal filtering and spatial smoothing

#It will then separately create an image registered to MNI space, and will then temporally filter and smooth this image

#Define the path
data_path="${HOME}/Brain_States"

#SAVE MEAN AND BRAIN EXTRACTED IMAGES

for s in `cat ${data_path}/subject_list.txt`; do
    #Make a directory for registration to the standard space
    mkdir -p ${data_path}/Registration/$s/Mean_Before_Filter
    
    #Take the mean of the functional image
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz
    
    # Save a copy of the brain extracted image
    bet ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func_bet -f 0.25 -m

done

# TEMPORAL FILTER AND CALCULATE DVARS VALUES (This is done the processed image, which will later remain the native image, and the functional time series will be saved in parallel as realgined to MNI space.

for s in `cat ${data_path}/subject_list.txt`; do
    
    # TEMPORAL FILTERING
        # Line --> sets the repetition time from the file header, using fslhd with grep
        # thp -> temporal high pass
        # tlp -> temporal low pass
    
        line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[2]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

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
        
        #Remove the unwanted files from the DVARS folder
        imrm  ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet_mask.nii.gz ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet.nii.gz ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS.nii.gz
    
done

#REGISTRATION

for s in `cat ${data_path}/subject_list.txt`; do
  
  #if [ ! -f ${data_path}/Registration/$s/${s}-struct2mni.nii.gz ]; then
  
  #REGISTRATION OF THE T1 STRUCTURAL IMAGE WITH MNI-152
  mkdir -p ${data_path}/Registration/$s/Struct
  
    #Perform ROBUST FIELD OF VIEW on the structural, T1 image
    robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${data_path}/Registration/$s/Struct/${s}_crop_struct
    
    
    # Use flirt with 12 DOF with the sturctural image (T1) and MNI-2mm, with the default cost function --> corratio
  
    flirt -in ${data_path}/Registration/$s/Struct/${s}_crop_struct \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat ${data_path}/Registration/$s/${s}-struct2mni.mat \
    -dof 12
    
    # Use fnirt with the structural image and MNI-152

    fnirt --in=${data_path}/Registration/$s/Struct/${s}_crop_struct \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${data_path}/Registration/$s/${s}-struct2mni.mat \
          --cout=${data_path}/Registration/$s/${s}-struct2mni_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    # Apply warp to register the structural image to MNI space
    
    applywarp -i ${data_path}/Registration/$s/Struct/${s}_crop_struct \
    -o ${data_path}/Registration/$s/${s}-struct2mni.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${data_path}/Registration/$s/${s}-struct2mni_warp

    # Produce the inverse warp image for quality control purposes

    invwarp --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${data_path}/Registration/$s/${s}-mni2struct_warp \
            --ref=$${data_path}/Registration/$s/Struct/${s}_crop_struct

  # REGISTRATION OF THE MEAN FUNCTIONAL IMAGE TO THE STRUCTURAL T1 IMAGE, with 6 DOF
  
    #Flirt using the mean image, which was created earlier, prior to temporal filtering
    
    flirt -in ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz \
    -ref ${data_path}/Registration/$s/Struct/${s}_crop_struct \
    -omat ${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
    -out ${data_path}/Registration/$s/${s}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6

 # APPLY THE WARP FIELDS TO TRANSFORM THE FUNCTIONAL TIMESERIES FROM NATIVE TO STANDARD (MNI-152) SPACE

   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/${s}-preproc.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
   --out=${data_path}/Registration/$s/${s}-func2mni.nii.gz
   

# Apply the warp field to the mean functional image, as a quality control check

    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
   --out=${data_path}/Registration/$s/${s}-MEANfunc2mni.nii.gz
   

   # fi
done

# Apply SPATIAL SMOOTHING to the normalised image

for s in `cat ${data_path}/subject_list.txt`; do

mkdir -p ${data_path}/Registration/$s/Smoothed/Mean

fslmaths ${data_path}/Registration/$s/${s}-func2mni.nii.gz -Tmean ${data_path}/Registration/$s/Smoothed/Mean/${s}_normfuncmean

#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Registration/$s/${s}-func2mni.nii.gz -1 $sigma 3 1 1 ${data_path}/Registration/$s/Smoothed/Mean/${s}_normfuncmean -1 ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed

fslmaths ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed.nii.gz -Tmin -bin  ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed-mask0 -odt char

fslmaths ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed.nii.gz -mas ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed-mask0 ${data_path}/Registration/$s/Smoothed/${s}-norm-smoothed.nii.gz

# imrm ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/*usan_size.nii.gz ${data_path}/Preproc/$s/${s}-mask0

done
