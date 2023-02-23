#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates";s=$1

mkdir -p $HOME/BrainStates/Analysis/Smoothed

preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates/Analysis/Smoothed"
mask_path="$HOME/BrainStates/Mask"

cond=(as ns vs)
hemi=(lh rh)

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/${s}-${c}-SM-psc-Rtf.nii.gz -Tstd ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2S}/Temporally_Filtered/Wide/${s}/${s}-${c}-SM-psc-Wtf.nii.gz -Tstd ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-SM-Wtf-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -div ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-SM-Wtf-SD.nii.gz ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz

done


# Masked ALFF for the auditory cortex regions
mkdir -p ${analysis_path}/ALFF/Auditory_Cortex/${s}/
mkdir -p ${analysis_path}/ALFF/Heschls_Gyrus/${s}/
mkdir -p ${analysis_path}/ALFF/Planum_Temporale/${s}/
mkdir -p ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/
mkdir -p ${analysis_path}/ALFF/Visual_Cortex_1/${s}/

for c in ${cond[@]}; do

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-SM-ALFF-AC

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-SM-ALFF-HG

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-SM-ALFF-PT

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-SM-ALFF-MGB

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-SM-ALFF-V1
    
done

# Masked ALFF for the auditory cortex regions (lh or rh)

for h in ${hemi[@]}; do

    mkdir -p ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h} ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-SM-ALFF-AC-${h}

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h} ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-SM-ALFF-HG-${h}

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h} ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/${s}-${c}-SM-ALFF-PT-${h}
        
        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h} ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-SM-ALFF-MGB-${h}
        
        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h} ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-SM-ALFF-V1-${h}
        
        done

done

                              

# Masked fALFF for the auditory cortex regions
mkdir -p ${analysis_path}/fALFF/Auditory_Cortex/${s}/
mkdir -p ${analysis_path}/fALFF/Heschls_Gyrus/${s}/
mkdir -p ${analysis_path}/fALFF/Planum_Temporale/${s}/
mkdir -p ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/
mkdir -p ${analysis_path}/fALFF/Visual_Cortex_1/${s}/

for c in ${cond[@]}; do

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-SM-fALFF-AC

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-SM-fALFF-HG

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-SM-fALFF-PT

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-SM-fALFF-MGB

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-SM-fALFF-V1

done

# Masked fALFF for the auditory cortex regions (lh or rh)

for h in ${hemi[@]}; do

    mkdir -p ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/

        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h} ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-SM-fALFF-AC-${h}

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h} ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-SM-fALFF-HG-${h}

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h} ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/${s}-${c}-SM-fALFF-PT-${h}
        
        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h} ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-SM-fALFF-MGB-${h}
        
        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h} ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-SM-fALFF-V1-${h}

        done

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
