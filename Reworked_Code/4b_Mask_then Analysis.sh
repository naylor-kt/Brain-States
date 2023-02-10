#!/bin/bash

masked_ALFF () {

data_path="$HOME/BrainStates";s=$1

mkdir -p $HOME/BrainStates/Mask1_Analysis2/

preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
analysis_path="$HOME/BrainStates/Mask1_Analysis2"
masked_path="$HOME/BrainStates/Mask/Masked_Time_Series"

cond=(as ns vs)
hemi=(lh rh)

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Auditory_Cortex/${s}/
mkdir -p ${analysis_path}/ALFF/Heschls_Gyrus/${s}/
mkdir -p ${analysis_path}/ALFF/Planum_Temporale/${s}/

for h in ${hemi[@]}; do
mkdir -p ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}
done

for c in ${cond[@]}; do
        
   # For the auditory cortex
   fslmaths ${masked_path}/Auditory_Cortex/${s}/${s}-${c}-psc-Rtf-AC.nii.gz -Tstd ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC

    # For Heschels Gyrus
    fslmaths ${masked_path}/Heschls_Gyrus/${s}/${s}-${c}-psc-Rtf-HG.nii.gz -Tstd ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG
    
    # For the Planum_Temporale
    fslmaths ${masked_path}/Planum_Temporale/${s}/${s}-${c}-psc-Rtf-PT.nii.gz -Tstd ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT
    
    # For the Medial Geniculate Body 
    for h in ${hemi[@]}; do 
    fslmaths ${masked_path}/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-psc-Rtf-MGB-${h}.nii.gz -Tstd ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-ALFF-MGB-${h}
    done
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)

mkdir -p ${analysis_path}/fALFF/Auditory_Cortex/${s}/Wide_Filtered_SD/
mkdir -p ${analysis_path}/fALFF/Heschls_Gyrus/${s}/Wide_Filtered_SD/
mkdir -p ${analysis_path}/fALFF/Planum_Temporale/${s}/Wide_Filtered_SD/

for h in ${hemi[@]}; do
mkdir -p ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/Wide_Filtered_SD/
done

for c in ${cond[@]}; do

   # Auditory Cortex
    fslmaths ${masked_path}/Auditory_Cortex/${s}/${s}-${c}-psc-Wtf-AC.nii.gz -Tstd ${analysis_path}/fALFF/Auditory_Cortex/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-AC-SD.nii.gz
    
    fslmaths ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC -div ${analysis_path}/fALFF/Auditory_Cortex/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-AC-SD.nii.gz ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC

    # Heschls gyrus
    
    fslmaths ${masked_path}/Heschls_Gyrus/${s}/${s}-${c}-psc-Wtf-HG.nii.gz -Tstd ${analysis_path}/fALFF/Heschls_Gyrus/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-HG-SD.nii.gz
    
    fslmaths ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG -div ${analysis_path}/fALFF/Heschls_Gyrus/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-HG-SD.nii.gz ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-fALFF-HG
    
    # Planum Temporale
    fslmaths ${masked_path}/Planum_Temporale/${s}/${s}-${c}-psc-Wtf-PT.nii.gz -Tstd ${analysis_path}/fALFF/Planum_Temporale/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-PT-SD.nii.gz
    
    fslmaths ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT -div ${analysis_path}/fALFF/Planum_Temporale/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-PT-SD.nii.gz ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-fALFF-PT

    # Medial Geniculate Body 
    for h in ${hemi[@]}; do 
    fslmaths ${masked_path}/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-psc-Wtf-MGB-${h}.nii.gz -Tstd ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-MGB-${h}-SD.nii.gz
    
    fslmaths ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-ALFF-MGB-${h} -div ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-MGB-${h}-SD.nii.gz ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-fALFF-MGB-${h}
    done


done

}

export -f masked_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'masked_ALFF {1}' ::: ${s[@]}
