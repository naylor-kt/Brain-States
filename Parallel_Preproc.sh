#!/bin/bash
#Define the function
fmri_preproc () {
data_path="$HOME/Brain_States";s=$1

#Array of conditions
cond=(as ns vs)

# Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/$s

#Remove the first 10 volumes from each image
  for c in ${cond[@]}; do
   fslroi ${data_path}/RawData/${s}/func/${s}_task-${c}_bold.nii.gz ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz 10 -1
  done
  
  
#ORIGINAL MOTION PARAMETERS
mkdir -p ${data_path}/OriginalMotion/$s
for c in ${cond[@]}; do
    #Calculate the motion parameters to save but not to use
    mcflirt -in ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}-${c}_oringal_motion -plots -rmsrel -rmsabs -spline_final
done

#SLICE TIMING CORRECTION
for c in ${cond[@]}; do
    #Selects the repetition time from the file header, using the fslhd function with grep # if using z-shell tr=${line[2]}, if using bash tr=${line[1]} 
    #pixdim4 refers to the parameter which decribes the repetition time
    line=($(fslhd ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}
    
    #Performs slice time correction -r --> repetition time --odd --> specifies interleaved data
    slicetimer -i ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -o ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -r $tr --odd
done

#MOTION CORRECTION
#This time it will actually perform the motion correction, rather than just saving the motion parameters 
mkdir -p ${data_path}/Preproc/$s/Motion_Correction
for c in ${cond[@]}; do
    #Create a mean image to use as the reference for the motion correction
    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/Motion_Correction/${s}-${c}_preproc_mean
       
    #Perform the motion correction
    mcflirt -in ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -out ${data_path}/Preproc/$s/${s}-${c}-preproc -reffile ${data_path}/Preproc/$s/Motion_Correction/${s}-${c}_preproc_mean -mats -spline_final
       
    #Move the MAT file to the motion correction folder and rename
    mv ${data_path}/Preproc/$s/${s}-${c}-preproc.mat ${data_path}/Preproc/$s/Motion_Correction/${s}-${c}_motion_correction.mat
done
    
# DISTORTION CORRECTION
mkdir -p ${data_path}/Preproc/$s/TopUp/fmap

# As sub-07 has a different file structure for fmap, had to create if statements in order for the distortion correction to run correctly.
# This if statement specifies that is the subject is NOT sub-07 then do the following...

if [ ${s} != sub-07 ]; then
    # Make a single image file with the mean negative and positive fieldmap images
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
    fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
        
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${data_path}/Preproc/$s/TopUp/fmap/${s}_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_revfmap_tuapp
     
     for c in ${cond[@]}; do
        # Call the APPLYTOPUP Function to the functional image
        applytopup  --imain=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz
    done
fi

# The following loops allow the distortion correction of sub-07 
# The if statement means if the subject is sub-07 and the condition is as, then use the sub-07_field_map_as--- files
# else if the subject is sub-07 and the condition is NOT as then use the sub-07_field_map_ns_vs--- files

for c in ${cond[@]}; do

    if [ ${s} = sub-07 ] && [ ${c} = as ]; then

    # Make a single image file with the mean negative and positive fieldmap images
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_as.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_fmap_mean
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_as.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_revfmap_mean
    fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_revfmap_mean
        
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${data_path}/Preproc/$s/TopUp/fmap/${s}_as_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_as_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_as.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_as_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse_as.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_as_revfmap_tuapp
        
    # Call the APPLYTOPUP Function to the functional image
    applytopup  --imain=${data_path}/Preproc/$s/${s}-as-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-as-preproc.nii.gz
    
    elif [ ${s} = sub-07 ] && [ ${c} != as ]; then
    
    # Make a single image file with the mean negative and positive fieldmap images
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_ns_vs.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_fmap_mean
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_ns_vs.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_revfmap_mean
    fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_revfmap_mean
        
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_ns_vs.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_ns_vs_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse_ns_vs.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_ns_vs_revfmap_tuapp
        
    # Call the APPLYTOPUP Function to the functional image
    applytopup  --imain=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz
    fi
done

# This is where the code branches, to have a version which undergoes registration, and a version which doesn't (and can therefore be used in freesurfer)
# SAVE MEAN AND BRAIN EXTRACTED IMAGES
    #Make a directory for registration to the standard space
    mkdir -p ${data_path}/Registration/$s/Mean_Before_Filter/bet
for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -Tmean ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz
    # Save a copy of the brain extracted image
    bet ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz ${data_path}/Registration/$s/Mean_Before_Filter/bet/${s}-${c}_mean_func_bet -f 0.25 -m
done

#TEMPORAL FILTERING of the non-registered functional image
    # Line --> sets the repetition time from the file header, using fslhd with grep
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, which is expressed as time as a multiple of the repetition time * 2
    # tlp -> temporal low pass, which is expressed as time as a multiple of the repetition time * 2 
mkdir -p ${data_path}/Preproc/$s/Temp_Filt
for c in ${cond[@]}; do
    line=($(fslhd ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-${c}-mean.nii.gz

    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -bptf $thp $tlp  -add ${data_path}/Preproc/$s/${s}-${c}-mean.nii.gz ${data_path}/Preproc/$s/Temp_Filt/${s}-${c}-preproc_TempFilt.nii.gz
        
    imrm ${data_path}/Preproc/$s/${s}-${c}-mean.nii.gz
done

#DVARS 
# NB This is not used any further in this code, but there is potential it could be used to despike the data in future analyses
    #Create directory for the DVARS files
    mkdir -p ${data_path}/Preproc/$s/DVARS
for c in ${cond[@]}; do
    #Create a binary mask for the image
    # Generate a mean image from the preprocessed functional image
    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS
       
    # Generate a binary mask
    bet ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS_bet -f 0.25 -m
        
    # Multiply the image with the brain mask
    fslmaths ${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz -mas ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS_bet_mask ${data_path}/Preproc/$s/DVARS/${s}-${c}_preproc_bet
        
    #Find the outliers
    fsl_motion_outliers -i ${data_path}/Preproc/$s/DVARS/${s}-${c}_preproc_bet -o ${data_path}/Preproc/$s/DVARS/${s}-${c}_dvars --dvars --nomoco -s ${data_path}/Preproc/$s/DVARS/${s}-${c}_dvars.txt
        
    #Remove the unwanted files from the DVARS folder
    imrm  ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS_bet_mask.nii.gz ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS_bet.nii.gz ${data_path}/Preproc/$s/DVARS/${s}-${c}_mean4DVARS.nii.gz
done


#REGISTRATION

#REGISTRATION OF THE T1 STRUCTURAL IMAGE WITH MNI-152
    mkdir -p ${data_path}/Registration/$s/Struct

 #Perform ROBUST FIELD OF VIEW on the structural, T1 image
    robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz
    
#Bias Correction (nonpve prevents fast from performing segmentation of the image) 
fast -B --nopve ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Registration/$s/Struct/${s}_crop_struct_restore -1 $sigma 3 1 0 ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

#Remove the unecessary files
imrm ${data_path}/Registration/$s/Struct/${s}_crop_struct_*
    
 #Use flirt with 12 DOF with the structural image (T1) and MNI-2mm, with the default cost function --> corratio
  flirt -in ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
        -ref $FSLDIR/data/standard/MNI152_T1_2mm \
        -omat ${data_path}/Registration/$s/${s}-struct2mni.mat \
        -dof 12
    
 #Use fnirt with the structural image and MNI-152 (non-linear)
    fnirt --in=${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${data_path}/Registration/$s/${s}-struct2mni.mat \
          --cout=${data_path}/Registration/$s/${s}-struct2mni_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

 #Apply warp to register the structural image to MNI space
    applywarp -i ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
    -o ${data_path}/Registration/$s/${s}-struct2mni.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${data_path}/Registration/$s/${s}-struct2mni_warp

 #Produce the inverse warp image for quality control purposes
    invwarp --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${data_path}/Registration/$s/${s}-mni2struct_warp \
            --ref=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz

for c in ${cond[@]}; do
  #REGISTRATION OF THE MEAN FUNCTIONAL IMAGE TO THE STRUCTURAL T1 IMAGE, with 6 DOF
  
    #Flirt using the mean image, which was created earlier, prior to temporal filtering
    # interpolation -> by nearest neighbour (as registering a functional image with large voxels, to the structural image (stops image looking smoothed)
    # cost function -> mutal information (whilst this takes longer, when tested it performed better than the other cost functions)
    
    flirt -in ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz \
    -ref ${data_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
    -omat ${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
    -interp nearestneighbour \
    -out ${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6

 # APPLY THE WARP FIELDS TO TRANSFORM THE FUNCTIONAL TIMESERIES FROM NATIVE TO STANDARD (MNI-152) SPACE
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${data_path}/Registration/$s/${s}-${c}-func2mni.nii.gz
   

# Apply the warp field to the mean functional image, as a quality control check
    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${data_path}/Registration/$s/${s}-${c}-MEANfunc2mni.nii.gz
done



#SPATIAL SMOOTHING of the normalised image
for c in ${cond[@]}; do
#SPATIAL SMOOTHING of the normalised image
    mkdir -p ${data_path}/Registration/$s/Smoothed/Mean

    fslmaths ${data_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -Tmean ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean

    # Spatial Smoothing 
    # fwhm = 5  2.5 seemed insufficient
    fwhm=5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    susan ${data_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -1 $sigma 3 1 1 ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean -1 ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -Tmin -bin  ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed-mask0 -odt char

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -mas ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed-mask0 ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz

    imrm ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean ${data_path}/Registration/$s/Smoothed/*usan_size.nii.gz ${data_path}/Registration/$s/Smoothed/${s}-${c}-mask0
done

#TEMPORAL FILTERING
    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2 

mkdir -p ${data_path}/Registration/$s/Temp_Filt
for c in ${cond[@]}; do
    line=($(fslhd ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -Tmean ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -bptf $thp $tlp  -add ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz ${data_path}/Registration/$s/Temp_Filt/${s}-${c}-func2mni_Smoothed_TempFilt.nii.gz
        
    imrm ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz
done

}

# Exports the function
export -f fmri_preproc

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'fmri_preproc {1}' ::: ${s[@]}
