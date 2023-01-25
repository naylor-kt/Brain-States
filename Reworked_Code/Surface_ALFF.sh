#!/bin/bash

surf_ALFF () {

data_path="$HOME/BrainStates_Test";s=$1
surf_path="$HOME/BrainStates_Test/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"

# FOR NON-SMOOTHED DATA
    
    #Calculation of ALFF

mkdir -p ${surf_path}/Analysis/Non-Smoothed/ALFF/${s}/

for c in ${cond[@]}; do

    for h in ${hemi[@]}; do
        
    matlab -batch "freesurfer_startup" -nojvm
        
    matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${surf_path}/Projected/${s}/Non_Smoothed/Restricted_Temp_Filter/${s}-${c}-${h}-Rtf-fsavg.mgz', 'STD', '${surf_path}/Analysis/Non-Smoothed/ALFF/${s}/${s}-${c}-${h}-fsavg_ALFF.mgz')" -nojvm
        done
    done

    # Calculation of fALFF
    
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
    mkdir -p ${surf_path}/Analysis/Non-Smoothed/fALFF/${s}/Wide_Filtered_SD/
    
    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${surf_path}/Projected/${s}/Non_Smoothed/Wide_Temp_Filter/${s}-${c}-${h}-Wtf-fsavg.mgz', 'STD', '${surf_path}/Analysis/Non-Smoothed/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-Wtf-fsavg_SD.mgz')" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmaths('${surf_path}/Analysis/Non-Smoothed/ALFF/${s}/${s}-${c}-${h}-fsavg_ALFF.mgz', 'div', '${surf_path}/Analysis/Non-Smoothed/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-nft-fsavg_SD.mgz', '${surf_path}/Analysis/Non-Smoothed/fALFF/${s}/${s}-${c}-${h}-fsavg_fALFF.mgz')" -nojvm
        done
    done

# FOR SMOOTHED DATA

mkdir -p ${surf_path}/Analysis/Smoothed/ALFF/${s}/

for c in ${cond[@]}; do

    for h in ${hemi[@]}; do
        
    matlab -batch "freesurfer_startup" -nojvm
        
    matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${surf_path}/Projected/${s}/Smoothed/Restricted_Temp_Filter/${s}-${c}-${h}-RtfSM-fsavg.mgz', 'STD', '${surf_path}/Analysis/Smoothed/ALFF/${s}/${s}-${c}-${h}-SM-fsavg_ALFF.mgz')" -nojvm
        done
    done

    # Calculation of fALFF
    
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
    mkdir -p ${surf_path}/Analysis/Smoothed/fALFF/${s}/Wide_Filtered_SD/
    
    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        
        matlab -batch "freesurfer_startup" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fs_ALFF('${surf_path}/Projected/${s}/Smoothed/Wide_Temp_Filter/${s}-${c}-${h}-WtfSM-fsavg.mgz', 'STD', '${surf_path}/Analysis/Smoothed/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-WtfSM-fsavg_SD.mgz')" -nojvm
        
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmaths('${surf_path}/Analysis/Smoothed/ALFF/${s}/${s}-${c}-${h}-SM-fsavg_ALFF.mgz', 'div', '${surf_path}/Analysis/Smoothed/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-WtfSM-fsavg_SD.mgz', '${surf_path}/Analysis/Smoothed/fALFF/${s}/${s}-${c}-${h}-SM-fsavg_fALFF.mgz')" -nojvm
        done
    done
}

export -f surf_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'volume_processing {1}' ::: ${s[@]}
