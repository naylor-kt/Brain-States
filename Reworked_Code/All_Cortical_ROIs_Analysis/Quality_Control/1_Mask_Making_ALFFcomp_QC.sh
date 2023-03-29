#!/bin/bash

data_path="$HOME/BrainStates_Test"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
data_path="$HOME/BrainStates_Test"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
mask_left="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask/Extracted_Region/lh"
mask_right="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask/Extracted_Region/rh"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"

# Check the initial extraction, bilateral and unilateral

# Frontal Pole
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalPole -cm green ${mask_left}/HarvOx-FrontalPole-lh -cm blue -a 75 ${mask_right}/HarvOx-FrontalPole-rh -cm red -a 75 &

# Insular
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Insular -cm green ${mask_left}/HarvOx-Insular-lh -cm blue -a 75 ${mask_right}/HarvOx-Insular-rh -cm red -a 75 &

# Superior Frontal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorFrontal -cm green ${mask_left}/HarvOx-SuperiorFrontal-lh -cm blue -a 75 ${mask_right}/HarvOx-SuperiorFrontal-rh -cm red -a 75 &

# Middle Frontal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-MiddleFrontal -cm green ${mask_left}/HarvOx-MiddleFrontal-lh -cm blue -a 75 ${mask_right}/HarvOx-MiddleFrontal-rh -cm red -a 75 &

# Pars Triangularis
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParsTriangularis -cm green ${mask_left}/HarvOx-ParsTriangularis-lh -cm blue -a 75 ${mask_right}/HarvOx-ParsTriangularis-rh -cm red -a 75 &

# Pars Opercularis
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParsOpercularis -cm green ${mask_left}/HarvOx-ParsOpercularis-lh -cm blue -a 75 ${mask_right}/HarvOx-ParsOpercularis-rh -cm red -a 75 &

# Precentral Gyrus
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PrecentralGyrus -cm green ${mask_left}/HarvOx-PrecentralGyrus-lh -cm blue -a 75 ${mask_right}/HarvOx-PrecentralGyrus-rh -cm red -a 75 &

# Temporal Pole
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporalPole -cm green ${mask_left}/HarvOx-TemporalPole-lh -cm blue -a 75 ${mask_right}/HarvOx-TemporalPole-rh -cm red -a 75 &

# Anterior Superior Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorSuperiorTemporal -cm green ${mask_left}/HarvOx-AnteriorSuperiorTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorSuperiorTemporal-rh -cm red -a 75 &

# Posterior Superior Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorSuperiorTemporal -cm green ${mask_left}/HarvOx-PosteriorSuperiorTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorSuperiorTemporal-rh -cm red -a 75 &

# Anterior Middle Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorMiddleTemporal -cm green ${mask_left}/HarvOx-AnteriorMiddleTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorMiddleTemporal-rh -cm red -a 75 &

# Posterior Middle Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorMiddleTemporal -cm green ${mask_left}/HarvOx-PosteriorMiddleTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorMiddleTemporal-rh -cm red -a 75 &

# Temporooccipital Middle Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalMiddleTemporal -cm green ${mask_left}/HarvOx-TemporooccipitalMiddleTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-TemporooccipitalMiddleTemporal-rh -cm red -a 75 &

# Anterior Inferior Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorInferiorTemporal -cm green ${mask_left}/HarvOx-AnteriorInferiorTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorInferiorTemporal-rh -cm red -a 75 &

# Posterior Inferior Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorInferiorTemporal -cm green ${mask_left}/HarvOx-PosteriorInferiorTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorInferiorTemporal-rh -cm red -a 75 &

# Temporooccipital Inferior Temporal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporooccipitalInferiorTemporal -cm green ${mask_left}/HarvOx-TemporooccipitalInferiorTemporal-lh -cm blue -a 75 ${mask_right}/HarvOx-TemporooccipitalInferiorTemporal-rh -cm red -a 75 &

# Postcentral
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Postcentral -cm green ${mask_left}/HarvOx-Postcentral-lh -cm blue -a 75 ${mask_right}/HarvOx-Postcentral-rh -cm red -a 75 &

# Superior Parietal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorParietal -cm green ${mask_left}/HarvOx-SuperiorParietal-lh -cm blue -a 75 ${mask_right}/HarvOx-SuperiorParietal-rh -cm red -a 75 &

# Anterior Supramarginal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorSupramarginal -cm green ${mask_left}/HarvOx-AnteriorSupramarginal-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorSupramarginal-rh -cm red -a 75 &

# Posterior Supramarginal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorSupramarginal -cm green ${mask_left}/HarvOx-PosteriorSupramarginal-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorSupramarginal-rh -cm red -a 75 &

# Angular
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Angular -cm green ${mask_left}/HarvOx-Angular-lh -cm blue -a 75 ${mask_right}/HarvOx-Angular-rh -cm red -a 75 &

