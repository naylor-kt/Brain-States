#!/bin/bash

MNI_ANALYSIS () {

data_path="$HOME/BrainStates_Test";s=$1

mkdir -p /Users/mszkcn/BrainStates_Test/Analysis/MNI_Space

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
analysis_path="/Users/mszkcn/BrainStates_Test/Analysis"
analysis_out="/Users/mszkcn/BrainStates_Test/Analysis/MNI_Space"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"
vol_path="$HOME/BrainStates/Volumetric"

cond=(as ns vs)
hemi=(lh rh)
neighbourhood=(7 19 27)
region=(AC HG PT MGB V1 Thal MGB)
region_2=(AC HG PT V1)

#Calculation of ALFF

mkdir -p ${analysis_out}/ALFF/Whole_Brain/${s}
mkdir -p ${analysis_out}/fALFF/Whole_Brain/${s}

for c in ${cond[@]}; do

    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${analysis_out}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-MNI.nii.gz
   
    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${analysis_out}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-MNI.nii.gz

    for n in ${neighbourhood[@]}; do
        mkdir -p ${analysis_out}/ReHo/ReHo_${n}/Whole_Brain/${s}
    
        applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                  --in=${reho_path}/ReHo_${n}/Whole_Brain/${s}/${s}-${c}-ReHo-${n}.nii.gz \
                  --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                  --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                  --interp=nn \
                  --out=${analysis_out}/ReHo/ReHo_${n}/Whole_Brain/${s}/${s}-${c}-ReHo-${n}-MNI.nii.gz
    done
done

for c in ${cond[@]}; do
    for r in ${region[@]}; do
        mkdir -p ${analysis_out}/ALFF/${r}/${s}
        mkdir -p ${analysis_out}/fALFF/${r}/${s}
        

        applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                  --in=${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}.nii.gz \
                  --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                  --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                  --interp=nn \
                  --out=${analysis_out}/ALFF/${r}/${s}/${s}-${c}-ALFF-MNI-${r}.nii.gz
   
        applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                   --in=${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}.nii.gz \
                   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                   --interp=nn \
                   --out=${analysis_out}/fALFF/${r}/${s}/${s}-${c}-fALFF-MNI-${r}.nii.gz

        for n in ${neighbourhood[@]}; do
            mkdir -p ${analysis_out}/ReHo/ReHo_${n}/${r}/${s}
        
            applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                      --in=${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-ReHo-${n}-${r}.nii.gz \
                      --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                      --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                      --interp=nn \
                      --out=${analysis_out}/ReHo/ReHo_${n}/${r}/${s}/${s}-${c}-ReHo-${n}-MNI-${r}.nii.gz
        done
    done
    
    for r in ${region_2[@]}; do
        mkdir -p ${analysis_out}/ALFF/Grey_Matter/${r}/${s}
        mkdir -p ${analysis_out}/fALFF/Grey_Matter/${r}/${s}

        applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                  --in=${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey.nii.gz \
                  --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                  --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                  --interp=nn \
                  --out=${analysis_out}/ALFF/Grey_Matter/${r}/${s}/${s}-${c}-ALFF-MNI-${r}-grey.nii.gz
   
        applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                   --in=${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey.nii.gz \
                   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                   --interp=nn \
                   --out=${analysis_out}/fALFF/Grey_Matter/${r}/${s}/${s}-${c}-fALFF-MNI-${r}-grey.nii.gz

        for n in ${neighbourhood[@]}; do
                mkdir -p ${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/${r}/${s}
        
            applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
                      --in=${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ReHo-${n}-${r}-grey.nii.gz \
                      --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
                      --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
                      --interp=nn \
                      --out=${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/${r}/${s}/${s}-${c}-ReHo-${n}-MNI-${r}-grey.nii.gz
        done
    done
done
}

export -f MNI_ANALYSIS

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'MNI_ANALYSIS {1}' ::: ${s[@]}


