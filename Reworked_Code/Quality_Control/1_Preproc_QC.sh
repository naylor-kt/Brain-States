#!/bin/bash


data_path="$HOME/BrainStates"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_2_Smoothed"


subj=(sub-02) # Set the subject you want to check
cond=(as ns vs)

# QUALITY CONTROL FOR PREPROCESSING

for s in ${subj[@]}; do

# Check that the first 10 volumes have been removed
for c in ${cond[@]}; do
    line_o=($(fslhd ${data_path}/RawData/${s}/func/${s}_task-${c}_bold.nii.gz | grep dim4)); vol_orig=${line_o[1]}
    line_p=($(fslhd ${preproc_path1}/${s}/${s}-${c}-preproc.nii.gz | grep dim4)); vol_preproc=${line_p[1]}

    dif=$((${vol_orig}-${vol_preproc}))
        
        if [ $dif = 10 ]; then
            echo "$s-$c 10 volumes removed"
        elif [ $dif != 10 ]; then
            echo "$s-$c fslroi failed"
        fi
done

# Check that finding the original motion parameters has worked
    #By checking that there are 230 lines in the original motion parameters absolute and 229 lines relative rms files
for c in ${cond[@]}; do
    abs=$(wc -l < ${data_path}/OriginalMotion/${s}/${s}-${c}_oringal_motion_abs.rms)
    rel=$(wc -l < ${data_path}/OriginalMotion/${s}/${s}-${c}_oringal_motion_rel.rms)
    
    if [ $abs = 230 ] && [ $rel = 229 ]; then
    echo " ${s}-${c} Original Motion Parameters were obtained"
    elif [ $abs != 230 ] && [ $rel != 229 ]; then
    echo " ${s}-${c} Original Motion Parameters were NOT obtained"
    fi
done

#Slice Time Correction

# Check whether motion correction has worked
    # Check there are 230 files in the correction.mat file

for c in ${cond[@]}; do
    m_corr=$(ls -1 ${preproc_path1}/${s}/Motion_Correction/${s}-${c}_motion_correction.mat | wc -l)
    
    if [ $m_corr = 230 ]; then
    echo "${s}-${c} Motion Correction has been performed"
    elif [ $m_corr != 230 ]; then
    echo "${s}-${c} Motion Correction has NOT been performed"
    fi
    
done

# Check Distortion Correction

if [ ${s} != sub-07 ]; then
    # Check the created fmap files - have the fmap and rev_fmap now got 1 volume, and has the combined file got 2
    
    line_fmap=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_fmap_1vol.nii.gz | grep dim4)); vol_fmap=${line_fmap[1]}
    line_revfmap=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_revfmap_1vol.nii.gz | grep dim4)); vol_revfmap=${line_revfmap[1]}
    line_comb=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_combined.nii.gz | grep dim4)); vol_comb=${line_comb[1]}

    if [ ${vol_fmap} = 1 ] && [ ${vol_revfmap} = 1 ] && [ ${vol_comb} = 2 ]; then
    echo "${s} Field maps created correctly"
    elif [ ${vol_fmap} != 1 ] && [ ${vol_revfmap} != 1 ] && [ ${vol_comb} != 2 ]; then
    echo "${s} Field maps NOT created correctly"
    fi

elif [ ${s} = sub-07 ]; then
    # Check the created fmap files - have the fmap and rev_fmap now got 1 volume, and has the combined file got 2
    # for the condition as
    
    line_fmap_as=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_fmap_as_1vol.nii.gz | grep dim4)); vol_fmap_as=${line_fmap_as[1]}
    line_revfmap_as=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_revfmap_as_1vol.nii.gz | grep dim4)); vol_revfmap_as=${line_revfmap_as[1]}
    line_comb_as=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_as_combined.nii.gz | grep dim4)); vol_comb_as=${line_comb_as[1]}

    if [ ${vol_fmap_as} = 1 ] && [ ${vol_revfmap_as} = 1 ] && [ ${vol_comb_as} = 2 ]; then
    echo "${s} AS Field maps created correctly"
    elif [ ${vol_fmap_as} != 1 ] && [ ${vol_revfmap_as} != 1 ] && [ ${vol_comb_as} != 2 ]; then
    echo "${s} AS Field maps NOT created correctly"
    fi
   
    # for the condition ns and vs
    line_fmap_ns_vs=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_ns_vs_fmap_1vol.nii.gz | grep dim4)); vol_fmap_ns_vs=${line_fmap_ns_vs[1]}
    line_revfmap_ns_vs=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_ns_vs_revfmap_1vol.nii.gz | grep dim4)); vol_revfmap_ns_vs=${line_revfmap_ns_vs[1]}
    line_comb_ns_vs=($(fslhd ${preproc_path1}/${s}/TopUp/fmap/${s}_ns_vs_combined.nii.gz | grep dim4)); vol_comb_ns_vs=${line_comb_ns_vs[1]}

    if [ ${vol_fmap_ns_vs} = 1 ] && [ ${vol_revfmap_ns_vs} = 1 ] && [ ${vol_comb_ns_vs} = 2 ]; then
    echo "${s} NS-VS Field maps created correctly"
    elif [ ${vol_fmap_ns_vs} != 1 ] && [ ${vol_revfmap_ns_vs} != 1 ] && [ ${vol_comb_ns_vs} != 2 ]; then
    echo "${s} NS-VS Field maps NOT created correctly"
    fi

