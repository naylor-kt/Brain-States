#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF

ALFF_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF"

cond=(as ns vs)
hemi=(lh rh)
#Calculation of ALFF

mkdir -p ${ALFF_path}/Whole_Brain/${s}

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tstd ${ALFF_path}/Whole_Brain/${s}/${s}-${c}-ALFF
   
   fslstats ${ALFF_path}/Whole_Brain/${s}/${s}-${c}-ALFF -M > ${ALFF_path}/Whole_Brain/${s}/${s}-${c}-meanALFF.txt
   
done


for r in `cat ${mask_path}/Region_List.txt`; do

    mkdir -p ${ALFF_path}/${r}/${s}
   
    for c in ${cond[@]}; do

    fslmaths ${ALFF_path}/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin.nii.gz ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-ALFF

    fslstats ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-ALFF -M > ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-meanALFF.txt
    
    
        for h in ${hemi[@]}; do
            fslmaths ${ALFF_path}/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin-${h}.nii.gz ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-${h}-ALFF

                fslstats ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-${h}-ALFF -M > ${ALFF_path}/${r}/${s}/${s}-${c}-${r}-${h}-meanALFF.txt
        done
    done
done


}

export -f ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))


# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'ALFF {1}' ::: ${s[@]}
