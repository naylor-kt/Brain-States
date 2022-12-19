#Define the initial function
free_surfing (){
mkdir -p $HOME/Brain_States/Freesurfer

data_path="$HOME/Brain_States"

fs_path="$HOME/Brain_States/Freesurfer";s=$1

#PREPARE THE T1 IMAGE

# Make a directory for the free surfer files
mkdir -p ${fs_path}/Struct/$s

#Copy of the T1 image which had previously undergone robust fov
cp ${data_path}/Registration/${s}/Struct/${s}_crop_struct.nii.gz ${fs_path}/Struct/$s/${s}_T1.nii.gz

#Bias Correction
fast -B --nopve ${fs_path}/Struct/$s/${s}_T1.nii.gz

#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${fs_path}/Struct/$s/${s}_T1_restore -1 $sigma 3 1 0 ${fs_path}/Struct/$s/${s}_T1

#Remove the unecessary files
imrm ${fs_path}/Struct/$s/${s}_T1_*

#APPLY FREESURFER

mkdir -p ${fs_path}/Recon


export SUBJECTS_DIR="${fs_path}/Recon"

 if [ ! -d $SUBJECTS_DIR/${s} ]; then

        recon-all -i ${fs_path}/Struct/$s/${s}_T1.nii.gz -s ${s} -all

fi

}

export -f free_surfing
s=($(ls $HOME/Brain_States/RawData))
echo ${s[@]}
parallel --jobs 0 'free_surfing {1}' ::: ${s[@]}


subj=($(ls $HOME/Brain_States/RawData))
cond=(as ns vs)

for s in ${subj[@]}; do
mkdir -p ${fs_path}/Registration/${s}

    for c in ${cond[@]}; do
#Make for loop for condition instead, just to be sure of preprocessing problem
    
        if [ ! -f $pth/reg/${s}-${c}_mean2fs.lta ]; then

        # obtain registration from t1 (fsl) to orig (fs) & concatenate with mean2t1;

        tkregister2 --mov ${fs_path}/Struct/$s/${s}_T1 --targ $SUBJECTS_DIR/${s}/mri/orig.mgz --s ${s} \
        --reg ${fs_path}/Registration/${s}/${s}_fsl2fs.dat --ltaout ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --noedit --regheader

        lta_convert --inlta ${fs_path}/Registration/${s}/${s}_fsl2fs.lta --outfsl ${fs_path}/Registration/${s}/${s}_fsl2fs.mat

        convert_xfm -omat ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat -concat ${fs_path}/Registration/${s}/${s}_fsl2fs.mat ${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat

        lta_convert --infsl ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.mat --outreg ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.dat --outlta ${fs_path}/Registration/${s}/${s}-${c}_mean2fs.lta \
        --subject ${s} --src ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz --trg $SUBJECTS_DIR/$subj/mri/orig.mgz
        fi
    done
done






    


