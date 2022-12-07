#Define the initial function
free_surfer (){

data_path="$HOME/Brain_States";s=$1

#PREPARE THE T1 IMAGE

# Make a directory for the free surfer files
mkdir -p ${data_path}/Freesurfer/$s

#Robust field of view
robustfov -i ${data_path}/RawData/$s/anat/${s}_T1w.nii.gz -r ${data_path}/Freesurfer/$s/Struct/${s}_T1

#Bias Correction
fast -B --nopve ${data_path}/Freesurfer/$s/Struct/${s}_T1

#Spatial Smoothing
fwhm=2.5; sigma=$(bc -l <<< "$fwhm/(2*sqrt(2*l(2)))")

susan ${data_path}/Freesurfer/$s/Struct/${s}_T1 -1 $sigma 3 1 0 ${data_path}/Freesurfer/$s/Struct/${s}_T1
#Remove the unecessary files
 imrm $${data_path}/Freesurfer/$s/Struct/${s}_T1_*
 
#APPLY FREESURFER
mkdir mkdir -p ${data_path}/Freesurfer/recon

export SUBJECTS_DIR="${data_path}/Freesurfer/recon"

 if [ ! -d $SUBJECTS_DIR/$s ]; then

        mkdir -p $SUBJECTS_DIR

        recon-all -i ${data_path}/Freesurfer/$s/Struct/${s}_T1 -s $s -all

    fi
}

export -f free_surfer

s=($(ls $HOME/Brain_States/RawData))

parallel --jobs 6 'free_surfer {1}' ::: ${s[@]}
