#!/bin/bash

# Define the function
volume_processing () {

mkdir -p $HOME/BrainStates_Test/Volumetric

data_path="$HOME/BrainStates";s=$1
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
    xflirt -in ${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz \
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

 #Produce the inverse warp field to enable MNI to T1
    invwarp --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${vol_path}/Registration/$s/Inverse/${s}-mni2struct_warp \
            --ref=${vol_path}/Registration/$s/Struct/${s}_crop_struct.nii.gz

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

    # Spatial Smoothing of the functional time series
     mkdir -p ${vol_path}/Smoothed/${s}/Mean

     fslmaths ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz -Tmean ${vol_path}/Smoothed/${s}/Mean/${s}-${c}_mean

     fwhm=5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")
     
     susan ${data_path}/Preproc/${s}/${s}-${c}-preproc.nii.gz -1 $sigma 3 1 1 ${vol_path}/Smoothed/${s}/Mean/${s}-${c}_mean -1 ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed
    
     fslmaths ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed.nii.gz -Tmin -bin  ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed-mask0 -odt char
     
     fslmaths ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed.nii.gz -mas ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed-mask0 ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed.nii.gz

    imrm ${vol_path}/Smoothed/${s}/*usan_size.nii.gz ${vol_path}/Smoothed/${s}/${s}-${c}-smoothed-mask0

 # APPLY THE WARP FIELDS TO TRANSFORM THE FUNCTIONAL TIMESERIES FROM NATIVE TO STANDARD (MNI-152) SPACE
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${vol_path}/Smoothed/${s}/${s}-${c}-smoothed.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${vol_path}/Registration/$s/${s}-${c}-func2mni.nii.gz
   

# Apply the warp field to the mean functional image, as a quality control check
    applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/${s}/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz \
   --warp=${vol_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${vol_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat \
   --interp=nn \
   --out=${vol_path}/Registration/$s/${s}-${c}-meanfunc2mni.nii.gz
done



# CONVERT THE RAW SIGNAL TO PERCENTAGE SIGNAL CHANGE
for c in ${cond[@]}; do
mkdir -p ${vol_path}/Percent_Signal_Change/${s}

#Take the mean of the non-filtered functional image
fslmaths ${vol_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -Tmean ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean.nii.gz

#Create a brain mask from the mean functional image
bet ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean-bet.nii.gz -m

# functional image - mean functional image = (func-mean)
fslmaths ${vol_path}/Registration/$s/${s}-${c}-func2mni.nii.gz -sub ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz

# (func-mean)/mean =psc
fslmaths ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz -div ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz

# psc * 100
fslmaths ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz -mul 100 ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz

# apply the brain mask to the psc image
fslmaths ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz -mas ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean-bet_mask.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz

# The notation used above nft = non-temporally filtered and psc = percentage signal change
imrm ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean-bet_mask.nii.gz ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-mean-bet.nii.gz
  
done

#TEMPORAL FILTERING
    # Line --> sets the repetition time from the file header, using fslhd with grep, pixdim4 is the repetiion time variable
        # if using z-shell tr=${line[2]}, if using bash tr=${line[1]}
    # thp -> temporal high pass, expressed as time as multiple of repetition time * 2
    # tlp -> temporal low pass, expressed as time as multiple of repetition time * 2
    
# Restricted Refers to the fitlering at 0.01 to 0.1 Hz

mkdir -p ${vol_path}/Temporally_Filtered/Restricted/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

    fslmaths ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz -bptf $thp $tlp ${vol_path}/Temporally_Filtered/Restricted/${s}/${s}-${c}-func2mni-psc-Rtf.nii.gz
        
done

# Wide Refers to the filtering at 0 to 0.25 Hz

mkdir -p ${vol_path}/Temporally_Filtered/Wide/${s}

for c in ${cond[@]}; do
    line=($(fslhd ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=(-1); tlp=$(bc -l <<< "4/($tr*2)")

    fslmaths ${vol_path}/Percent_Signal_Change/${s}/${s}-${c}-func2mni-psc.nii.gz -bptf $thp $tlp ${vol_path}/Temporally_Filtered/Wide/${s}/${s}-${c}-func2mni-psc-Wtf.nii.gz
        
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
