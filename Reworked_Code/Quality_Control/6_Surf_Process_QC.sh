#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Mask"
analysis_path="$HOME/BrainStates_Test/Analysis"
surf_path="$HOME/BrainStates_Test/Surface"
fs_path="$HOME/BrainStates_Test/Surface/Freesurfer"
export SUBJECTS_DIR="${fs_path}/Recon"

s=(sub-01)


# Check the projection of the functional timeseries to the subject specific cortical surface UNSMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-as-lh-Rtf-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-as-rh-Rtf-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-lh-Rtf-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-rh-Rtf-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-lh-Rtf-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-rh-Rtf-fs.mgz

# Check the projection of the functional timeseries to the fsaverage surface UNSMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-as-lh-Rtf-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-as-rh-Rtf-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-lh-Rtf-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-rh-Rtf-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-lh-Rtf-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Non_Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-rh-Rtf-fsavg.mgz


# Check the projection of the functional timeseries to the subject specific cortical surface SMOOTHED

freeview -f \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-as-lh-RtfSM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-as-rh-RtfSM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-lh-RtfSM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-rh-RtfSM-fs.mgz \
${fs_path}/Recon/${s}/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-lh-RtfSM-fs.mgz \
${fs_path}/Recon/${s}/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-rh-RtfSM-fs.mgz

# Check the projection of the functional timeseries to the fsaverage surface SMOOTHED

freeview -f \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-as-lh-RtfSM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-as-rh-RtfSM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-lh-RtfSM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-ns-rh-RtfSM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/lh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-lh-RtfSM-fsavg.mgz \
${fs_path}/Recon/fsaverage/surf/rh.smoothwm:overlay=${surf_path}/Projected/Smoothed/Restricted_Temp_Filter/${s}/${s}-vs-rh-RtfSM-fsavg.mgz