fi
done

###################################### FSL EYES to check the application of TOPUP ##############################################################
for s in ${subj[@]}; do
      if [ ${s} != sub-07 ]; then
        # Check the initial shift between the fmap and revfmap images, play as a movie, and then compare to the topup applied images
        echo "Use FSLeyes to check the application of topup"
        fsleyes ${preproc_path1}/${s}/TopUp/fmap/${s}_combined.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_fmap_tuapp.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_revfmap_tuapp.nii.gz &
     elif [${s} = sub-07 ]; then
            # Check the initial shift between the fmap and revfmap images, play as a movie, and then compare to the topup applied images
        echo "Use FSLeyes to check the application of topup"
        fsleyes ${preproc_path1}/${s}/TopUp/fmap/${s}_as_combined.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_as_fmap_tuapp.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_as_revfmap_tuapp.nii.gz &
        
            # Check the initial shift between the fmap and revfmap images, play as a movie, and then compare to the topup applied images
        echo "Use FSLeyes to check the application of topup"
        fsleyes ${preproc_path1}/${s}/TopUp/fmap/${s}_ns_vs_combined.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_ns_vs_fmap_tuapp.nii.gz ${preproc_path1}/${s}/TopUp/TopUp_Applied/${s}_ns_vs_revfmap_tuapp.nii.gz &
    fi
done

##################################### Use FSL EYES to check the conversion to percentage signal change ############################################
for s in ${subj[@]}; do
# Check the conversion of the data into percentage signal change
    # Open the preproc and percentage signal change images in fsleyes
    # Use the view option and select time series
    # Select the preproc image, and use the drop down menu to select percent changed, and then the plus button to add to the axis below
    # Deselect the preproc image, and now select the psc image
    # Use the drop down menu to select the normal -no scaling option
    # Press the add button
    # Check that these lines completely overlap

for c in ${cond[@]}; do
    echo "Use FSLeyes to check the conversion to Percentage Signal Change"
    fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz ${preproc_path1}/${s}/${s}-${c}-preproc.nii.gz &
done
done

##################################### Use FSL EYES to check the temporal filtering #################################################################
for s in ${subj[@]}; do
# Check the temporal filtering
    # Open the psc and temporally filtered images in fsleyes
    # Select the power spectra view
    # Check that the signal has been filtered between the desired frequencies

for c in ${cond[@]}; do
    echo "Use FSLeyes to check the Temporal Filtering"
    fsleyes ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz &
done

done


######################################### Use FSL EYES to check the spatial smoothing ###############################################################

for s in ${subj[@]}; do
# Check the spatial smoothing
    # Compare the smoothed and unsmoothed image
    # Make sure the contrast are set to the same to be able to see the difference

for c in ${cond[@]}; do
    echo "Use FSLeyes to check Spatial Smoothing"
    fsleyes ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz ${preproc_path1}/$s/${s}-${c}-preproc.nii.gz &
done

done


########## Check the conversion to percentage signal change ###############

for s in ${subj[@]}; do
# Check the conversion of the data into percentage signal change
    # Open the preproc and percentage signal change images in fsleyes
    # Use the view option and select time series
    # Select the preproc image, and use the drop down menu to select percent changed, and then the plus button to add to the axis below
    # Deselect the preproc image, and now select the psc image
    # Use the drop down menu to select the normal -no scaling option
    # Press the add button
    # Check that these lines completely overlap

for c in ${cond[@]}; do
    echo "Use FSLeyes to check the conversion to Percentage Signal Change"
    fsleyes ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz ${preproc_path2S}/Smoothed/${s}/${s}-${c}-SM.nii.gz &
done
done


########### Check the temporal filtering ################
for s in ${subj[@]}; do
# Check the temporal filtering
    # Open the psc and temporally filtered images in fsleyes
    # Select the power spectra view
    # Check that the signal has been filtered between the desired frequencies

for c in ${cond[@]}; do
    echo "Use FSLeyes to check the Temporal Filtering"
    fsleyes ${preproc_path2S}/Temporally_Filtered/Restricted/${s}/${s}-${c}-SM-psc-Rtf.nii.gz ${preproc_path2S}/Temporally_Filtered/Wide/${s}/${s}-${c}-SM-psc-Wtf.nii.gz ${preproc_path2S}/Percent_Signal_Change/${s}/${s}-${c}-SM-psc.nii.gz &
done

done
