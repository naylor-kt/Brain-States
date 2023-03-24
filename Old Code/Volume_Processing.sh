#!/bin/bash
#Define the function
volume_processing () {

mkdir -p $HOME/Brain_States/Volumetric

data_path="$HOME/Brain_States";s=$1
vol_path="$HOME/Brain_States/Volumetric"

#Array of conditions
cond=(as ns vs)

#REGISTRATION

#REGISTRATION OF THE T1 STRUCTURAL IMAGE WITH MNI-152
    mkdir -p ${vol_path}/Registration/$s/Struct

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

 #Produce the inverse warp image for quality control purposes
    invwarp --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${vol_path}/Registration/$s/${s}-mni2struct_warp \
            --ref=${vol_path}/RawData/$s/anat/${s}_T1w.nii.gz

for c in ${cond[@]}; do
  #REGISTRATION OF THE MEAN FUNCTIONAL IMAGE TO THE STRUCTURAL T1 IMAGE, with 6 DOF
  
    #Flirt using the mean image, which was created earlier, prior to temporal filtering
    # interpolation -> by nearest neighbour (as registering a functional image with large voxels, to the structural image (stops image looking smoothed)
    # cost function -> mutal information (whilst this takes longer, when tested it performed better than the other cost functions)
    
    flirt -in ${data_path}/Preproc/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz \
    -ref ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
    -omat ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
    -interp nearestneighbour \
    -out ${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6

 # APPLY THE WARP FIELDS TO TRANSFORM THE FUNCTIONAL TIMESERIES FROM NATIVE TO STANDARD (MNI-152) SPACE
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/${s}-${c}-preproc.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${vol_path}/Registration/$s/${s}-${c}-func2mni.nii.gz
   

# Apply the warp field to the mean functional image, as a quality control check
    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${vol_path}/Registration/$s/${s}-${c}-MEANfunc2mni.nii.gz
done



#SPATIAL SMOOTHING of the normalised image
for c in ${cond[@]}; do
#SPATIAL SMOOTHING of the normalised image
    mkdir -p ${data_path}/Registration/$s/Smoothed/Mean

    fslmaths ${data_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -Tmean ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean

    # Spatial Smoothing 
    # fwhm = 5  2.5 seemed insufficient
    fwhm=5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

    susan ${data_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -1 $sigma 3 1 1 ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean -1 ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -Tmin -bin  ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed-mask0 -odt char

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -mas ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed-mask0 ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz

    imrm ${data_path}/Registration/$s/Smoothed/Mean/${s}-${c}_normfuncmean ${data_path}/Registration/$s/Smoothed/*usan_size.nii.gz ${data_path}/Registration/$s/Smoothed/${s}-${c}-mask0
done

#TEMPORAL FILTERING
    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2 

mkdir -p ${data_path}/Registration/$s/Temp_Filt
for c in ${cond[@]}; do
    line=($(fslhd ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -Tmean ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz

    fslmaths ${data_path}/Registration/$s/Smoothed/${s}-${c}-norm-smoothed.nii.gz -bptf $thp $tlp  -add ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz ${data_path}/Registration/$s/Temp_Filt/${s}-${c}-func2mni_Smoothed_TempFilt.nii.gz
        
    imrm ${data_path}/Registration/$s/Smoothed/${s}-${c}-smoothed_mean.nii.gz
done

}

# Exports the function
export -f volume_processing

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/Brain_States/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'volume_preprocessing {1}' ::: ${s[@]}
