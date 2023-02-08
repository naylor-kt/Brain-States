#!/bin/bash

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates"

mkdir -p ${data_path}/Mask/Extracted_Region
mask_path="$HOME/BrainStates/Mask"

# Extract region 44 from the Harvard-Oxford Atlas
fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-44prob 44 1

line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-44prob | grep dim1)); dim1=${line[1]}

fslmaths ${mask_path}/Extracted_Region/HarvOx-44prob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/HarvOx-44prob

# Extract region 45 from the Harvard-Oxford Atlas
fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-45prob 45 1

line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-45prob | grep dim1)); dim1=${line[1]}

fslmaths ${mask_path}/Extracted_Region/HarvOx-45prob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/HarvOx-45prob


#Create a parallel function to enable the reslicing back to the subject specific spaces

make_mask () {
data_path="$HOME/BrainStates";s=$1
mask_path="$HOME/BrainStates/Mask"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"

mkdir ${mask_path}/T1_Mask/${s}
mkdir ${mask_path}/Func_Mask/${s}

make_mask () {
cond=(as ns vs)

# Region 44 to T1

applywarp --in=${mask_path}/Extracted_Region/HarvOx-44prob \
          --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
          --out=${mask_path}/T1_Mask/${s}/${s}_44mask2T1 \
          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

# Region 44 mask to functional mask
for c in ${cond[@]}; do
    applywarp --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
              --in=${mask_path}/Extracted_Region/HarvOx-44prob  \
              --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
              --postmat= ${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
              --interp=nn \
              --out=${mask_path}/Func_Mask/${s}/${s}-${c}_44mask2func
done


# Region 45 to T1

applywarp --in=${mask_path}/Extracted_Region/HarvOx-45prob \
          --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
          --out=${mask_path}/T1_Mask/${s}/${s}_45mask2T1 \
          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

# Region 44 mask to functional mask
for c in ${cond[@]}; do
    applywarp --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
              --in=${mask_path}/Extracted_Region/HarvOx-45prob  \
              --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
              --postmat= ${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
              --interp=nn \
              --out=${mask_path}/Func_Mask/${s}/${s}-${c}_45mask2func
done

#Produce a conjunction of the masks
for c in ${cond[@]}; do
fslmaths ${mask_path}/Func_Mask/${s}/${s}-${c}_44mask2func -max ${mask_path}/Func_Mask/${s}/${s}-${c}_45mask2func ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func
done
} 
