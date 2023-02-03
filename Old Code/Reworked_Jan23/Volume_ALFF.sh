#!/bin/bash

vol_ALFF () {

data_path="$HOME/BrainStates";s=$1
vol_path="$HOME/BrainStates/Volumetric"

cond=(as ns vs)


#Calculation of ALFF

mkdir -p ${vol_path}/Analysis/ALFF/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${vol_path}/Temporally_Filtered/Restricted/${s}/${s}-${c}-func2mni-psc-Rtf.nii.gz -Tstd ${vol_path}/Analysis/ALFF/${s}/${s}-${c}-ALFF
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${vol_path}/Analysis/fALFF/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${vol_path}/Temporally_Filtered/Wide/${s}/${s}-${c}-func2mni-psc-Wtf.nii.gz -Tstd ${vol_path}/Analysis/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-Wtf-SD.nii.gz
     
        
    fslmaths ${vol_path}/Analysis/ALFF/${s}/${s}-${c}-ALFF -div ${vol_path}/Analysis/fALFF/${s}/Wide_Filtered_SD/${s}-${c}-${h}-Wtf-SD.nii.gz ${vol_path}/Analysis/fALFF/${s}/${s}-${c}-fALFF.nii.gz

done

}

export -f vol_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'vol_ALFF {1}' ::: ${s[@]}
