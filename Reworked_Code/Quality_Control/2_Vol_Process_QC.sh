#!/bin/bash


data_path="$HOME/BrainStates_Test"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates/Preproc/Level_2_Smoothed"
vol_path="$HOME/BrainStates_Test/Volumetric"

s=(sub-06)
cond=(as ns vs)

# QUALITY CONTROL FOR VOLUME PROCESSING

# Check the preparation of the T1 image
echo "Use FSLeyes to check the preparation of the T1 image"
fsleyes ${data_path}/RawData/${s}/anat/${s}_T1w.nii.gz ${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz &

# Check the reslicing of the T1 image to MNI space
    # MNI at the bottom, with resliced T1 over the top
    # Change the colour of the resliced T1 and make less opaque to look at the accuracy of the reslicing
echo "Use FSLeyes to check the reslicing of T1 to MNI space"
fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${vol_path}/Registration/${s}/${s}-struct2mni.nii.gz -cm hot -a 50 -c 55 &

#For the UNSMOOTHED IMAGE

# Check the reslicing of the functional time series to MNI space
    # Load the images into fsleyes
    # Change the colour (Hot), image (-10, 20) and opacity of the resliced functional time series
    # Play the movie of the functional timeseries to check the reslicing of each volume to MNI space
echo "Use FSLeyes to check the reslicing of the functional time series to MNI space"
fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${vol_path}/Registration/${s}/${s}-as-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 95 ${vol_path}/Registration/${s}/${s}-ns-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 95 ${vol_path}/Registration/${s}/${s}-vs-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 95 &


# For the SMOOTHED IMAGE
echo "Use FSLeyes to check the reslicing of the SMOOTHED functional time series to MNI space"
fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${vol_path}/Smoothed/$s/${s}-as-SM-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 70 ${vol_path}/Smoothed/$s/${s}-ns-SM-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 70 ${vol_path}/Smoothed/$s/${s}-vs-SM-func2mni.nii.gz -dr -10 20 -cm hot -a 50 -c 70 &
