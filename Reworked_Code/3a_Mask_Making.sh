#!/bin/bash

# Extract the regions of interest from the Oxford-Harvard Atlas
data_path="$HOME/BrainStates_Test"

mkdir -p ${data_path}/Mask/Extracted_Region/
mask_path="$HOME/BrainStates_Test/Mask"

# Extract region Herschels Gyrus from the Harvard-Oxford Atlas
#fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-HGprob 44 1

# Extract the left HG
#line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-HGprob | grep dim1)); dim1=${line[1]}

#mkdir -p ${data_path}/Mask/Extracted_Region/lh/

#fslmaths ${mask_path}/Extracted_Region/HarvOx-HGprob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/lh/HarvOx-HGprob-lh

# Extract the right HG
#mkdir -p ${data_path}/Mask/Extracted_Region/rh/

#fslmaths ${mask_path}/Extracted_Region/HarvOx-HGprob -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/rh/HarvOx-HGprob-rh


# Extract region Planar Temporale from the Harvard-Oxford Atlas
#fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-cort-prob-1mm ${mask_path}/Extracted_Region/HarvOx-PTprob 45 1

# Extract the left PT
#line=($(fslinfo ${mask_path}/Extracted_Region/HarvOx-PTprob | grep dim1)); dim1=${line[1]}

#fslmaths ${mask_path}/Extracted_Region/HarvOx-PTprob -roi $(($dim1/2)) $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/lh/HarvOx-PTprob-lh

# Extract the right PT
#fslmaths ${mask_path}/Extracted_Region/HarvOx-PTprob -roi 0 $(($dim1/2)) 0 -1 0 -1 0 -1 ${mask_path}/Extracted_Region/rh/HarvOx-PTprob-rh

# Extract region MGB from the Juelich Atlas
#fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/rh/Juelich-MGB-rh 105 1

#fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/lh/Juelich-MGB-lh 106 1

# Extract V1 from the Juelich Atlas
#fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/lh/Juelich-V1-lh 80 1

#fslroi $FSLDIR/data/atlases/Juelich/Juelich-prob-1mm.nii.gz ${mask_path}/Extracted_Region/rh/Juelich-V1-rh 81 1


# Extract region Thalamus from the Harvard-Oxford Atlas
#fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-sub-prob-1mm ${mask_path}/Extracted_Region/lh/HarvOx-Thalprob-lh 3 1

#fslroi $FSLDIR/data/atlases/HarvardOxford/HarvardOxford-sub-prob-1mm ${mask_path}/Extracted_Region/rh/HarvOx-Thalprob-rh 14 1


#Create a parallel function to enable the reslicing back to the subject specific spaces