# Superior Lateral Occipital
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-SuperiorLateralOccipital -cm green ${mask_left}/HarvOx-SuperiorLateralOccipital-lh -cm blue -a 75 ${mask_right}/HarvOx-SuperiorLateralOccipital-rh -cm red -a 75 &

# Inferior Lateral Occipital
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-InferiorLateralOccipital -cm green ${mask_left}/HarvOx-InferiorLateralOccipital-lh -cm blue -a 75 ${mask_right}/HarvOx-InferiorLateralOccipital-rh -cm red -a 75 &

# Intracalcarine
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Intracalcarine -cm green ${mask_left}/HarvOx-Intracalcarine-lh -cm blue -a 75 ${mask_right}/HarvOx-Intracalcarine-rh -cm red -a 75 &

# Frontal Medial
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalMedial -cm green ${mask_left}/HarvOx-FrontalMedial-lh -cm blue -a 75 ${mask_right}/HarvOx-FrontalMedial-rh -cm red -a 75 &

# Juxtapositional Lobule
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-JuxtapositionalLobule -cm green ${mask_left}/HarvOx-JuxtapositionalLobule-lh -cm blue -a 75 ${mask_right}/HarvOx-JuxtapositionalLobule-rh -cm red -a 75 &

# Subcallosal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Subcallosal -cm green ${mask_left}/HarvOx-Subcallosal-lh -cm blue -a 75 ${mask_right}/HarvOx-Subcallosal-rh -cm red -a 75 &

# Paracingulate
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Paracingulate -cm green ${mask_left}/HarvOx-Paracingulate-lh -cm blue -a 75 ${mask_right}/HarvOx-Paracingulate-rh -cm red -a 75 &

# Anterior Cingulate
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorCingulate -cm green ${mask_left}/HarvOx-AnteriorCingulate-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorCingulate-rh -cm red -a 75 &

# Posterior Cingulate
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorCingulate -cm green ${mask_left}/HarvOx-PosteriorCingulate-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorCingulate-rh -cm red -a 75 &

# Precuneous
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Precuneous -cm green ${mask_left}/HarvOx-Precuneous-lh -cm blue -a 75 ${mask_right}/HarvOx-Precuneous-rh -cm red -a 75 &

# Cuneal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Cuneal -cm green ${mask_left}/HarvOx-Cuneal-lh -cm blue -a 75 ${mask_right}/HarvOx-Cuneal-rh -cm red -a 75 &

# Frontal Orbital
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalOrbital -cm green ${mask_left}/HarvOx-FrontalOrbital-lh -cm blue -a 75 ${mask_right}/HarvOx-FrontalOrbital-rh -cm red -a 75 &

# Anterior Parahippocampal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorParahippocampal -cm green ${mask_left}/HarvOx-AnteriorParahippocampal-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorParahippocampal-rh -cm red -a 75 &

# Posterior Parahippocampal
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorParahippocampal -cm green ${mask_left}/HarvOx-PosteriorParahippocampal-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorParahippocampal-rh -cm red -a 75 &

# Lingual
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Lingual -cm green ${mask_left}/HarvOx-Lingual-lh -cm blue -a 75 ${mask_right}/HarvOx-Lingual-rh -cm red -a 75 &

# Anterior Temporal Fusiform
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-AnteriorTemporalFusiform -cm green ${mask_left}/HarvOx-AnteriorTemporalFusiform-lh -cm blue -a 75 ${mask_right}/HarvOx-AnteriorTemporalFusiform-rh -cm red -a 75 &

# Posterior Temporal Fusiform
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PosteriorTemporalFusiform -cm green ${mask_left}/HarvOx-PosteriorTemporalFusiform-lh -cm blue -a 75 ${mask_right}/HarvOx-PosteriorTemporalFusiform-rh -cm red -a 75 &

# Temporal Occipital Fusiform
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-TemporalOccipitalFusiform -cm green ${mask_left}/HarvOx-TemporalOccipitalFusiform-lh -cm blue -a 75 ${mask_right}/HarvOx-TemporalOccipitalFusiform-rh -cm red -a 75 &

# Occipital Fusiform
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-OccipitalFusiform -cm green ${mask_left}/HarvOx-OccipitalFusiform-lh -cm blue -a 75 ${mask_right}/HarvOx-OccipitalFusiform-rh -cm red -a 75 &

# Frontal Operculum
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-FrontalOperculum -cm green ${mask_left}/HarvOx-FrontalOperculum-lh -cm blue -a 75 ${mask_right}/HarvOx-FrontalOperculum-rh -cm red -a 75 &

# Central Opercular
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-CentralOpercular -cm green ${mask_left}/HarvOx-CentralOpercular-lh -cm blue -a 75 ${mask_right}/HarvOx-CentralOpercular-rh -cm red -a 75 &

