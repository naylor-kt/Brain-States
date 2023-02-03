#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates";s=$1

mkdir -p $HOME/BrainStates_Test/Analysis/

preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
analysis_path="$HOME/BrainStates/Analysis"

cond=(as ns vs)


#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Un-smoothed/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tstd ${analysis_path}/ALFF/Un-smoothed/${s}/${s}-${c}-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Un-smoothed/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -Tstd ${analysis_path}/fALFF/Un-smoothed/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Un-smoothed/${s}/${s}-${c}-ALFF -div ${analysis_path}/fALFF/Un-smoothed/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz ${analysis_path}/fALFF/Un-smoothed/${s}/${s}-${c}-fALFF.nii.gz

done

# REPEAT the smoothed image

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Smoothed/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path3}/Restricted_Smoothed/${s}/${s}-${c}-psc_Rtf_smoothed.nii.gz -Tstd ${analysis_path}/ALFF/Smoothed/${s}/${s}-${c}-SM-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Smoothed/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed.nii.gz -Tstd ${analysis_path}/fALFF/Smoothed/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SM-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Smoothed/${s}/${s}-${c}-SM-ALFF -div ${analysis_path}/fALFF/Smoothed/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SM-SD.nii.gz ${analysis_path}/fALFF/Smoothed/${s}/${s}-${c}-fALFF.nii.gz

done

# REPEAT ALL FOR THE MEAN IMAGES

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Un-smoothed_Mean/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}_psc_Rtf_mean.nii.gz -Tstd ${analysis_path}/ALFF/Un-smoothed_Mean/${s}/${s}-${c}-meanfunc-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Un-smoothed_Mean/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean/${s}-${c}_psc_Wtf_mean.nii.gz -Tstd ${analysis_path}/fALFF/Un-smoothed_Mean/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-meanfunc-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Un-smoothed_Mean/${s}/${s}-${c}-meanfunc-ALFF -div ${analysis_path}/fALFF/Un-smoothed_Mean/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-meanfunc-SD.nii.gz ${analysis_path}/fALFF/Un-smoothed_Mean/${s}/${s}-${c}-meanfunc-fALFF.nii.gz

done

# REPEAT the smoothed image

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Smoothed_Mean/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path3}/Restricted_Smoothed/${s}/${s}-${c}-psc_Rtf_smoothed_mean.nii.gz -Tstd ${analysis_path}/ALFF/Smoothed_Mean/${s}/${s}-${c}-SM-meanfunc-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Smoothed_Mean/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path3}/Wide_Smoothed/${s}/${s}-${c}-psc_Wtf_smoothed_mean.nii.gz -Tstd ${analysis_path}/fALFF/Smoothed_Mean/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SM-meanfunc-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Smoothed_Mean/${s}/${s}-${c}-SM-meanfunc-ALFF -div ${analysis_path}/fALFF/Smoothed_Mean/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SM-meanfunc-SD.nii.gz ${analysis_path}/fALFF/Smoothed_Mean/${s}/${s}-${c}-meanfunc-fALFF.nii.gz

done



}

export -f ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'ALFF {1}' ::: ${s[@]}
