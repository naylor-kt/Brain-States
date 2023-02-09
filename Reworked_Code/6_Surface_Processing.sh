#!/bin/bash

# Step TWO of surface processing is to create the lta fields which will enable the projection of the individual functional timer series to the cortical surface

#Set the path variables
data_path="$HOME/BrainStates"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

# Subjects Array
subj=($(ls $HOME/BrainStates/RawData))

#Condition Array
cond=(as ns vs)

for s in ${subj[@]}; do
mkdir -p ${fs_path}/Registration/${s}

    for c in ${cond[@]}; do
#Make for loop for condition instead, just to be sure of preprocessing problem

        # obtain registration from t1 (fsl) to orig (fs) & concatenate with mean2t1;

        tkregister2 --mov ${fs_path}/Struct/$s/${s}_T1.nii.gz --targ $SUBJECTS_DIR/${s}/mri/orig.mgz --s ${s} \
        --reg ${fs_path}/Registration/${s}/${s}_fsl2fs.dat --ltaout ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --noedit --regheader

        lta_convert --inlta ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --outfsl ${fs_path}/Registration/${s}/${s}_fsl2fs.mat

        convert_xfm -omat ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat -concat ${fs_path}/Registration/${s}/${s}_fsl2fs.mat ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat

        lta_convert --infsl ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat --outreg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.dat --outlta ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
        --subject ${s} --src ${preproc_path1}/$s/Level_1_Mean/${s}-${c}_mean_func.nii.gz --trg $SUBJECTS_DIR/$subj/mri/orig.mgz
               
   
    done
done


# Following steps are completed using GNU parallel
surf_processing_2 (){

#Set the path variables
data_path="$HOME/BrainStates"; s=$1
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

# Project the functional time series without smoothing to fsaverage space


mkdir -p ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fs.mgz \
                   --o ${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-Rtf-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done


mkdir -p ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fs.mgz \
                   --o ${surf_path}/Projected/Non_Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-Wtf-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

# Additionally project the functional time series to fsaverage space, and to smoothe the image during this process

# Restricted functional time series
mkdir -p ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
# Smoothe the vol2surf projected image
  fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-${c}-${h}-RtfSM-fs.mgz \
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


# Wide Fitered Functional Time Series 
mkdir -p ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done

# Smoothe the vol2surf projected image
  fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Projected/Smoothed/Wide_Temp_Filter/${s}/${s}-${c}-${h}-WtfSM-fs.mgz \
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
