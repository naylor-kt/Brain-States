#!/bin/bash

<label index="105" x="73" y="100" z="65">GM Medial geniculate body R</label>
<label index="106" x="106" y="100" z="64">GM Medial geniculate body L</label>



# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates"

mkdir -p ${data_path}/Mask/Extracted_Region/
mask_path="$HOME/BrainStates/Mask"

# Extract region MGB from the Juelich Atlas
fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/Juelich-rh-MGB 105 1

fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/Juelich-lh-MGB 106 1

make_mask () {
data_path="$HOME/BrainStates";s=$1
mask_path="$HOME/BrainStates/Mask"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
vol_path="$HOME/BrainStates/Volumetric"

mkdir -p ${mask_path}/T1_Mask/${s}
mkdir -p ${mask_path}/Func_Mask/${s}

cond=(as ns vs)
hemi=(lh rh)

for h in ${hemi[@]}; do
      mkdir -p ${mask_path}/T1_Mask/${h}/${s}
      mkdir -p ${mask_path}/Func_Mask/${h}/${s}

      applywarp --in=${mask_path}/Extracted_Region/Juelich-${h}-MGB \
                --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                --out=${mask_path}/T1_Mask/${h}/${s}/${s}_MGBmask2T1-${h} \
                --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

    # Region HG mask to functional mask
        for c in ${cond[@]}; do
                applywarp --in=${mask_path}/Extracted_Region/Juelich-${h}-MGB \
                          --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                          --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                          --out=${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h}
        done
    done
