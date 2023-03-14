#!/bin/bash


data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
analysis_path="/Users/mszkcn/BrainStates_Test/Analysis"
analysis_out="/Users/mszkcn/BrainStates_Test/Analysis/MNI_Space"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"
vol_path="$HOME/BrainStates/Volumetric"

s=(sub-01)
cond=(as ns vs)
neighbourhood=(7 19 27)
region=(AC HG PT MGB V1 Thal MGB)
region_2=(AC HG PT V1)

#For the UNSMOOTHED IMAGE

# Check the reslicing of the functional time series to MNI space
    # Load the images into fsleyes
    # Change the colour (Hot), image (0, 5) and opacity of the resliced functional time series
    # Play the movie of the functional timeseries to check the reslicing of each volume to MNI space
echo "Use FSLeyes to check the reslicing of ALFF to MNI space"
## Set the subject
s=(sub-01)

## Set the condition
c=(as)

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-MNI.nii.gz -dr 0 5 -cm hot -a 60 ${analysis_out}/ALFF/AC/${s}/${s}-${c}-ALFF-MNI-AC.nii.gz -dr 0 5 -cm blue-lightblue -a 60 ${analysis_out}/ALFF/HG/${s}/${s}-${c}-ALFF-MNI-HG.nii.gz -dr 0 5 -cm green -a 60 ${analysis_out}/ALFF/PT/${s}/${s}-${c}-ALFF-MNI-PT.nii.gz -dr 0 5 -cm yellow -a 60 ${analysis_out}/ALFF/V1/${s}/${s}-${c}-ALFF-MNI-V1.nii.gz -dr 0 5 -cm copper -a 60 ${analysis_out}/ALFF/Thal/${s}/${s}-${c}-ALFF-MNI-Thal.nii.gz -dr 0 5 -cm pink -a 60 ${analysis_out}/ALFF/MGB/${s}/${s}-${c}-ALFF-MNI-MGB.nii.gz -dr 0 5 -cm cool -a 60 &

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-MNI.nii.gz -dr 0 5 -cm hot -a 60 ${analysis_out}/ALFF/Grey_Matter/AC/${s}/${s}-${c}-ALFF-MNI-AC-grey.nii.gz -dr 0 5 -cm blue-lightblue -a 60 ${analysis_out}/ALFF/Grey_Matter/HG/${s}/${s}-${c}-ALFF-MNI-HG-grey.nii.gz -dr 0 5 -cm green -a 60 ${analysis_out}/ALFF/Grey_Matter/PT/${s}/${s}-${c}-ALFF-MNI-PT-grey.nii.gz -dr 0 5 -cm yellow -a 60 ${analysis_out}/ALFF/Grey_Matter/V1/${s}/${s}-${c}-ALFF-MNI-V1-grey.nii.gz -dr 0 5 -cm copper -a 60 &
                    
                    
echo "Use FSLeyes to check the reslicing of fALFF to MNI space"
## Set the subject
s=(sub-01)

## Set the condition
c=(as)

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-MNI.nii.gz -dr 0 1 -cm hot -a 60 ${analysis_out}/fALFF/AC/${s}/${s}-${c}-fALFF-MNI-AC.nii.gz -dr 0 1 -cm blue-lightblue -a 60 ${analysis_out}/fALFF/HG/${s}/${s}-${c}-fALFF-MNI-HG.nii.gz -dr 0 1 -cm green -a 60 ${analysis_out}/fALFF/PT/${s}/${s}-${c}-fALFF-MNI-PT.nii.gz -dr 0 1 -cm yellow -a 60 ${analysis_out}/fALFF/V1/${s}/${s}-${c}-fALFF-MNI-V1.nii.gz -dr 0 1 -cm copper -a 60 ${analysis_out}/fALFF/Thal/${s}/${s}-${c}-fALFF-MNI-Thal.nii.gz -dr 0 1 -cm pink -a 60 ${analysis_out}/fALFF/MGB/${s}/${s}-${c}-fALFF-MNI-MGB.nii.gz -dr 0 1 -cm cool -a 60 &

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/fALFF/Grey_Matter/AC/${s}/${s}-${c}-fALFF-MNI-AC-grey.nii.gz -dr 0 1 -cm blue-lightblue -a 60 ${analysis_out}/fALFF/Grey_Matter/HG/${s}/${s}-${c}-fALFF-MNI-HG-grey.nii.gz -dr 0 1 -cm green -a 60 ${analysis_out}/fALFF/Grey_Matter/PT/${s}/${s}-${c}-fALFF-MNI-PT-grey.nii.gz -dr 0 1 -cm yellow -a 60 ${analysis_out}/fALFF/Grey_Matter/V1/${s}/${s}-${c}-fALFF-MNI-V1-grey.nii.gz -dr 0 1 -cm copper -a 60 &
                  
                                    
echo "Use FSLeyes to check the reslicing of ReHo to MNI space"
##Set the neighbourhood
n=(7)

## Set the condition
c=(as)

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/ReHo/ReHo_${n}/Whole_Brain/${s}/${s}-${c}-ReHo-${n}-MNI.nii.gz -dr 0 1 -cm hot -a 60 ${analysis_out}/ReHo/ReHo_${n}/AC/${s}/${s}-${c}-ReHo-${n}-MNI-AC.nii.gz -dr 0 1 -cm blue-lightblue -a 60 ${analysis_out}/ReHo/ReHo_${n}/HG/${s}/${s}-${c}-ReHo-${n}-MNI-HG.nii.gz -dr 0 1 -cm green -a 60 ${analysis_out}/ReHo/ReHo_${n}/PT/${s}/${s}-${c}-ReHo-${n}-MNI-PT.nii.gz -dr 0 1 -cm yellow -a 60 ${analysis_out}/ReHo/ReHo_${n}/V1/${s}/${s}-${c}-ReHo-${n}-MNI-V1.nii.gz -dr 0 1 -cm copper -a 60 ${analysis_out}/ReHo/ReHo_${n}/Thal/${s}/${s}-${c}-ReHo-${n}-MNI-Thal.nii.gz -dr 0 1 -cm pink -a 60 ${analysis_out}/ReHo/ReHo_${n}/MGB/${s}/${s}-${c}-ReHo-${n}-MNI-MGB.nii.gz -dr 0 1 -cm cool -a 60 &

fsleyes $FSLDIR/data/standard/MNI152_T1_2mm ${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/AC/${s}/${s}-${c}-ReHo-${n}-MNI-AC-grey.nii.gz -dr 0 1 -cm blue-lightblue -a 60 ${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/HG/${s}/${s}-${c}-ReHo-${n}-MNI-HG-grey.nii.gz -dr 0 1 -cm green -a 60 ${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/PT/${s}/${s}-${c}-ReHo-${n}-MNI-PT-grey.nii.gz -dr 0 1 -cm yellow -a 60 ${analysis_out}/ReHo/ReHo_${n}/Grey_Matter/V1/${s}/${s}-${c}-ReHo-${n}-MNI-V1-grey.nii.gz -dr 0 1 -cm copper -a 60  &


                  
                      
                      
