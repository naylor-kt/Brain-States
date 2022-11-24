
#Define the path
data_path="${HOME}/Brain_States"


for s in `cat ${data_path}/subject_list.txt`; do

#Temporal Filtering
line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[2]}; tf=$(bc -l <<< "100/($tr*2)"); tf2=$(bc -l <<< "10/($tr*2)")

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -bptf $tf $tf2  -add ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz
        
#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Preproc/$s/${s}-preproc.nii.gz -1 $sigma 3 1 1 ${data_path}/Preproc/$s/${s}-mean.nii.gz -1 ${data_path}/Preproc/$s/${s}-preproc.nii.gz


fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmin -bin  ${data_path}/Preproc/$s/${s}-mask0 -odt char
fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -mas ${data_path}/Preproc/$s/${s}-mask0 ${data_path}/Preproc/$s/${s}-preproc.nii.gz

imrm ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/*usan_size.nii.gz ${data_path}/Preproc/$s/${s}-mask0

<<<<<<< HEAD
# Registration of structural image to MNI Space
  mkdir -p ${data_path}/Registration/$s
  
  if [ ! -f ${data_path}/Registration/$s/${s}-t12std.nii.gz ]; then
    
    
    # Register the structural image to MNI
    
    #1) Brain extract the structural image
    bet ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz ${data_path}/Registration/$s/${s}-struct_betted.nii.gz -f 0.25
    
    #2) Use flirt with the brain extracted structural image and MNI-152 standard
    flirt -in ${data_path}/Registration/$s/${s}-struct_betted.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat ${data_path}/Registration/$s/${s}-struct2mni.mat \
    -cost mutualinfo \
    -dof 12

    #3) Use fnirt with the structural image and MNI152
    fnirt --in=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${data_path}/Registration/$s/${s}-struct2mni.mat \
          --cout=${data_path}/Registration/$s/${s}-struct2mni_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10
    
    #4) Apply the warp parameters to save the structural image which has been warped to MNI152 space
    applywarp -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
    -o ${data_path}/Registration/$s/${s}-struct2mni.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${data_path}/Registration/$s/${s}-struct2mni_warp

    #5) Produce in the inverse warp image for quality control
    invwarp --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
            --out=${data_path}/Registration/$s/${s}-mni2struct_warp \
            --ref=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz

    
    # Register the functional image to the structural image
    # A) Produce the mean functional image
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz
    
    # B) Use flirt with the mean functional image, with the betted structural image as a reference
    # This is rigid body transformation therefore use 6 degrees of freedom
    flirt -in ${data_path}/Preproc/$s/${s}-mean.nii.gz \
    -ref ${data_path}/Registration/$s/${s}-struct_betted.nii.gz \
    -omat ${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
    -out ${data_path}/Registration/$s/${s}-meanfunc2struct.nii.gz \
    -cost mutualinfo \
    -dof 6

    # C) Apply the warp field to transform the functional image into MNI152 space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=${data_path}/Preproc/$s/${s}-preproc.nii.gz \
   --warp=${data_path}/Registration/$s/${s}-struct2mni_warp \
   --premat=${data_path}/Registration/$s/${s}-meanfunc2struct.mat \
   --out=${data_path}/Registration/$s/${s}-func2mni.nii.gz \

    fi
done
