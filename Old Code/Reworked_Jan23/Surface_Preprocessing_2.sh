#!/bin/bash

# Step TWO of surface processing is to create the lta fields which will enable the projection of the individual functional timer series to the cortical surface

# Make a new directory for the freesurfer files
mkdir -p $HOME/Brain_States/Surface/Freesurfer

#Set the path variables
data_path="$HOME/BrainStates"
vol_path="$HOME/BrainStates/Volumetric"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

# Subjects Array
subj=($(ls $HOME/BrainStates_Test/RawData))

#Condition Array
cond=(as ns vs)

for s in ${subj[@]}; do
mkdir -p ${fs_path}/Registration/${s}

    for c in ${cond[@]}; do
#Make for loop for condition instead, just to be sure of preprocessing problem
    
        if [ ! -f $pth/reg/${s}-${c}_mean2fs.lta ]; then

        # obtain registration from t1 (fsl) to orig (fs) & concatenate with mean2t1;

        tkregister2 --mov ${fs_path}/Struct/$s/${s}_T1.nii.gz --targ $SUBJECTS_DIR/${s}/mri/orig.mgz --s ${s} \
        --reg ${fs_path}/Registration/${s}/${s}_fsl2fs.dat --ltaout ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --noedit --regheader

        lta_convert --inlta ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --outfsl ${fs_path}/Registration/${s}/${s}_fsl2fs.mat

        convert_xfm -omat ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat -concat ${fs_path}/Registration/${s}/${s}_fsl2fs.mat ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat

        lta_convert --infsl ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat --outreg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.dat --outlta ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
        --subject ${s} --src ${data_path}/Preproc/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz --trg $SUBJECTS_DIR/$subj/mri/orig.mgz
        fi
    done
done


# Following steps are completed using GNU parallel

surf_processing_2 (){

#Set the path variables
data_path="$HOME/BrainStates"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer";s=$1
export SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

#STEP 3 of surface processing is to convert the functional time series to percentage signal change

for c in ${cond[@]}; do
mkdir -p ${surf_path}/Percent_Signal_Change/${s}

#Take the mean of the non-filtered functional image
fslmaths ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz -Tmean ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean.nii.gz

#Create a brain mask from the mean functional image
bet ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean.nii.gz ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean-bet.nii.gz -m

# functional image - mean functional image = (func-mean)
fslmaths ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz -sub ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean.nii.gz ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# (func-mean)/mean =psc
fslmaths ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -div ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean.nii.gz ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# psc * 100
fslmaths ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mul 100 ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# apply the brain mask to the psc image
fslmaths ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -mas ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean-bet_mask.nii.gz ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz

# The notation used above nft = non-temporally filtered and psc = percentage signal change
imrm  ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean-bet_mask.nii.gz ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-mean-bet.nii.gz
  
done


# Step 4 of surface processing is to TEMPORALLY FILTER
    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2
    
# Restricted Refers to the fitlering at 0.01 to 0.1 Hz

mkdir -p ${surf_path}/Temporally_Filtered/Restricted/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${surf_path}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz
        
done

# Wide Refers to the filtering at 0 to 0.25 Hz

mkdir -p ${surf_path}/Temporally_Filtered/Wide/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=(-1); tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${surf_path}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -bptf $thp $tlp ${surf_path}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz
        
done


# Step 5A is to project the functional time series to fsaverage space - without any smoothing of the functional time series


mkdir -p ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${surf_path}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fsavg.mgz \
                   --o ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done


mkdir -p ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${surf_path}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fsavg.mgz \
                   --o ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

# Step 5B is to project the functional time series to fsaverage space, and to smoothe the image during this process

mkdir -p ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${surf_path}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
# Smoothe the vol2surf projected image
  fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fsavg.mgz \
        --tval ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fsavg.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fsavg.mgz \
                   --o ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done


mkdir -p ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${surf_path}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fsavg.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
# Smoothe the vol2surf projected image
  fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fsavg.mgz \
        --tval ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fsavg.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fsavg.mgz \
                   --o ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done
}

export -f surf_processing_2

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'surf_processing_2 {1}' ::: ${s[@]}
