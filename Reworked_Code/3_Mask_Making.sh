#!/bin/bash

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates"

mkdir -p ${data_path}/Mask/Extracted_Region/
mask_path="$HOME/BrainStates/Mask"

# Extract region Herschels Gyrus from the Harvard-Oxford Atlas
fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-HGprob 44 1

# Extract the left HG
line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-HGprob | grep dim1)); dim1=${line[1]}

mkdir -p ${data_path}/Mask/Extracted_Region/lh/

fslmaths ${mask_path}/Extracted_Region/HarvOx-HGprob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/lh/HarvOx-HGprob-lh

# Extract the right HG
mkdir -p ${data_path}/Mask/Extracted_Region/rh/

fslmaths ${mask_path}/Extracted_Region/HarvOx-HGprob -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/rh/HarvOx-HGprob-rh


# Extract region Planar Temporale from the Harvard-Oxford Atlas
fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-PTprob 45 1

# Extract the left PT
line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PTprob | grep dim1)); dim1=${line[1]}

fslmaths ${mask_path}/Extracted_Region/HarvOx-PTprob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/lh/HarvOx-PTprob-lh

# Extract the right PT
fslmaths ${mask_path}/Extracted_Region/HarvOx-PTprob -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/rh/HarvOx-PTprob-rh


#Create a parallel function to enable the reslicing back to the subject specific spaces

make_mask () {
data_path="$HOME/BrainStates";s=$1
mask_path="$HOME/BrainStates/Mask"
preproc_path1="$HOME/BrainStates/Preproc/Level_1"
vol_path="$HOME/BrainStates/Volumetric"

mkdir -p ${mask_path}/T1_Mask/${s}
mkdir -p ${mask_path}/Func_Mask/${s}

cond=(as ns vs)
hemi=(lh rh)
area=(HG PT)


for a in ${area[@]}; do

# Region to T1

        applywarp --in=${mask_path}/Extracted_Region/HarvOx-${a}prob \
                  --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                  --out=${mask_path}/T1_Mask/${s}/${s}_${a}mask2T1 \
                  --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

        # Region mask to functional mask
        for c in ${cond[@]}; do
            applywarp --in=${mask_path}/Extracted_Region/HarvOx-${a}prob  \
                      --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                      --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                      --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                      --out=${mask_path}/Func_Mask/${s}/${s}-${c}_${a}mask2func
        done

        # lh or rh to T1 and functional timeseries
        for h in ${hemi[@]}; do
            mkdir -p ${mask_path}/T1_Mask/${h}/${s}
            mkdir -p ${mask_path}/Func_Mask/${h}/${s}

            applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-${a}prob-${h} \
                      --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                      --out=${mask_path}/T1_Mask/${h}/${s}/${s}_${a}mask2T1-${h} \
                      --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

        # Region HG mask to functional mask
            for c in ${cond[@]}; do
                    applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-${a}prob-${h} \
                              --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                              --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                              --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                              --out=${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${a}mask2func-${h}
            done
        done
done

#Produce a conjunction of the masks
for c in ${cond[@]}; do
fslmaths ${mask_path}/Func_Mask/${s}/${s}-${c}_HGmask2func -max ${mask_path}/Func_Mask/${s}/${s}-${c}_PTmask2func ${mask_path}/Func_Mask/${s}/${s}-${c}_ACmask2func
done

for h in ${hemi[@]}; do

    for c in ${cond[@]}; do
    fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_HGmask2func-${h} -max ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_PTmask2func-${h} ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_ACmask2func-${h}
    done

done

}

export -f make_mask

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'make_mask {1}' ::: ${s[@]}
