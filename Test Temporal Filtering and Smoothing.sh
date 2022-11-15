{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
}

#Define the path
data_path="${HOME}/Brain_States"


for s in `cat ${data_path}/subject_list.txt`; do

#Make the folder
mkdir -p ${data_path}/Filter_Smooth/$s

#Temporal Filtering
line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[2]}; tf=$(bc -l <<< "100/($tr*2)"); tf2=$(bc -l <<< "10/($tr*2)")

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Filter_Smooth/$s/${s}-mean.nii.gz

        fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -bptf $tf $tf2  -add ${data_path}/Filter_Smooth/$s/${s}-mean.nii.gz ${data_path}/Filter_Smooth/$s/${s}-filtered.nii.gz
        
#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Filter_Smooth/$s/${s}-filtered.nii.gz -1 $sigma 3 1 1 ${data_path}/Filter_Smooth/$s/${s}-mean.nii.gz -1 ${data_path}/Filter_Smooth/$s/${s}-smoothed.nii.gz


fslmaths ${data_path}/Filter_Smooth/$s/${s}-smoothed.nii.gz -Tmin -bin  ${data_path}/Filter_Smooth/$s/${s}-mask0 -odt char
fslmaths ${data_path}/Filter_Smooth/$s/${s}-smoothed.nii.gz -mas ${data_path}/Filter_Smooth/$s/${s}-mask0 ${data_path}/Filter_Smooth/$s/${s}-smoothed.nii.gz
imrm ${data_path}/Filter_Smooth/$s/${s}-mean.nii.gz ${data_path}/Filter_Smooth/$s/*usan_size ${data_path}/Filter_Smooth/$s/${s}-mask0

  if [ ! -f ${data_path}/Filter_Smooth/$s/${s}-t12std.nii.gz ]; then

    flirt -in ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat ${data_path}/Filter_Smooth/$s/${s}-t12std.mat -cost mutualinfo -dof 12

    fnirt --in=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
    --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil --aff=${data_path}/Filter_Smooth/$s/${s}-t12std.mat \
    --cout=${data_path}/Filter_Smooth/$s/${s}-t12std_warp --config=T1_2_MNI152_2mm --warpres=10,10,10

    applywarp -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r $FSLDIR/data/standard/MNI152_T1_1mm -o ${data_path}/Filter_Smooth/$s/${s}-t12std.nii.gz \
    -w ${data_path}/Filter_Smooth/$s/${s}-t12std_warp

    invwarp --ref=${data_path}/RawData/$s/anat/${s}_T1w.nii.gz --warp=${data_path}/Filter_Smooth/$s/${s}-t12std_warp --out=${data_path}/Filter_Smooth/$s/${s}-std2t1_warp

    fi


done
       
