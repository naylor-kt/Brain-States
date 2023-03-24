#!/bin/bash

data_path="$HOME/BrainStates_Test"
fs_path="$HOME/BrainStates_Test/Surface/Freesurfer"
subj=(sub-06)

SUBJECTS_DIR="${fs_path}/Recon";

freeview -v \
$SUBJECTS_DIR/$subj/mri/T1.mgz \
$SUBJECTS_DIR/$subj/mri/wm.mgz \
$SUBJECTS_DIR/$subj/mri/brainmask.mgz \
$SUBJECTS_DIR/$subj/mri/aseg.mgz:colormap=lut:opacity=0.2 \
-f \
$SUBJECTS_DIR/$subj/surf/lh.white:edgecolor=blue \
$SUBJECTS_DIR/$subj/surf/lh.pial:edgecolor=red \
$SUBJECTS_DIR/$subj/surf/rh.white:edgecolor=blue \
$SUBJECTS_DIR/$subj/surf/rh.pial:edgecolor=red

exit 0











