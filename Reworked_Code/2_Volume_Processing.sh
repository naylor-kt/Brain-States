#!/bin/bash

# Define the function
volume_processing () {

mkdir -p $HOME/BrainStates_Test/Volumetric

data_path="$HOME/BrainStates";s=$1

preproc_path2="$HOME/BrainStates/Preproc/Level_2"
preproc_path3="$HOME/BrainStates/Preproc/Level_3"
vol_path="$HOME/BrainStates/Volumetric"

#Array of conditions
cond=(as ns vs)

#REGISTRATION

#Preparation of the T1 image
    mkdir -p ${vol_path}/Registration/$s/Struct
    mkdir -p ${vol_path}/Registration/$s/Inverse
    
    #Perform ROBUST FIELD OF VIEW on the structural, T1 image
    robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz
    
    #Bias Correction (nonpve prevents fast from performing segmentation of the image)
    fast -B --nopve ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

    #Spatial Smoothing
    fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    susan ${vol_path}/Registration/$s/Struct/${s}_crop_struct_restore -1 $sigma 3 1 0 ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

    #Remove the unecessary files
    imrm ${vol_path}/Registration/$s/Struct/${s}_crop_struct_*

#Use flirt with 12 DOF with the structural image (T1) and MNI-2mm, with the default cost function --> corratio
    flirt -in ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
        -ref $FSLDIR/data/standard/MNI152_T1_2mm \
        -omat ${vol_path}/Registration/$s/${s}-struct2mni.mat \
        -dof 12
    
 #Use fnirt with the structural image and MNI-152 (non-linear)
    fnirt --in=${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${vol_path}/Registration/$s/${s}-struct2mni.mat \
          --cout=${vol_path}/Registration/$s/${s}-struct2mni_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

 #Apply warp to register the structural image to MNI space
    applywarp -i ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
    -o ${vol_path}/Registration/$s/${s}-struct2mni.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${vol_path}/Registration/$s/${s}-struct2mni_warp

 #Make a directory for the inverse warp and mat files
 mkdir -p ${vol_path}/Registration/Inverse/$s
 
 #Produce the inverse warp field to enable MNI to T1
    invwarp --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${vol_path}/Registration/Inverse/$s/${s}-mni2struct_warp \
            --ref=${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

for c in ${cond[@]}; do
  
  #REGISTRATION OF THE MEAN FUNCTIONAL RESTRICTED TEMPORALLY FILTERED IMAGE TO THE STRUCTURAL T1 IMAGE, with 6 DOF
  
    #Flirt using the mean image, which was created earlier, prior to temporal filtering
    # interpolation -> by nearest neighbour (as registering a functional image with large voxels, to the structural image (stops image looking smoothed)
    # cost function -> mutal information (whilst this takes longer, when tested it performed better than the other cost functions)
    
    flirt -in ${preproc_path2}/Temporally_Filtered/Restricted/${s}/Mean/${s}-${c}_psc_Rtf_mean.nii.gz \
    -ref ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
    -omat ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
    -interp nearestneighbour \
    -out ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6
  
  # Create the inverse of the mat file
    convert_xfm -omat ${vol_path}/Registration/Inverse/$s/${s}-${c}-struct2meanfunc.mat -inverse ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat
    
 # APPLY THE WARP FIELDS TO TRANSFORM THE FUNCTIONAL TIMESERIES FROM NATIVE TO STANDARD (MNI-152) SPACE
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${vol_path}/Registration/$s/${s}-${c}-func2mni.nii.gz
   
done

}

# Exports the function
export -f volume_processing

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'volume_processing {1}' ::: ${s[@]}