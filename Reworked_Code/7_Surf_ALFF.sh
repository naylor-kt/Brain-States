#!/bin/bash

# Following steps are completed using GNU parallel
surf_ALFF (){

#Set the path variables
data_path="$HOME/BrainStates_Test"; s=$1
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
analysis_path="$HOME/BrainStates_Test/Analysis"
vol_path="$HOME/BrainStates_Test/Volumetric"
surf_path="$HOME/BrainStates_Test/Surface"
fs_path="$HOME/BrainStates_Test/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

# Surface Regions
Sregion=(HG PT V1)

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


###########################################################################
# Project Specific ROIs ALFF fsaverage space
for r in ${Sregion[@]}; do
    mkdir -p ${surf_path}/Analysis/ALFF/${r}/${s}

    for c in ${cond[@]}; do
        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
    done
done
    
###############################################################################
# Project ALFF to the cortical surface and smoothe
for r in ${Sregion[@]}; do
    mkdir -p ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}

    for c in ${cond[@]}; do
        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
    # Smoothe the vol2surf projected image
        fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fs.mgz \
        --tval ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fs.mgz \
                   --o ${surf_path}/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
    done
done

##########################################################################
# Project "Specific ROIs" fALFF fsaverage space
for r in ${Sregion[@]}; do
    mkdir -p ${surf_path}/Analysis/fALFF/${r}/${s}

    for c in ${cond[@]}; do
        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
     
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
    done
done

###############################################################################
# Project fALFF to the cortical surface and smoothe -Specific ROIs
for r in ${Sregion[@]}; do
    mkdir -p ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}

    for c in ${cond[@]}; do

        for h in ${hemi[@]}; do
        mri_vol2surf --mov ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}.nii.gz \
             --hemi ${h} \
             --o ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fs.mgz \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/${s}-${c}_mean2fs.lta \
             --srcsubject ${s}
        done
        
         # Smoothe the vol2surf projected image
      fwhm=5
        for h in ${hemi[@]}; do
        mri_surf2surf --sval ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fs.mgz \
        --tval ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fs.mgz \
        --s ${s} \
        --hemi ${h} \
        --fwhm $fwhm \
        --cortex
        done
        
        for h in ${hemi[@]}; do
        mris_apply_reg --src ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fs.mgz \
                   --o ${surf_path}/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fsavg.mgz \
                   --streg $SUBJECTS_DIR/${s}/surf/${h}.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/${h}.sphere.reg
        done
    done
done

}

export -f surf_ALFF

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'surf_ALFF {1}' ::: ${s[@]}
