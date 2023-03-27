#!/bin/bash

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates_Test"

mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"

mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/lh
mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/rh

mask_left="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask/Extracted_Region/lh"
mask_right="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask/Extracted_Region/rh"


## Extract the masks from the maxprob 25 2mm Harvard Oxford Atlase

# Extract the frontal pole

fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 1 -uthr 1 ${mask_path}/Extracted_Region/HarvOx-FrontalPole

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalPole-rh


# Extract the Insular Cortex

fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 2 -uthr 2 ${mask_path}/Extracted_Region/HarvOx-Insular

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Insular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Insular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Insular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Insular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Insular-rh


# Extract the Superior Frontal Gyrus

fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 3 -uthr 3 ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorFrontal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorFrontal-rh


# Extract the Middle Frontal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 4 -uthr 4 ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal
    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-MiddleFrontal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-MiddleFrontal-rh


# Extract the Inferior Frontal Gyrus, pars triangularis
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 5 -uthr 5 ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParsTriangularis-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParsTriangularis-rh
    

# Extract the Inferior Frontal Gyrus, pars opercularis
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 6 -uthr 6 ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParsOpercularis-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParsOpercularis-rh


# Extract the Precentral Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 7 -uthr 7 ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PrecentralGyrus-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PrecentralGyrus-rh
    

# Extract the Temporal Pole
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 8 -uthr 8 ${mask_path}/Extracted_Region/HarvOx-TemporalPole

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporalPole-rh

# Extract the Anterior Superior Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 9 -uthr 9 ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorSuperiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorSuperiorTemporal-rh


# Extract the Posterior Superior Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 10 -uthr 10 ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorSuperiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorSuperiorTemporal-rh


# Extract the Anterior Middle Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 11 -uthr 11 ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorMiddleTemporal-rh

# Extract the Posterior Middle Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 12 -uthr 12 ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorMiddleTemporal-rh
    
# Extract the Temporooccipital Middle Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 13 -uthr 13 ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporooccipitalMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporooccipitalMiddleTemporal-rh

# Extract the Anterior Inferior Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 14 -uthr 14 ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorInferiorTemporal-rh

# Extract the Posterior Inferior Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 15 -uthr 15 ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorInferiorTemporal-rh

# Extract the Temporooccipital Inferior Temporal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 16 -uthr 16 ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporooccipitalInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporooccipitalInferiorTemporal-rh
    

# Extract the Postcentral Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 17 -uthr 17 ${mask_path}/Extracted_Region/HarvOx-Postcentral

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Postcentral | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Postcentral -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Postcentral-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Postcentral -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Postcentral-rh

# Extract the Superior Parietal
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 18 -uthr 18 ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorParietal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorParietal-rh

# Extract the Anterior Supramarginal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 19 -uthr 19 ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorSupramarginal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorSupramarginal-rh
    
# Extract the Posterior Supramarginal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 20 -uthr 20 ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorSupramarginal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorSupramarginal-rh
    
# Extract the Angular Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 21 -uthr 21 ${mask_path}/Extracted_Region/HarvOx-Angular

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Angular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Angular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Angular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Angular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Angular-rh

# Extract the Superior Lateral Occipital Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 22 -uthr 22 ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorLateralOccipital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorLateralOccipital-rh

# Extract the Inferior Lateral Occipital Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 23 -uthr 23 ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-InferiorLateralOccipital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-InferiorLateralOccipital-rh

# Extract the Intracalcarine Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 24 -uthr 24 ${mask_path}/Extracted_Region/HarvOx-Intracalcarine

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Intracalcarine | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Intracalcarine -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Intracalcarine-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Intracalcarine -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Intracalcarine-rh


# Extract the Frontal Medial Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 25 -uthr 25 ${mask_path}/Extracted_Region/HarvOx-FrontalMedial

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalMedial | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalMedial -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalMedial-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalMedial -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalMedial-rh


# Extract the Juxtapositional Lobule Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 26 -uthr 26 ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-JuxtapositionalLobule-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-JuxtapositionalLobule-rh
    

# Extract the Subcallosal Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 27 -uthr 27 ${mask_path}/Extracted_Region/HarvOx-Subcallosal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Subcallosal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Subcallosal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Subcallosal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Subcallosal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Subcallosal-rh

# Extract the Paracingulate Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 28 -uthr 28 ${mask_path}/Extracted_Region/HarvOx-Paracingulate

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Paracingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Paracingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Paracingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Paracingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Paracingulate-rh

# Extract the Anterior Cingulate Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 29 -uthr 29 ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorCingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorCingulate-rh

# Extract the Posterior Cingulate Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 30 -uthr 30 ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorCingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorCingulate-rh

# Extract the Precuneous Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 31 -uthr 31 ${mask_path}/Extracted_Region/HarvOx-Precuneous

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Precuneous | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Precuneous -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Precuneous-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Precuneous -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Precuneous-rh

# Extract the Cuneal Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 32 -uthr 32 ${mask_path}/Extracted_Region/HarvOx-Cuneal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Cuneal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Cuneal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Cuneal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Cuneal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Cuneal-rh

