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

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalPole 0 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalPole-rh


# Extract the Insular Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Insular 1 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Insular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Insular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Insular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Insular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Insular-rh


# Extract the Superior Frontal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal 2 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorFrontal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorFrontal-rh


# Extract the Middle Frontal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal 3 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-MiddleFrontal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-MiddleFrontal-rh


# Extract the Inferior Frontal Gyrus, pars triangularis

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis 4 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParsTriangularis-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParsTriangularis-rh
    

# Extract the Inferior Frontal Gyrus, pars opercularis

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis 5 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParsOpercularis-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParsOpercularis-rh


# Extract the Precentral Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus 6 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PrecentralGyrus-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PrecentralGyrus-rh
    

# Extract the Temporal Pole

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporalPole 7 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporalPole-rh

# Extract the Anterior Superior Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal 8 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorSuperiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorSuperiorTemporal-rh


# Extract the Posterior Superior Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal 9 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorSuperiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorSuperiorTemporal-rh


# Extract the Anterior Middle Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal 10 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorMiddleTemporal-rh

# Extract the Posterior Middle Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal 11 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorMiddleTemporal-rh
    
# Extract the Temporooccipital Middle Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal 12 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporooccipitalMiddleTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporooccipitalMiddleTemporal-rh

# Extract the Anterior Inferior Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal 13 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorInferiorTemporal-rh

# Extract the Posterior Inferior Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal 14 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorInferiorTemporal-rh

# Extract the Temporooccipital Inferior Temporal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal 15 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporooccipitalInferiorTemporal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporooccipitalInferiorTemporal-rh
    

# Extract the Postcentral Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Postcentral 16 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Postcentral | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Postcentral -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Postcentral-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Postcentral -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Postcentral-rh

# Extract the Superior Parietal

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal 17 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorParietal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorParietal-rh

# Extract the Anterior Supramarginal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal 18 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorSupramarginal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorSupramarginal-rh
    
# Extract the Posterior Supramarginal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal 19 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorSupramarginal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorSupramarginal-rh
    
# Extract the Angular Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Angular 20 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Angular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Angular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Angular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Angular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Angular-rh

# Extract the Superior Lateral Occipital Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital 21 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-SuperiorLateralOccipital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-SuperiorLateralOccipital-rh

# Extract the Inferior Lateral Occipital Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital 22 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-InferiorLateralOccipital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-InferiorLateralOccipital-rh

# Extract the Intracalcarine Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Intracalcarine 23 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Intracalcarine | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Intracalcarine -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Intracalcarine-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Intracalcarine -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Intracalcarine-rh


# Extract the Frontal Medial Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalMedial 24 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalMedial | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalMedial -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalMedial-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalMedial -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalMedial-rh


# Extract the Juxtapositional Lobule Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule 25 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-JuxtapositionalLobule-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-JuxtapositionalLobule-rh
    

# Extract the Subcallosal Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Subcallosal 26 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Subcallosal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Subcallosal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Subcallosal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Subcallosal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Subcallosal-rh

# Extract the Paracingulate Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Paracingulate 27 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Paracingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Paracingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Paracingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Paracingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Paracingulate-rh

# Extract the Anterior Cingulate Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate 28 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorCingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorCingulate-rh

# Extract the Posterior Cingulate Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate 29 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorCingulate-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorCingulate-rh

# Extract the Precuneous Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Precuneous 30 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Precuneous | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Precuneous -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Precuneous-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Precuneous -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Precuneous-rh

# Extract the Cuneal Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Cuneal 31 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Cuneal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Cuneal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Cuneal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Cuneal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Cuneal-rh

# Extract the Frontal Orbital Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital 32 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalOrbital-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalOrbital-rh

# Extract the Anterior Parahippocampal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal 33 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorParahippocampal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorParahippocampal-rh

# Extract the Posterior Parahippocampal Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal 34 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorParahippocampal-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorParahippocampal-rh

# Extract the Lingual Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Lingual 35 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Lingual | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Lingual -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Lingual-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Lingual -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Lingual-rh

# Extract the Anterior Temporal Fusiform Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform 36 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-AnteriorTemporalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-AnteriorTemporalFusiform-rh

# Extract the Posterior Temporal Fusiform Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform 37 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PosteriorTemporalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PosteriorTemporalFusiform-rh

# Extract the Temporal Occipital Fusiform Cortex
fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform 38 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-TemporalOccipitalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-TemporalOccipitalFusiform-rh

# Extract the Occipital Fusiform Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform 39 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-OccipitalFusiform-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-OccipitalFusiform-rh

# Extract the Frontal Operculum

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum 40 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-FrontalOperculum-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-FrontalOperculum-rh

# Extract the Central Opercular Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-CentralOpercular 41 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-CentralOpercular | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-CentralOpercular -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-CentralOpercular-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-CentralOpercular -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-CentralOpercular-rh

# Extract the Parietal Operculum Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum 42 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-ParietalOperculum-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-ParietalOperculum-rh

# Extract the Planum Polare

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PlanumPolare 43 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PlanumPolare | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumPolare -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PlanumPolare-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumPolare -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PlanumPolare-rh

# Extract the Heschl's Gyrus

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus 44 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-HeschlsGyrus-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-HeschlsGyrus-rh

# Extract the Planum Temporale

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale 45 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-PlanumTemporale-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-PlanumTemporale-rh
    
# Extract the Supracalcarine Cortex

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Supracalcarine 46 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-Supracalcarine | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-Supracalcarine -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-Supracalcarine-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-Supracalcarine -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-Supracalcarine-rh

# Extract the Occipital Pole

fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-maxprob-thr25-2mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-OccipitalPole 47 1

    # Extract the individual hemispheres
    line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-OccipitalPole | grep dim1)); dim1=${line[1]}

    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalPole -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_left}/HarvOx-OccipitalPole-lh
    
    fslmaths ${mask_path}/Extracted_Region/HarvOx-OccipitalPole -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_right}/HarvOx-OccipitalPole-rh



make_mask () {

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates_Test"
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
#s=($(ls $HOME/BrainStates/RawData))
s=(sub-06)

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'make_mask {1}' ::: ${s[@]}

