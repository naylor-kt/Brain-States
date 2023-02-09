#!/bin/bash

data_path="$HOME/BrainStates"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"
mask_path="$HOME/BrainStates/Mask"
analysis_path="$HOME/BrainStates/Analysis"
surf_path="$HOME/BrainStates/Surface"
fs_path="$HOME/BrainStates/Surface/Freesurfer"
ALFF_path="$HOME/BrainStates/Surface/Analysis/ALFF"
fALFF_path="$HOME/BrainStates/Surface/Analysis/fALFF"
export SUBJECTS_DIR="${fs_path}/Recon"

s=(sub-01)


# Check the projection of ALFF to the subject specific cortical surface Whole Brain UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-as-lh-ALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-as-rh-ALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-ns-lh-ALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-ns-rh-ALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-vs-lh-ALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-vs-rh-ALFF-fs.mgz

# Check the projection of ALFF to the fsaverage surface Whole Brain UNSMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-as-lh-ALFF-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-as-rh-ALFF-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-ns-lh-ALFF-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-ns-rh-ALFF-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-vs-lh-ALFF-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Whole_Brain/${s}/${s}-vs-rh-ALFF-fsavg.mgz

# Check the projection of ALFF to the subject specific cortical surface Whole Brain SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-lh-ALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-rh-ALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-lh-ALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-rh-ALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-lh-ALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-rh-ALFF-SM-fs.mgz

# Check the projection of ALFF to the fsaverage surface Whole Brain SMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-lh-ALFF-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-rh-ALFF-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-lh-ALFF-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-rh-ALFF-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-lh-ALFF-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-rh-ALFF-SM-fsavg.mgz


# Check the projection of fALFF to the subject specific cortical surface Whole Brain UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-as-lh-fALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-as-rh-fALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-ns-lh-fALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-ns-rh-fALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-vs-lh-fALFF-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-vs-rh-fALFF-fs.mgz

# Check the projection of fALFF to fsaverage Whole Brain UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-as-lh-fALFF-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-as-rh-fALFF-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-ns-lh-fALFF-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-ns-rh-fALFF-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-vs-lh-fALFF-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Whole_Brain/${s}/${s}-vs-rh-fALFF-fsavg.mgz


# Check the projection of fALFF to the subject specific cortical surface Whole Brain SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-lh-fALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-rh-fALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-lh-fALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-rh-fALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-lh-fALFF-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-rh-fALFF-SM-fs.mgz

# Check the projection of fALFF to fsaverage Whole Brain SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-lh-fALFF-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-as-rh-fALFF-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-lh-fALFF-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-ns-rh-fALFF-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-lh-fALFF-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Whole_Brain/${s}/${s}-vs-rh-fALFF-SM-fsavg.mgz

########################################################################################################################

# Check the projection of ALFF to the subject specific cortical surface Auditory Cortex UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-as-lh-ALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-as-rh-ALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-ns-lh-ALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-ns-rh-ALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-vs-lh-ALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-vs-rh-ALFF-AC-fs.mgz

# Check the projection of ALFF to the fsaverage surface Auditory Cortex UNSMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-as-lh-ALFF-AC-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-as-rh-ALFF-AC-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-ns-lh-ALFF-AC-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-ns-rh-ALFF-AC-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-vs-lh-ALFF-AC-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Auditory_Cortex/${s}/${s}-vs-rh-ALFF-AC-fsavg.mgz

# Check the projection of ALFF to the subject specific cortical surface Auditory COrtex SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-lh-ALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-rh-ALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-lh-ALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-rh-ALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-lh-ALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-rh-ALFF-AC-SM-fs.mgz

# Check the projection of ALFF to the fsaverage surface Auditory Cortex SMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-lh-ALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-rh-ALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-lh-ALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-rh-ALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-lh-ALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${ALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-rh-ALFF-AC-SM-fsavg.mgz


# Check the projection of fALFF to the subject specific cortical surface Auditory Cortex UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-as-lh-fALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-as-rh-fALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-ns-lh-fALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-ns-rh-fALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-vs-lh-fALFF-AC-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-vs-rh-fALFF-AC-fs.mgz

# Check the projection of fALFF to fsaverage Auditory Cortex UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-as-lh-fALFF-AC-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-as-rh-fALFF-AC-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-ns-lh-fALFF-AC-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-ns-rh-fALFF-AC-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-vs-lh-fALFF-AC-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Auditory_Cortex/${s}/${s}-vs-rh-fALFF-AC-fsavg.mgz


# Check the projection of fALFF to the subject specific cortical surface Auditory Cortex SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-lh-fALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-rh-fALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-lh-fALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-rh-fALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-lh-fALFF-AC-SM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-rh-fALFF-AC-SM-fs.mgz

# Check the projection of fALFF to fsaverage Auditory Cortex SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-lh-fALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-as-rh-fALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-lh-fALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-ns-rh-fALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-lh-fALFF-AC-SM-fsavg.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${fALFF_path}/Smoothed/Auditory_Cortex/${s}/${s}-vs-rh-fALFF-AC-SM-fsavg.mgz

