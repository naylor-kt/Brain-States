#!/bin/bash

#Define the function
fmri_preproc2 () {
data_path="$HOME/BrainStates";s=$1

#Array of conditions
cond=(as ns vs)

# Make directories for the preprocessing files
    mkdir -p ${data_path}/Preproc/Level_1/$s
    mkdir -p $HOME/BrainStates/Preproc/Level_2/
    mkdir -p $HOME/BrainStates/Preproc/Level_2_Smoothed/
    
    preproc_path1="$HOME/BrainStates/Preproc/Level_1"
    preproc_path2="$HOME/BrainStates/Preproc/Level_2"
    preproc_path2S="$HOME/BrainStates/Preproc/Level_2_Smoothed"
    
    ############################################################################################################################################################
# LEVEL 2 OF THE PREPROCESSING

# Convert the signal into PERCENTAGE SIGNAL CHANGE
for c in ${cond[@]}; do
mkdir -p ${preproc_path2}/Percent_Signal_Change/${s}

# functional image - mean functional image = (func-mean)
fslmaths ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -sub ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# (func-mean)/mean =psc
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -div ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# psc * 100
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mul 100 ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# apply the brain mask to the psc image
fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mas ${preproc_path1}/$s/Level_1_Mean/bet/${s}-${c}_mean_func_bet_mask.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz
done

#Take a mean
for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -Tmean ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc-mean.nii.gz

done

# Perform the TEMPORAL FILTERING of the signal
# Two separate strands a) Filtering 0.01-0.1 Hz b) Filtering 0-0.25 Hz

    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2
    
# Restricted Refers to the fitlering at 0.01 to 0.1 Hz

mkdir -p ${preproc_path2}/Temporally_Filtered/Restricted/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz
        
done

# Take the MEAN of the functional restricted filtered image
    mkdir -p ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tmean ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}_psc_Rtf_mean.nii.gz

done

# Wide Refers to the filtering at 0 to 0.25 Hz

mkdir -p ${preproc_path2}/Temporally_Filtered/Wide/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=(-1); tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz
        
done

# Take the MEAN of the functional wide filtered image
    mkdir -p ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -Tmean ${preproc_path2}/Temporally_Filtered/Wide/${s}/Mean/${s}-${c}_psc_Wtf_mean.nii.gz

done

#######################################################################################################################################
# LEVEL 2S OF PREPROCESSING

# SPATIALLY SMOOTHE the function restricted filtered image
for c in ${cond[@]}; do
    mkdir -p ${preproc_path2S}/Smoothed/${s}

    # Spatial Smoothing
    # fwhm = 5  2.5 seemed insufficient
    fwhm=5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    susan ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz -1 $sigma 3 1 1 ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz -1 ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM

    fslmaths ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz -Tmin -bin  ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM-mask0 -odt char

    fslmaths ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz -mas ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM-mask0 ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz

    imrm ${preproc_path2S}/Smoothed/${s}/*usan_size.nii.gz
    imrm ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM-mask0
done

# Take the mean of the smoothed functional time series
mkdir -p ${preproc_path2S}/Smoothed/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz -Tmean ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean.nii.gz
    
    #Brain extract the image
    bet ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean.nii.gz ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean_bet -f 0.25 -m
done


# Convert the signal into PERCENTAGE SIGNAL CHANGE
    for c in ${cond[@]}; do
        mkdir -p ${preproc_path2S}/Percent_Signal_Change/${s}

        # functional image - mean functional image = (func-mean)
        fslmaths ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz -sub ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean.nii.gz ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz

        # (func-mean)/mean =psc
        fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -div ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean.nii.gz ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz

        # psc * 100
        fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -mul 100 ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz

        # apply the brain mask to the psc image
        fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -mas ${preproc_path2S}/Smoothed/${s}/Mean/${s}-${c}-SM-mean_bet.nii.gz ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz
    done

#Take a mean
for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -Tmean ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc-mean.nii.gz

done

# Perform the TEMPORAL FILTERING of the smoothed signal
# Two separate strands a) Filtering 0.01-0.1 Hz b) Filtering 0-0.25 Hz

    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2
    
# Restricted Refers to the fitlering at 0.01 to 0.1 Hz

mkdir -p ${preproc_path2S}/Temporally_Filtered/Restricted/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -bptf $thp $tlp ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/${s}-${c}-SM-psc-Rtf.nii.gz
done

# Take the MEAN of the functional restricted filtered image
    mkdir -p ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/${s}-${c}-SM-psc-Rtf.nii.gz -Tmean ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}-SM-psc-Rtf-mean.nii.gz
done

# Wide Refers to the filtering at 0 to 0.25 Hz

mkdir -p ${preproc_path2S}/Temporally_Filtered/Wide/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=(-1); tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz -bptf $thp $tlp ${preproc_path2S}/Temporally_Filtered/Wide/${s}/${s}-${c}-SM-psc-Wtf.nii.gz
        
done

# Take the MEAN of the functional wide filtered image
    mkdir -p ${preproc_path2S}/Temporally_Filtered/Wide/${s}/Mean

for c in ${cond[@]}; do
    #Take the mean of the functional image
    fslmaths ${preproc_path2S}/Temporally_Filtered/Wide/${s}/${s}-${c}-SM-psc-Wtf.nii.gz -Tmean ${preproc_path2S}/Temporally_Filtered/Wide/${s}/Mean/${s}-${c}-SM-psc-Wtf-mean.nii.gz

done

}

# Exports the function
export -f fmri_preproc2

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'fmri_preproc2 {1}' ::: ${s[@]}