# Extract the Frontal Orbital Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 33 -uthr 33 ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalOrbital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalOrbital-rh

# Extract the Anterior Parahippocampal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 34 -uthr 34 ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorParahippocampal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorParahippocampal-rh

# Extract the Posterior Parahippocampal Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 35 -uthr 35 ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorParahippocampal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorParahippocampal-rh

# Extract the Lingual Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 36 -uthr 36 ${mask_path}/Extracted_Region/HarvOx-Lingual

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Lingual | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Lingual -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Lingual-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Lingual -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Lingual-rh

# Extract the Anterior Temporal Fusiform Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 37 -uthr 37 ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorTemporalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorTemporalFusiform-rh

# Extract the Posterior Temporal Fusiform Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 38 -uthr 38 ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorTemporalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorTemporalFusiform-rh

# Extract the Temporal Occipital Fusiform Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 39 -uthr 39 ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform
    
    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporalOccipitalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporalOccipitalFusiform-rh

# Extract the Occipital Fusiform Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 40 -uthr 40 ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-OccipitalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-OccipitalFusiform-rh

# Extract the Frontal Operculum
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 41 -uthr 41 ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalOperculum-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalOperculum-rh

# Extract the Central Opercular Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 42 -uthr 42 ${mask_path}/Extracted_Region/HarvOx-CentralOpercular

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-CentralOpercular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-CentralOpercular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-CentralOpercular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-CentralOpercular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-CentralOpercular-rh

# Extract the Parietal Operculum Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 43 -uthr 43 ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParietalOperculum-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParietalOperculum-rh

# Extract the Planum Polare
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 44 -uthr 44 ${mask_path}/Extracted_Region/HarvOx-PlanumPolare

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PlanumPolare | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumPolare -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PlanumPolare-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumPolare -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PlanumPolare-rh

# Extract the Heschl's Gyrus
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 45 -uthr 45 ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-HeschlsGyrus-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-HeschlsGyrus-rh

# Extract the Planum Temporale
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 46 -uthr 46 ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PlanumTemporale-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PlanumTemporale-rh
    
# Extract the Supracalcarine Cortex
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 47 -uthr 47 ${mask_path}/Extracted_Region/HarvOx-Supracalcarine

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Supracalcarine | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Supracalcarine -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Supracalcarine-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Supracalcarine -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Supracalcarine-rh

# Extract the Occipital Pole
fslmaths $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz -thr 48 -uthr 48 ${mask_path}/Extracted_Region/HarvOx-OccipitalPole

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-OccipitalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-OccipitalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-OccipitalPole-rh



make_mask () {

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates_Test";s=$1
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
vol_path="$HOME/BrainStates_Test/Volumetric"

mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"

mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/lh
mkdir -p ${data_path}/Comparing_ALFF_Types/Mask/Extracted_Region/rh


mkdir -p ${mask_path}/T1_Mask
T1_mask="${mask_path}/T1_Mask"

mkdir -p ${mask_path}/Func_Mask
func_mask="${mask_path}/Func_Mask"
   

cond=(as ns vs)
hemi=(lh rh)

for r in `cat ${mask_path}/Region_List.txt`; do
    mkdir -p ${T1_mask}/${r}/${s}
    mkdir -p ${func_mask}/${r}/${s}

# Region to T1

        applywarp --in=${mask_path}/Extracted_Region/HarvOx-${r} \
                  --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                  --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                  --out=${T1_mask}/${r}/${s}/${s}_${r}-mask2T1

        # Region mask to functional mask
        for c in ${cond[@]}; do
            applywarp --in=${mask_path}/Extracted_Region/HarvOx-${r}  \
                      --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                      --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                      --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                      --out=${func_mask}/${r}/${s}/${s}-${c}-${r}-mask2func
            
            mkdir -p ${func_mask}/binarised/${r}/${s}
            fslmaths ${func_mask}/${r}/${s}/${s}-${c}-${r}-mask2func.nii.gz -bin ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin.nii.gz

        done

        # lh or rh to T1 and functional timeseries
        for h in ${hemi[@]}; do
        mkdir -p ${T1_mask}/${r}/${s}/${h}
        mkdir -p ${func_mask}/${r}/${s}/${h}
            
            
            applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-${r}-${h} \
                      --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                      --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                      --out=${T1_mask}/${r}/${s}/${h}/${s}-${r}-mask2T1-${h} 

        # Region HG mask to functional mask
            for c in ${cond[@]}; do
                    applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-${r}-${h} \
                              --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                              --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                              --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                              --out=${func_mask}/${r}/${s}/${h}/${s}-${c}-${r}-mask2func-${h}
                    
                    fslmaths ${func_mask}/${r}/${s}/${h}/${s}-${c}-${r}-mask2func-${h}.nii.gz -bin ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin-${h}.nii.gz
            done
        done
done


}

export -f make_mask

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'make_mask {1}' ::: ${s[@]}