# Parietal Operculum
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-ParietalOperculum -cm green ${mask_left}/HarvOx-ParietalOperculum-lh -cm blue -a 75 ${mask_right}/HarvOx-ParietalOperculum-rh -cm red -a 75 &

# Planum Polare
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PlanumPolare -cm green ${mask_left}/HarvOx-PlanumPolare-lh -cm blue -a 75 ${mask_right}/HarvOx-PlanumPolare-rh -cm red -a 75 &

# Heschls Gyrus
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-HeschlsGyrus -cm green ${mask_left}/HarvOx-HeschlsGyrus-lh -cm blue -a 75 ${mask_right}/HarvOx-HeschlsGyrus-rh -cm red -a 75 &

# Planum Temporale
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-PlanumTemporale -cm green ${mask_left}/HarvOx-PlanumTemporale-lh -cm blue -a 75 ${mask_right}/HarvOx-PlanumTemporale-rh -cm red -a 75 &

# Supracalcarine
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-Supracalcarine -cm green ${mask_left}/HarvOx-Supracalcarine-lh -cm blue -a 75 ${mask_right}/HarvOx-Supracalcarine-rh -cm red -a 75 &

# Occipital Pole
fsleyes $FSL_DIR/data/standard/MNI152_T1_1mm.nii.gz ${mask_path}/Extracted_Region/HarvOx-OccipitalPole -cm green ${mask_left}/HarvOx-OccipitalPole-lh -cm blue -a 75 ${mask_right}/HarvOx-OccipitalPole-rh -cm red -a 75 &

########## CHECK RESLICING OF THE ATLAS REGIONS

####### Set the subject
s=(sub-01)

#### Set the region
#r=(FrontalPole)
#r=(Insular)
#r=(SuperiorFrontal)
#r=(MiddleFrontal)
#r=(ParsTriangularis)
#r=(ParsOpercularis)
#r=(PrecentralGyrus)
#r=(TemporalPole)
#r=(AnteriorSuperiorTemporal)
#r=(PosteriorSuperiorTemporal)
#r=(AnteriorMiddleTemporal)
#r=(PosteriorMiddleTemporal)
#r=(TemporooccipitalMiddleTemporal)
#r=(AnteriorInferiorTemporal)
#r=(PosteriorInferiorTemporal)
#r=(TemporooccipitalInferiorTemporal)
#r=(Postcentral)
#r=(SuperiorParietal)
#r=(AnteriorSupramarginal)
#r=(PosteriorSupramarginal)
#r=(Angular)
#r=(SuperiorLateralOccipital)
#r=(InferiorLateralOccipital)
#r=(Intracalcarine)
#r=(FrontalMedial)
#r=(JuxtapositionalLobule)
#r=(Subcallosal)
#r=(Paracingulate)
#r=(AnteriorCingulate)
#r=(PosteriorCingulate)
#r=(Precuneous)
#r=(Cuneal)
#r=(FrontalOrbital)
#r=(AnteriorParahippocampal)
#r=(PosteriorParahippocampal)
#r=(Lingual)
#r=(AnteriorTemporalFusiform)
#r=(PosteriorTemporalFusiform)
#r=(TemporalOccipitalFusiform)
#r=(OccipitalFusiform)
#r=(FrontalOperculum)
#r=(CentralOpercular)
#r=(ParietalOperculum)
#r=(PlanumPolare)
#r=(HeschlsGyrus)
#r=(PlanumTemporale)
#r=(Supracalcarine)
#r=(OccipitalPole)

#### Set the array for conditions
cond=(as ns vs)


# Check the reslicing to the T1 space (on a per subject basis)
fsleyes ${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz ${T1_mask}/${r}/${s}/${s}_${r}-mask2T1 -cm green ${T1_mask}/${r}/${s}/lh/${s}-${r}-mask2T1-lh.nii.gz -cm blue -a 75 ${T1_mask}/${r}/${s}/rh/${s}-${r}-mask2T1-rh.nii.gz -cm red -a 75 &

# Check the reslicing to the functional space (on a per subject basis
for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -dr -10 20 ${func_mask}/${r}/${s}/${s}-${c}-${r}-mask2func -cm green ${func_mask}/${r}/${s}/lh/${s}-${c}-${r}-mask2func-lh -cm blue -a 75 ${func_mask}/${r}/${s}/rh/${s}-${c}-${r}-mask2func-rh -cm red -a 75 &
done

# Check the binarisation of the mask
for c in ${cond[@]}; do
fsleyes ${preproc_path2}/Percent_Signal_Change/${s}/${s}-${c}-psc.nii.gz -dr -10 20 ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin -cm green ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin-lh -cm blue -a 75 ${func_mask}/binarised/${r}/${s}/${s}-${c}-${r}-funcmask-bin-rh -cm red -a 75 &
done


