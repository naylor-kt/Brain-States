#!/bin/bash
ALFF () {

data_path="$HOME/Brain_States";s=$1
fs_path="$HOME/Brain_States/Freesurfer"

#Array of conditions
cond=(as ns vs)

#Array of hemispheres
hemi=(lh rh)

#For the temporally filtered images - CALCULATION OF ALFF

#Make directory to save the projected data for non_temporally filtered image
mkdir -p ${data_path}/Analysis/Non-Smoothed/ALFF/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${fs_path}/Registration/$s/Projected/Temporally_Filtered/001-01/${s}-${c}-${h}-tf-fsavg.mgz', 'STD', '${data_path}/Analysis/Non-Smoothed/ALFF/${s}/${s}-${c}-${h}-fsavg_ALFF.mgz')" -nojvm
        done
    done


# FOR THE CALCULATION OF fALFF

#Make directory to save the projected data for non_temporally filtered image (SD of the non-temporally filtered image)
mkdir -p ${data_path}/Analysis/Non-Smoothed/fALFF/${s}/0-025_Filtered_SD/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${fs_path}/Registration/$s/Projected/Temporally_Filtered/0-025/${s}-${c}-${h}-tf025-fsavg.mgz', 'STD', '${data_path}/Analysis/Non-Smoothed/fALFF/${s}/0-025_Filtered_SD/${s}-${c}-${h}-tf025-fsavg_SD.mgz')" -nojvm
        done
    done


# Divide the ALFF value by the standard deviation of the non-temporally filtered

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmaths('${data_path}/Analysis/Non-Smoothed/ALFF/${s}/${s}-${c}-${h}-fsavg_ALFF.mgz', 'div', ''${data_path}/Analysis/0-025_Filtered_SD/fALFF/${s}/Non_Filtered_SD/${s}-${c}-${h}-tf025-fsavg_SD.mgz', '${data_path}/Analysis/Non-Smoothed/fALFF/${s}/${s}-${c}-${h}-fsavg_fALFF.mgz')" -nojvm
        done
    done

# REPEAT EVERYTHING FOR THE SPATIALLY SMOOTHED VERSION OF THE DATA

#For the temporally filtered images - CALCULATION OF ALFF

#Make directory to save the projected data for non_temporally filtered image
mkdir -p ${data_path}/Analysis/Smoothed/ALFF/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_001-01/${s}-${c}-${h}-tfSM-fsavg.mgz', 'STD', '${data_path}/Analysis/Smoothed/ALFF/${s}/${s}-${c}-${h}-SM-fsavg_ALFF.mgz')" -nojvm
        done
    done


# FOR THE CALCULATION OF fALFF

#Make directory to save the projected data for non_temporally filtered image (SD of the non-temporally filtered image)
mkdir -p ${data_path}/Analysis/Smoothed/fALFF/${s}/0-025_Filtered_SD/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${fs_path}/Registration/$s/Projected/Spatially_Smoothed/Temporally_Filtered_0-025/${s}-${c}-${h}-tf025SM-fsavg.mgz', 'STD', '${data_path}/Analysis/Smoothed/fALFF/${s}/0-025_Filtered_SD/${s}-${c}-${h}-tf025SM-fsavg_SD.mgz')" -nojvm
        done
    done


# Divide the ALFF value by the standard deviation of the non-temporally filtered

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmaths('${data_path}/Analysis/Smoothed/ALFF/${s}/${s}-${c}-${h}-SM-fsavg_ALFF.mgz', 'div', '${data_path}/Analysis/Smoothed/fALFF/${s}/0-025_Filtered_SD/${s}-${c}-${h}-tf025SM-fsavg_SD.mgz', '${data_path}/Analysis/Smoothed/fALFF/${s}/${s}-${c}-${h}-SM-fsavg_fALFF.mgz')" -nojvm
        done
    done
}

export -f ALFF

#Array of subjects
s=($(ls $HOME/Brain_States/RawData))

echo ${s[@]}

parallel --jobs 0 'ALFF {1}' ::: ${s[@]}
