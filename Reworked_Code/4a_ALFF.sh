#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

mkdir -p $HOME/BrainStates/Analysis/Analysis1_Mask2

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
analysis_path="$HOME/BrainStates_Test/Analysis/"
mask_path="$HOME/BrainStates_Test/Mask"

cond=(as ns vs)
hemi=(lh rh)

#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tstd ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF
   
   fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -m > ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-meanALFF.txt
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -Tstd ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -div ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz

   fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -m > ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-meanfALFF.txt
done


# Masked ALFF for the auditory cortex regions
mkdir -p ${analysis_path}/ALFF/Auditory_Cortex/${s}/
mkdir -p ${analysis_path}/ALFF/Heschls_Gyrus/${s}/
mkdir -p ${analysis_path}/ALFF/Planum_Temporale/${s}/
mkdir -p ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/
mkdir -p ${analysis_path}/ALFF/Visual_Cortex_1/${s}/

for c in ${cond[@]}; do

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC

fslstats ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC -m > ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-meanALFF-AC.txt

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG

fslstats ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-ALFF-HG -m > ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-meanALFF-HG.txt

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT

fslstats ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-ALFF-PT -m > ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-meanALFF-PT.txt

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-ALFF-MGB

fslstats ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-ALFF-MGB -m > ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-meanALFF-MGB.txt

fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-ALFF-V1

fslstats ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-ALFF-V1 -m > ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-meanALFF-V1.txt
done

# Masked ALFF for the auditory cortex regions (lh or rh)

for h in ${hemi[@]}; do

    mkdir -p ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/
    mkdir -p ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h} ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-ALFF-AC-${h}
        
        fslstats ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-ALFF-AC-${h} -m > ${analysis_path}/ALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-meanALFF-AC-${h}.txt

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h} ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-ALFF-HG-${h}
        
        fslstats ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-ALFF-HG-${h} -m > ${analysis_path}/ALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-meanALFF-HG-${h}.txt

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h} ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/${s}-${c}-ALFF-PT-${h}
        
        fslstats ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/${s}-${c}-ALFF-PT-${h} -m > ${analysis_path}/ALFF/Planum_Temporale/${h}/${s}/${s}-${c}-meanALFF-PT-${h}.txt
        
        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h} ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-ALFF-MGB-${h}
        
        fslstats ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-ALFF-MGB-${h} -m > ${analysis_path}/ALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-meanALFF-MGB-${h}.txt
        
        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h} ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-ALFF-V1-${h}
        
        fslstats ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-ALFF-V1-${h} -m > ${analysis_path}/ALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-meanALFF-V1-${h}.txt
        
        done

done

                              

# Masked fALFF for the auditory cortex regions
mkdir -p ${analysis_path}/fALFF/Auditory_Cortex/${s}/
mkdir -p ${analysis_path}/fALFF/Heschls_Gyrus/${s}/
mkdir -p ${analysis_path}/fALFF/Planum_Temporale/${s}/
mkdir -p ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/
mkdir -p ${analysis_path}/fALFF/Visual_Cortex_1/${s}/

for c in ${cond[@]}; do

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC

fslstats ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC -m > ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-meanfALFF-AC.txt

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-fALFF-HG

fslstats ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-fALFF-HG -m > ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-meanfALFF-HG.txt

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-fALFF-PT

fslstats ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-fALFF-PT -m > ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-meanfALFF-PT.txt

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_MGBmask2func ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-fALFF-MGB

fslstats ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-fALFF-MGB -m > ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-meanfALFF-MGB.txt

fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${s}/${s}-${c}_V1mask2func ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-fALFF-V1

fslstats ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-fALFF-V1 -m > ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-meanfALFF-V1.txt

done

# Masked fALFF for the auditory cortex regions (lh or rh)

for h in ${hemi[@]}; do

    mkdir -p ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/
    mkdir -p ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/

        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h} ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-fALFF-AC-${h}
        
        fslstats ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-fALFF-AC-${h} -m > ${analysis_path}/fALFF/Auditory_Cortex/${h}/${s}/${s}-${c}-meanfALFF-AC-${h}.txt

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h} ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-fALFF-HG-${h}
        
        fslstats ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-fALFF-HG-${h} -m > ${analysis_path}/fALFF/Heschls_Gyrus/${h}/${s}/${s}-${c}-meanfALFF-HG-${h}.txt

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h} ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/${s}-${c}-fALFF-PT-${h}
        
        fslstats ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/${s}-${c}-fALFF-PT-${h} -m > ${analysis_path}/fALFF/Planum_Temporale/${h}/${s}/${s}-${c}-meanfALFF-PT-${h}.txt
        
        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h} ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-fALFF-MGB-${h}
        
        fslstats ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-fALFF-MGB-${h} -m > ${analysis_path}/fALFF/Medial_Geniculate_Body/${h}/${s}/${s}-${c}-meanfALFF-MGB-${h}.txt
        
        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h} ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-fALFF-V1-${h}
        
        fslstats ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-fALFF-V1-${h} -m > ${analysis_path}/fALFF/Visual_Cortex_1/${h}/${s}/${s}-${c}-meanfALFF-V1-${h}.txt

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


