
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

  mkdir -p ${data_path}/Registration/$s
  
  if [ ! -f ${data_path}/Registration/$s/${s}-t12std.nii.gz ]; then

    flirt -in ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat ${data_path}/Registration/$s/${s}-t12std.mat \
    -cost mutualinfo \
    -dof 12

    fnirt --in=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=${data_path}/Registration/$s/${s}-t12std.mat \
          --cout=${data_path}/Registration/$s/${s}-t12std_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz \
    -o ${data_path}/Registration/$s/${s}-t12std.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w ${data_path}/Registration/$s/${s}-t12std_warp

    invwarp --warp=${data_path}/Registration/$s/${s}-t12std_warp \
            --out=${data_path}/Registration/$s/${s}-std2t1_warp \
            --ref=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz

    fi
done
