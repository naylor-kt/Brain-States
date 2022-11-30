# Test of different cost functions in flirt
# requires a test folder called B-Test
#In this folder should be the image which has undergone the initial preprocessing steps AND the T1-w structural image

# STEP 1 - take the mean of the functional image
# NB this time series has undergone the initial preprocessing steps (removal of 10 vol, motion and distortion correction)

cd /Users/mszkcn/B-Test

fslmaths sub-01-preproc.nii.gz -Tmean sub-01-func-mean.nii.gz

# STEP 2 Temporally filter the data

line=($(fslhd sub-01-preproc.nii.gz | grep pixdim4)); tr=${line[2]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")

fslmaths sub-01-preproc.nii.gz -bptf $thp $tlp  -add sub-01-func-mean.nii.gz sub-01-preproc-filtered.nii.gz
        
# STEP 3 - Take the robust FOV of the structural T1 image

robustfov -i sub-01_T1w.nii.gz -r sub-01_T1w-cropped.nii.gz

# STEP 4- Use flirt with the structural image and MNI space
mkdir /Users/mszkcn/B-Test/struct2mni

#Flirt using Corratio
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-corratio.mat \
    -dof 12

#Flirt using Mutual Information
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-mututalinfo.mat \
    -cost mutualinfo \
    -dof 12

#Flirt using normmi
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-normmi.mat \
    -cost normmi \
    -dof 12

#Flirt using normmi
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-normmi.mat \
    -cost normmi \
    -dof 12

#Flirt using labeldiff
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-labeldiff.mat \
    -cost labeldiff \
    -dof 12

#Flirt using lestsq
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-lstsq.mat \
    -cost leastsq \
    -dof 12

#Flirt using normcorr
flirt -in sub-01_T1w-cropped.nii.gz \
    -ref $FSLDIR/data/standard/MNI152_T1_2mm \
    -omat /Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-normc.mat \
    -cost normcorr \
    -dof 12

# Use fnirt and apply warp
mkdir /Users/mszkcn/B-Test/struct2mni/images

# With Corratio mat
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-corratio.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_corration_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp

# With Mutualinfo
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-mututalinfo.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_mutualinfo_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_mutualinfo_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_mutualinfo_warp

# With normmi
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-normmi.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_normmi_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_normmi_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_normmi_warp

# With labeldiff
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-labeldiff.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_labeldiff_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_labeldiff_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_labeldiff_warp

# With least squares
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-lstsq.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_lstsq_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_lstsq_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_lstsq_warp
          
# With normcorr
    fnirt --in=sub-01_T1w-cropped.nii.gz \
          --ref=$FSLDIR/data/standard/MNI152_T1_2mm \
          --refmask=$FSLDIR/data/standard/MNI152_T1_2mm_brain_mask_dil \
          --aff=/Users/mszkcn/B-Test/struct2mni/sub-01-struct2mni-normc.mat \
          --cout=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_normcorr_warp \
          --config=T1_2_MNI152_2mm \
          --warpres=10,10,10

    applywarp -i sub-01_T1w-cropped.nii.gz \
    -o /Users/mszkcn/B-Test/struct2mni/images/sub-01-s2m_normcorr_reg.nii.gz \
    -r $FSLDIR/data/standard/MNI152_T1_1mm \
    -w /Users/mszkcn/B-Test/struct2mni/sub-01-s2m_normcorr_warp \


# NOW TO TEST THE REISTRATION OF THE FUNCTIONAL TO THE STRUCTURAL IMAGE

# Using Corratio
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-corratio.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-corratio.nii.gz \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-corratio.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-corratio.nii.gz
   
# Using mutualinfo
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-mutualinfo.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-mutualinfo.nii.gz \
    -cost mutualinfo \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-mutualinfo.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-mutualinfo.nii.gz
   
# Using normmi
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-normmi.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-normmi.nii.gz \
    -cost normmi \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-normmi.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-normmi.nii.gz

# Using labeldiff
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-labeldiff.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-labeldiff.nii.gz \
    -cost labeldiff \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-labeldiff.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-labeldiff.nii.gz

# Using least squares --> this shouldn't work and therefore is a good test
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-lstsq.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-lstsq.nii.gz \
    -cost leastsq \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-lstsq.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-lstsq.nii.gz
   
# Using normcorr --> this shouldn't work and therefore is a good test
    flirt -in sub-01-func-mean.nii.gz \
    -ref sub-01_T1w-cropped.nii.gz \
    -omat sub-01-mf2struct-normcorr.mat \
    -out /Users/mszkcn/B-Test/struct2mni/images/sub-01-mf2struct-normcorr.nii.gz \
    -cost leastsq \
    -dof 6

# Apply the warp field, to register the functional image to the MNI space
   applywarp --ref=${FSLDIR}/data/standard/MNI152_T1_2mm \
   --in=sub-01-preproc.nii.gz \
   --warp=/Users/mszkcn/B-Test/struct2mni/sub-01-s2m_corratio_warp \
   --premat=sub-01-mf2struct-normcorr.mat \
   --out=/Users/mszkcn/B-Test/struct2mni/images/sub-01-f2mni-normcorr.nii.gz
