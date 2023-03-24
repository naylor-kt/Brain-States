#!/bin/bash

mean_TS () {

data_path="$HOME/BrainStates_Test";s=$1

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series
MTS_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS
alt_ALFF="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS"

cond=(as ns vs)

# To get the mean time series for the entire brain for the restricted and wide temporally filtered functional time series
for c in ${cond[@]}; do
mkdir -p ${MTS_path}/Whole_Brain/${s}

fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
          -o ${MTS_path}/Whole_Brain/${s}/${s}-${c}-MTS.txt
done

# Get the mean time series for the different brain regions for the restricted and wide temporally filtered functional time series

hemi=(lh rh)
for r in `cat ${mask_path}/Region_List.txt`; do

    mkdir -p ${MTS_path}/${r}/${s}

    for c in ${cond[@]}; do
    fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
              -m ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin.nii.gz \
              -o ${MTS_path}/${r}/${s}/${s}-${c}-${r}-MTS.txt
              
        
        for h in ${hemi[@]}; do
               fslmeants -i ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                         -m ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin-${h}.nii.gz \
                         -o ${MTS_path}/${r}/${s}/${s}-${c}-${r}-${h}-MTS.txt
        done
    done
done

}

export -f mean_TS

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))


# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'mean_TS {1}' ::: ${s[@]}


### Calculate ALFF of the Mean Time Series

subj=($(ls $HOME/BrainStates_Test/RawData))
cond=(as ns vs)
hemi=(lh rh)

for s in ${subj[@]}; do
    for c in ${cond[@]};do
        for r in `cat ${mask_path}/Region_List.txt`; do
        mkdir -p ${alt_ALFF}/${r}/${s}
        
        matlab -batch "startup_gen" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series/${r}/${s}/${s}-${c}-${r}-MTS.txt', 'ALFF', '/Users/msxkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS/${s}-${c}-${r}-MTS-ALFF.txt')" -nojvm
        
            for h in ${hemi[@]}; do
            
            matlab -batch "startup_gen" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); MTS_ALFF('/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/Mean_Time_Series/${r}/${s}/${s}-${c}-${r}-${h}-MTS.txt', 'ALFF', '/Users/msxkcn/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS/${s}-${c}-${r}-${h}-MTS-ALFF.txt')" -nojvm
            done
        done
    done
done

