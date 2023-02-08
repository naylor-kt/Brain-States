#!/bin/bash

#Define the function
fmri_preproc () {
data_path="$HOME/BrainStates";s=$1

#Array of conditions
cond=(as ns vs)

# Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/Level_1/$s
    mkdir -p $HOME/BrainStates_Test/Preproc/Level_2/
    mkdir -p $HOME/BrainStates_Test/Preproc/Level_3/
    
    preproc_path1="$HOME/BrainStates/Preproc/Level_1"
    preproc_path2="$HOME/BrainStates/Preproc/Level_2"
    preproc_path3="$HOME/BrainStates/Preproc/Level_3"
    
#Remove the first 10 volumes from each image
  for c in ${cond[@]}; do
   fslroi ${data_path}/RawData/${s}/func/${s}_task-${c}_bold.nii.gz ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz 10 -1
  done
  
  
  
#ORIGINAL MOTION PARAMETERS
mkdir -p ${data_path}/OriginalMotion/$s
for c in ${cond[@]}; do
    #Calculate the motion parameters to save but not to use
    mcflirt -in ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}-${c}_oringal_motion -plots -rmsrel -rmsabs -nn_final
done

#SLICE TIMING CORRECTION
for c in ${cond[@]}; do
    #Selects the repetition time from the file header, using the fslhd function with grep # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    #pixdim4 refers to the parameter which decribes the repetition time
    line=($(fslhd ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}
    
    #Performs slice time correction -r --> repetition time --odd --> specifies interleaved data
    slicetimer -i ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -o ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -r $tr --odd
done

#MOTION CORRECTION
#This time it will actually perform the motion correction, rather than just saving the motion parameters
mkdir -p ${preproc_path1}/$s/Motion_Correction
for c in ${cond[@]}; do
    #Create a mean image to use as the reference for the motion correction
    fslmaths ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -Tmean ${preproc_path1}/$s/Motion_Correction/${s}-${c}_preproc_mean
       
    #Perform the motion correction
    mcflirt -in ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -out ${preproc_path1}/$s/${s}-${c}-preproc -reffile ${preproc_path1}/$s/Motion_Correction/${s}-${c}_preproc_mean -mats -nn_final
       
    #Move the MAT file to the motion correction folder and rename
    mv ${preproc_path1}/$s/${s}-${c}-preproc.mat ${preproc_path1}/$s/Motion_Correction/${s}-${c}_motion_correction.mat
done
    
# DISTORTION CORRECTION
mkdir -p ${preproc_path1}/$s/TopUp/fmap

# As sub-07 has a different file structure for fmap, had to create if statements in order for the distortion correction to run correctly.
# This if statement specifies that is the subject is NOT sub-07 then do the following...

if [ ${s} != sub-07 ]; then
    # Can Make a single image file with the mean fmap and reverse fmap fieldmap images
        # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean
        # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
        # fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
    
    # Can make a single image file with the first volume from the fmap and reverse fmap images
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_fmap_1vol 0 1
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_revfmap_1vol 0 1
    fslmerge -t ${preproc_path1}/$s/TopUp/fmap/${s}_combined ${preproc_path1}/$s/TopUp/fmap/${s}_fmap_1vol ${preproc_path1}/$s/TopUp/fmap/${s}_revfmap_1vol
    
    
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${preproc_path1}/$s/TopUp/fmap/${s}_combined --datain=${data_path}/acq_params/acq_params.txt --out=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_revfmap_tuapp
     
     for c in ${cond[@]}; do
        # Call the APPLYTOPUP Function to the functional image
        applytopup  --imain=${preproc_path1}/$s/${s}-${c}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/${s}-${c}-preproc.nii.gz
    done
fi

# The following loops allow the distortion correction of sub-07
# The if statement means if the subject is sub-07 and the condition is as, then use the sub-07_field_map_as--- files
# else if the subject is sub-07 and the condition is NOT as then use the sub-07_field_map_ns_vs--- files

for c in ${cond[@]}; do

    if [ ${s} = sub-07 ] && [ ${c} = as ]; then

    # Make a single image file with the mean negative and positive fieldmap images
    # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_as.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_fmap_mean
    # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_as.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_revfmap_mean
    # fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_as_revfmap_mean
    
    # Can make a single image file with the first volume from the fmap and reverse fmap images
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map_as.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_fmap_as_1vol 0 1
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_as.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_revfmap_as_1vol 0 1
    fslmerge -t ${preproc_path1}/$s/TopUp/fmap/${s}_as_combined ${preproc_path1}/$s/TopUp/fmap/${s}_fmap_as_1vol ${preproc_path1}/$s/TopUp/fmap/${s}_revfmap_as_1vol
        
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${preproc_path1}/$s/TopUp/fmap/${s}_as_combined --datain=${data_path}/acq_params/acq_params.txt --out=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_as_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_as.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_as_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse_as.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_as_revfmap_tuapp
        
    # Call the APPLYTOPUP Function to the functional image
    applytopup  --imain=${preproc_path1}/$s/${s}-as-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_as_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/${s}-as-preproc.nii.gz
    
    elif [ ${s} = sub-07 ] && [ ${c} != as ]; then
    
    # Make a single image file with the mean negative and positive fieldmap images
    # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_ns_vs.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_fmap_mean
    # fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_ns_vs.nii.gz -Tmean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_revfmap_mean
    # fslmerge -t ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_combined ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_fmap_mean ${data_path}/Preproc/$s/TopUp/fmap/${s}_ns_vs_revfmap_mean
    
    # Can make a single image file with the first volume from the fmap and reverse fmap images
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map_ns_vs.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_fmap_1vol 0 1
    fslroi ${data_path}/RawData/$s/fmap/${s}_field_map_reverse_ns_vs.nii.gz ${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_revfmap_1vol 0 1
    fslmerge -t ${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_combined ${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_fmap_1vol ${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_revfmap_1vol
        
    # Make a directory to save the results from calling the TopUP function
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Results/
        
    # Call the TOPUP Function
    topup --imain=${preproc_path1}/$s/TopUp/fmap/${s}_ns_vs_combined --datain=${data_path}/acq_params/acq_params.txt --out=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results
        
    # Make a directory to save the results from calling APPLYTOPUP
    mkdir -p ${preproc_path1}/$s/TopUp/TopUp_Applied
        
    # Call the APPLYTOPUP Function to the negative image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_ns_vs.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_ns_vs_fmap_tuapp
        
    # Call the APPLYTOPUP Function to the positive image - this is for a later sanity check
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse_ns_vs.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/TopUp/TopUp_Applied/${s}_ns_vs_revfmap_tuapp
        
    # Call the APPLYTOPUP Function to the functional image
    applytopup  --imain=${preproc_path1}/$s/${s}-${c}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${preproc_path1}/$s/TopUp/TopUp_Results/${s}_ns_vs_topup_results --method=jac --interp=trilinear --out=${preproc_path1}/$s/${s}-${c}-preproc.nii.gz
    fi
done

# This is where the code branches, to have a version which undergoes registration, and a version which doesn't (and can therefore be used in freesurfer)
# SAVE MEAN AND BRAIN EXTRACTED IMAGES
    #Make a directory for registration to the standard space
    mkdir -p ${preproc_path1}/$s/Level_1_Mean/bet

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -Tmean ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz
    # Save a copy of the brain extracted image
    bet ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz ${preproc_path1}/$s/Level_1_Mean/bet/${s}-${c}_mean_func_bet -f 0.25 -m
done

# LEVEL 2 OF THE PREPROCESSING

# Convert the signal into PERCENTAGE SIGNAL CHANGE
for c in ${cond[@]}; do
mkdir -p ${preproc_path2}/Percent_Signal_Change/${s}

# functional image - mean functional image = (func-mean)
fslmaths ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -sub ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# (func-mean)/mean =psc
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -div ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# psc * 100
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mul 100 ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# apply the brain mask to the psc image
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mas ${preproc_path1}/$s/Level_1_Mean/bet/${s}-${c}_mean_func_bet_mask.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz
done

# Perform the TEMPORAL FILTERING of the signal
# Two separate strands a) Filtering 0.01-0.1 Hz b) Filtering 0-0.25 Hz

    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2
    
# Restricted Refers to the fitlering at 0.01 to 0.1 Hz

mkdir -p ${preproc_path2}/Temporally_Filtered/Restricted/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz
        
done

# Take the MEAN of the functional restricted filtered image
    mkdir -p ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tmean ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}_psc_Rtf_mean.nii.gz

done

# Wide Refers to the filtering at 0 to 0.25 Hz

mkdir -p ${preproc_path2}/Temporally_Filtered/Wide/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=(-1); tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz
        
done

# Take the MEAN of the functional wide filtered image
    mkdir -p ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -Tmean ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean/${s}-${c}_psc_Wtf_mean.nii.gz

done

# LEVEL 3 OF PREPROCESSING

# SPATIALLY SMOOTHE the function restricted filtered image

mkdir -p ${preproc_path3}/Restricted_Smoothed_1mm/${s}

for c in ${cond[@]}; do

     fwhm=1; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")
     
     susan ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -1 $sigma 3 1 1 ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}_psc_Rtf_mean.nii.gz -1 ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed
    
     fslmaths ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed.nii.gz -Tmin -bin  ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed-mask0 -odt char
     
     fslmaths ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed.nii.gz -mas ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed-mask0 ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed.nii.gz

    imrm ${preproc_path3}/Restricted_Smoothed_1mm/${s}/*usan_size.nii.gz ${preproc_path3}/Restricted_Smoothed_1mm/${s}/${s}-${c}-psc_Rtf_smoothed-mask0

done

# Take the MEAN of the functional restricted filtered and smoothed image
    mkdir -p ${preproc_path3}/Restricted_Smoothed/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path3}/Restricted_Smoothed/${s}/${s}-${c}-psc_Rtf_smoothed.nii.gz -Tmean ${preproc_path3}/Restricted_Smoothed/${s}/${s}-${c}-psc_Rtf_smoothed_mean.nii.gz

done

# SPATIALLY SMOOTHE the function Wide filtered image

mkdir -p ${preproc_path3}/Wide_Smoothed/${s}

for c in ${cond[@]}; do

     fwhm=5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")
     
     susan ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -1 $sigma 3 1 1 ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean/${s}-${c}_psc_Wtf_mean.nii.gz -1 ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed
    
     fslmaths ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed.nii.gz -Tmin -bin  ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed-mask0 -odt char
     
     fslmaths ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed.nii.gz -mas ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed-mask0 ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed.nii.gz

    imrm ${preproc_path3}/Wide_Smoothed/${s}/*usan_size.nii.gz ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed-mask0

done

# Take the MEAN of the functional wide filtered and smoothed image
    mkdir -p ${preproc_path3}/Wide_Smoothed/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed.nii.gz -Tmean ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed_mean.nii.gz
done

}

# Exports the function
export -f fmri_preproc

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'fmri_preproc {1}' ::: ${s[@]}
