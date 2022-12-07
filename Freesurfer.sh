#Define the initial function
free_surfing (){
mkdir -p $HOME/Brain_States/Freesurfer

data_path ="$HOME/Brain_States"

fs_path="$HOME/Brain_States/Freesurfer";s=$1;c=$2

#PREPARE THE T1 IMAGE

# Make a directory for the free surfer files
mkdir -p ${fs_path}Struct/$s

#Robust field of view
robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${fs_path}/Struct/$s/${s}_T1

#Bias Correction
fast -B --nopve ${fs_path}/Struct/$s/${s}_T1

#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${fs_path}/Struct/$s/${s}_T1 -1 $sigma 3 1 0 ${fs_path}/Struct/$s/${s}_T1
#Remove the unecessary files
 imrm ${fs_path}/Struct/$s/${s}_T1_*
 
#APPLY FREESURFER
mkdir mkdir -p ${fs_path}/recon/${s}
mkdir mkdir -p ${fs_path}/registration/${s}

export SUBJECTS_DIR="${data_path}/Freesurfer"

 if [ ! -d $SUBJECTS_DIR/${s} ]; then

        mkdir -p $SUBJECTS_DIR

        recon-all -i ${fs_path}/Struct/$s/${s}_T1 -s ${s} -all

    fi
    
    if [ ! -f $pth/reg/mean2fs.lta ]; then

        # obtain registration from t1 (fsl) to orig (fs) & concatenate with mean2t1;

        tkregister2 --mov ${fs_path}/Struct/$s/${s}_T1 --targ $SUBJECTS_DIR/${s}/mri/orig.mgz --s ${s} \

        --reg ${fs_path}/registration/${s}/${s}_fsl2fs.dat --ltaout ${fs_path}/registration/${s}/${s}_fsl2fs.lta --noedit --regheader

        lta_convert --inlta ${fs_path}/registration/${s}/${s}_fsl2fs.lta --outfsl ${fs_path}/registration/${s}/${s}_fsl2fs.mat

        convert_xfm -omat ${fs_path}/registration/${s}/${s}_${c}_mean2fs.mat -concat ${fs_path}/registration/${s}/${s}_fsl2fs.mat ${data_path}/Registration/$s/${s}-${c}-meanfunc2struct.mat

        lta_convert --infsl ${fs_path}/registration/${s}/${s}_${c}_mean2fs.mat --outreg ${fs_path}/registration/${s}/${s}_${c}_mean2fs.dat --outlta $pth/reg/mean2fs.lta \

        --subject $subj --src ${data_path}/Registration/$s/Mean_Before_Filter/${s}-${c}_mean_func.nii.gz --trg $SUBJECTS_DIR/$subj/mri/orig.mgz

    fi
    
}



export -f free_surfing

s=($(ls $HOME/Brain_States/RawData))
c=(ns vs as)

parallel --jobs 6 'free_surfing {1}' ::: ${s[@]} ::: ${c[@]}




    


