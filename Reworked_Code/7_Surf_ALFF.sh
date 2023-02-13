#!/bin/bash

# Following steps are completed using GNU parallel
surf_ALFF (){

#Set the path variables
data_path="$HOME/BrainStates"; s=$1
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
analysis_path="$HOME/BrainStates/Analysis/Analysis1_Mask2"
vol_path="$HOME/BrainStates/Volumetric"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

# Project "Whole_Brain" ALFF fsaverage space
mkdir -p ${surf_path}/Analysis/ALFF/Whole_Brain/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done
    
###########################################################################
# Project "Auditory Cortex" ALFF fsaverage space
mkdir -p ${surf_path}/Analysis/ALFF/Auditory_Cortex/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done
    
##########################################################################
# Project "Whole_Brain" fALFF fsaverage space
mkdir -p ${surf_path}/Analysis/fALFF/Whole_Brain/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done
    
##########################################################################
# Project "Auditory Cortex" fALFF fsaverage space
mkdir -p ${surf_path}/Analysis/fALFF/Auditory_Cortex/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done
    
############################################################################
# Project ALFF to the cortical surface and smoothe
mkdir -p ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
         # Smoothe the vol2surf projected image
      fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fs.mgz \
        --tval ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fsavg.mgz\
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

###############################################################################
# Project ALFF to the cortical surface and smoothe
mkdir -p ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-ALFF-AC.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
         # Smoothe the vol2surf projected image
      fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-SM-fs.mgz \
        --tval ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-SM-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-ALFF-AC-SM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

###############################################################################
# Project fALFF to the cortical surface and smoothe -Whole Brain
mkdir -p ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
         # Smoothe the vol2surf projected image
      fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fs.mgz \
        --tval ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fsavg.mgz\
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

###############################################################################
# Project fALFF to the cortical surface and smoothe - Auditory Cortex
mkdir -p ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-fALFF-AC.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
         # Smoothe the vol2surf projected image
      fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-SM-fs.mgz \
        --tval ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-SM-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/Smoothed/Auditory_Cortex/${s}/${s}-${c}-${h}-fALFF-AC-SM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
        
    done

}

export -f surf_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'surf_ALFF {1}' ::: ${s[@]}
