#!/bin/sh

projection (){

#Set the regular data_path, as has been used in the preprocessing script
data_path="$HOME/Brain_States"

#Set the freesurfer path (just to simplfy the later code)
fs_path="$HOME/Brain_States/Freesurfer";s=$1

#Provide the location of SUBJECTS_DIR
SUBJECTS_DIR="${fs_path}/Recon"

#Condition Array
cond=(as ns vs)

#Hemisphere Array
hemi=(lh rh)

#Make directory to save the projected data
mkdir -p ${data_path}/Freesurfer/Registration/$s/Projected

for c in ${cond[@]}; do

    for h in ${hemi[@]}; do

    mri_vol2surf --src ${data_path}/Registration/$s/Temp_Filt/${s}-${c}-func2mni_Smoothed_TempFilt.nii.gz \
             --o ${fs_path}/Registration/$s/Projected/$s-$c-$h.fsavg.mgz \
             --hemi $h \
             --projfrac-avg 0 1 0.1 \
             --reg ${fs_path}/Registration/$s/$s-$c_mean2fs.lta \
             --srcsubject $s
            
    mris_apply_reg --src ${fs_path}/Registration/$s/Projected/$s-$c-$h.fsavg.mgz \
                   --o ${fs_path}/Registration/$s/Projected/$s-$c-$h.fsavg.mgz \
                   --streg $SUBJECTS_DIR/$subj/surf/$hemi.fsaverage.sphere.reg $SUBJECTS_DIR/fsaverage/surf/$hemi.sphere.reg
                    done
                done


}

