#!/bin/bash

data_path="$HOME/Brain_States"
fs_path="$HOME/Brain_States/Freesurfer"
subjn=11; #set this youserself depending on which subject you want to view


subj_ls=($(ls $HOME/Brain_States/RawData))

SUBJECTS_DIR="${fs_path}/Recon";


subj=${subj_ls[$(($subjn-1))]};

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