make_mask () {
data_path="$HOME/BrainStates_Test";s=$1
mask_path="$HOME/BrainStates_Test/Mask"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
vol_path="$HOME/BrainStates_Test/Volumetric"

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
            
            mkdir -p ${mask_path}/Func_Mask/bin/${s}
            fslmaths ${mask_path}/Func_Mask/${s}/${s}-${c}_${a}mask2func.nii.gz -bin ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${a}mask2func-bin.nii.gz

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
                    
                    mkdir -p ${mask_path}/Func_Mask/${h}/bin/${s}
                    fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_${a}mask2func-${h}.nii.gz -bin ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_${a}mask2func-bin-${h}.nii.gz
            done
        done
done

#Produce a conjunction of the masks
for c in ${cond[@]}; do
fslmaths ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_HGmask2func-bin -max ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_PTmask2func-bin ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_ACmask2func-bin
done

for h in ${hemi[@]}; do

    for c in ${cond[@]}; do
    fslmaths ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_HGmask2func-bin-${h} -max ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_PTmask2func-bin-${h} ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_ACmask2func-bin-${h}
    done

done



######################################################################################################
# Repeat the process to make a mask of Thalamus from the Harvard-Oxford Brain Atlas

for h in ${hemi[@]}; do
      mkdir -p ${mask_path}/T1_Mask/${h}/${s}
      mkdir -p ${mask_path}/Func_Mask/${h}/${s}

    # V1 mask to T1 subject specific space
      applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-Thalprob-${h} \
                --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                --out=${mask_path}/T1_Mask/${h}/${s}/${s}_Thalmask2T1-${h} \
                --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

    # V1 mask to subject specific functional space
        for c in ${cond[@]}; do
                applywarp --in=${mask_path}/Extracted_Region/${h}/HarvOx-Thalprob-${h} \
                          --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                          --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                          --out=${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_Thalmask2func-${h}
                
                mkdir -p ${mask_path}/Func_Mask/${h}/bin/${s}
                fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_Thalmask2func-${h}.nii.gz -bin ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_Thalmask2func-bin-${h}.nii.gz
        done
    done

#Produce a conjunction of the masks to create a bilateral mask of the V1
for c in ${cond[@]}; do
mkdir -p ${mask_path}/Func_Mask/bin/${s}
fslmaths ${mask_path}/Func_Mask/lh/bin/${s}/${s}-${c}_Thalmask2func-bin-lh -max ${mask_path}/Func_Mask/rh/bin/${s}/${s}-${c}_Thalmask2func-bin-rh ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_Thalmask2func-bin
done

 #############################################################################################
# Repeat the process to make a mask of the MGB from the Juelich Brain Atlas

# Reslice the mask to subject specific spaces

for h in ${hemi[@]}; do
      mkdir -p ${mask_path}/T1_Mask/${h}/${s}
      mkdir -p ${mask_path}/Func_Mask/${h}/${s}

    # MGB mask to T1 subject specific space
      applywarp --in=${mask_path}/Extracted_Region/${h}/Juelich-MGB-${h} \
                --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                --out=${mask_path}/T1_Mask/${h}/${s}/${s}_MGBmask2T1-${h} \
                --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

    # MGB mask to subject specific functional space
        for c in ${cond[@]}; do
                applywarp --in=${mask_path}/Extracted_Region/${h}/Juelich-MGB-${h} \
                          --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                          --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                          --out=${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h}
                
                mkdir -p ${mask_path}/Func_Mask/${h}/bin/${s}
                fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_MGBmask2func-${h}.nii.gz -thr 10 -bin ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_MGBmask2func-bin-${h}.nii.gz
        done
    done

#Produce a conjunction of the masks to create a bilateral mask of the MGB
for c in ${cond[@]}; do
mkdir -p ${mask_path}/Func_Mask/bin/${s}
fslmaths ${mask_path}/Func_Mask/lh/bin/${s}/${s}-${c}_MGBmask2func-bin-lh -max ${mask_path}/Func_Mask/rh/bin/${s}/${s}-${c}_MGBmask2func-bin-rh ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_MGBmask2func-bin
done

######################################################################################################
# Repeat the process to make a mask of V1 from the Juelich Brain Atlas

for h in ${hemi[@]}; do
      mkdir -p ${mask_path}/T1_Mask/${h}/${s}
      mkdir -p ${mask_path}/Func_Mask/${h}/${s}

    # V1 mask to T1 subject specific space
      applywarp --in=${mask_path}/Extracted_Region/${h}/Juelich-V1-${h} \
                --ref=${vol_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz \
                --out=${mask_path}/T1_Mask/${h}/${s}/${s}_V1mask2T1-${h} \
                --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp

    # V1 mask to subject specific functional space
        for c in ${cond[@]}; do
                applywarp --in=${mask_path}/Extracted_Region/${h}/Juelich-V1-${h} \
                          --ref=${preproc_path1}/${s}/Level_1_Mean/${s}-${c}_mean_func.nii.gz \
                          --warp=${vol_path}/Registration/Inverse/${s}/${s}-mni2struct_warp \
                          --postmat=${vol_path}/Registration/Inverse/${s}/${s}-${c}-struct2meanfunc.mat \
                          --out=${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h}
                
                mkdir -p ${mask_path}/Func_Mask/${h}/bin/${s}
                fslmaths ${mask_path}/Func_Mask/${h}/${s}/${s}-${c}_V1mask2func-${h}.nii.gz -thr 10 -bin ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_V1mask2func-bin-${h}.nii.gz
                
        done
    done

#Produce a conjunction of the masks to create a bilateral mask of the V1
for c in ${cond[@]}; do
mkdir -p ${mask_path}/Func_Mask/bin/${s}
fslmaths ${mask_path}/Func_Mask/lh/bin/${s}/${s}-${c}_V1mask2func-bin-lh -max ${mask_path}/Func_Mask/rh/bin/${s}/${s}-${c}_V1mask2func-bin-rh ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_V1mask2func-bin
done

}

export -f make_mask

# Create an array with subjects (as they are in the RawData file
#s=($(ls $HOME/BrainStates/RawData))
s=(sub-06)

# Check the contents of the subject array
echo ${s[@]}


parallel --jobs 0 'make_mask {1}' ::: ${s[@]}

