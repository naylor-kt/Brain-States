#!/bin/bash 

#  Temporal_Filtering.sh

# This will convert the raw signal into the percentage signal change
temp_filter (){

#Set the data_path to the relevant folder
data_path="$HOME/Brain_States";s=$1

# Make a new directory for the percent signal change data
mkdir -p ${data_path}/Percent_Signal_Change/Temporally_Filtered

# The conditions array
cond=(as ns vs)


#TEMPORAL FILTERING 0.01 to 0.1Hz 
    # Line --> sets the repetition time from the file header, using fslhd with grep
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, which is expressed as time as a multiple of the repetition time * 2
    # tlp -> temporal low pass, which is expressed as time as a multiple of the repetition time * 2 

mkdir -p ${data_path}/Percent_Signal_Change/Temporally_Filtered/001-01/${s}
for c in ${cond[@]}; do
    line=($(fslhd ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc.nii.gz -Tmean ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc-mean.nii.gz

    fslmaths ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc.nii.gz -bptf $thp $tlp  -add ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc-mean.nii.gz ${data_path}/Percent_Signal_Change/Temporally_Filtered/001-01/${s}/${s}-${c}-psc-tf.nii.gz
        
done

#TEMPORAL FILTERING 0 to 0.25 Hz 
    # Line --> sets the repetition time from the file header, using fslhd with grep
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, which is expressed as time as a multiple of the repetition time * 2
    # tlp -> temporal low pass, which is expressed as time as a multiple of the repetition time * 2 

mkdir -p ${data_path}/Percent_Signal_Change/Temporally_Filtered/0-025/${s}
for c in ${cond[@]}; do
    line=($(fslhd ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc.nii.gz | grep pixdim4)); tr=${line[1]}; tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc.nii.gz -bptf -1 $tlp  -add ${data_path}/Percent_Signal_Change/${s}/${s}-${c}-ntf-psc-mean.nii.gz ${data_path}/Percent_Signal_Change/Temporally_Filtered/0-025/${s}/${s}-${c}-psc-tf025.nii.gz
        
    imrm ${data_path}/Percent_Signal_Change/Non_Filtered/${s}/${s}-${c}-ntf-psc-mean.nii.gz
done

}

export -f temp_filter

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'temp_filter {1}' ::: ${s[@]}
