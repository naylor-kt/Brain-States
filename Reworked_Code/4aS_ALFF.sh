#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

mkdir -p $HOME/BrainStates/Analysis/Smoothed

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates_Test/Analysis/Smoothed"
mask_path="$HOME/BrainStates_Test/Mask"

cond=(as ns vs)
hemi=(lh rh)
region=(AC HG PT MGB V1 Thal)


#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/${s}-${c}-SM-psc-Rtf.nii.gz -Tstd ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF
   
   fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -M > ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-meanALFF.txt
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2S}/Temporally_Filtered/Wide/${s}/${s}-${c}-SM-psc-Wtf.nii.gz -Tstd ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-SM-Wtf-SD.nii.gz
        
    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -div ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-SM-Wtf-SD.nii.gz ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz
    
    fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF -M > ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-meanfALFF.txt

done


# Masked ALFF for the auditory cortex regions


for r in ${region[@]}; do
    mkdir -p ${analysis_path}/ALFF/${r}/${s}/

    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_${r}mask2func ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-SM-ALFF-${r}

    fslstats ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-SM-ALFF-${r} -M > ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-SM-meanALFF-${r}.txt
    done
done

# Masked ALFF for the auditory cortex regions (lh or rh)
for r in ${region[@]};do

    for h in ${hemi[@]}; do
    mkdir -p ${analysis_path}/ALFF/${r}/${h}/${s}/
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-SM-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${r}mask2func-${h} ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-SM-ALFF-${r}-${h}
        
        fslstats ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-SM-ALFF-${r}-${h} -M > ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-SM-meanALFF-${r}-${h}.txt
    
        done
    done
done

                              

# Masked fALFF for the auditory cortex regions
for r in ${region[@]};do

    mkdir -p ${analysis_path}/fALFF/${r}/${s}/

    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_${r}mask2func ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-SM-fALFF-${r}
    
    fslstats ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-SM-fALFF-${r} -M > ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-SM-meanfALFF-${r}.txt
    
    done
done

# Masked fALFF for the auditory cortex regions (lh or rh)

for r in ${region[@]}; do
    for h in ${hemi[@]}; do

    mkdir -p ${analysis_path}/fALFF/${r}/${h}/${s}/

        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-SM-fALFF.nii.gz -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${r}mask2func-${h} ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-SM-fALFF-${r}-${h}
        
        fslstats ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-SM-fALFF-${r}-${h} -M > ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-SM-meanfALFF-${r}-${h}.txt

        done
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
