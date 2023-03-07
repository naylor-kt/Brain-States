#!/bin/bash

mean_TS () {

data_path="$HOME/BrainStates_Test";s=$1
mask_path="$HOME/BrainStates_Test/Mask"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"

mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Whole_Brain/${s}
mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/Whole_Brain/${s}

MTS_path="$HOME/BrainStates_Test/Mean_Time_Series"

cond=(as ns vs)

# To get the mean time series for the entire brain for the restricted and wide temporally filtered functional time series
for c in ${cond[@]}; do
fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
          -o ${MTS_path}/Unsmoothed/Restricted/Whole_Brain/${s}/${s}-${c}-psc-Rtf-MTS.txt 
        
fslmeants -i ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
          -o ${MTS_path}/Unsmoothed/Wide/Whole_Brain/${s}/${s}-${c}-psc-Wtf-MTS.txt
done

# Get the mean time series for the different brain regions for the restricted and wide temporally filtered functional time series
region=(AC HG PT MGB V1 Thal)
hemi=(lh rh)

for r in ${region[@]}; do

mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/${r}/${s}
mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/${r}/${s}

    for c in ${cond[@]}; do
    fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Restricted/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}.txt \
              -m ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin.nii.gz

    fslmeants -i ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Wide/${r}/${s}/${s}-${c}-psc-Wtf-MTS-${r}.txt \
              -m ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin.nii.gz
        
        for h in ${hemi[@]}; do
            mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/${r}/${h}/${s}
            mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/${r}/${h}/${s}
        
        
            fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Restricted/${r}/${h}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-${h}.txt \
              -m ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_${r}mask2func-bin-${h}.nii.gz

            fslmeants -i ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Wide/${r}/${h}/${s}/${s}-${c}-psc-Wtf-MTS-${r}-${h}.txt \
              -m ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_${r}mask2func-bin-${h}.nii.gz
    
        done
    done
done

## Get the mean time series for the ROIs but specifically in the grey matter

region=(AC HG PT MGB V1)
for r in ${region[@]}; do

    mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${s}
    mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/Grey_Matter_ROIs/${r}/${s}

    for c in ${cond[@]}; do
    fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-grey.txt \
              -m ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz

    fslmeants -i ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Wide/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-psc-Wtf-MTS-${r}-grey.txt \
              -m ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz
        
        for h in ${hemi[@]}; do
            mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${h}/${s}
            mkdir -p $HOME/BrainStates_Test/Mean_Time_Series/Unsmoothed/Wide/Grey_Matter_ROIs/${r}/${h}/${s}
        
        
            fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Restricted/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-psc-Rtf-MTS-${r}-grey-${h}.txt \
              -m ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-${r}-grey_funcmask-${h}.nii.gz

            fslmeants -i ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
              -o ${MTS_path}/Unsmoothed/Wide/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-psc-Wtf-MTS-${r}-grey-${h}.txt \
              -m ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-${r}-grey_funcmask-${h}.nii.gz
    
        done
    done
done



}

export -f mean_TS

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'mean_TS {1}' ::: ${s[@]}
