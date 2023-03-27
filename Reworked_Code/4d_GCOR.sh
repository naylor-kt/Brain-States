#!/bin/bash

# This script will calculate GCOR of the whole brain, using a matlab function built for this
# Written by Anissa, and adapted to work with my code

data_path="$HOME/BrainStates_Test";s=$1
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
analysis_path="$HOME/BrainStates_Test/Analysis"

mkdir -p $HOME/BrainStates_Test/log
log_path="$HOME/BrainStates_Test/log"

subj=($(ls $HOME/BrainStates_Test/RawData))
cond=(as ns vs)

mkdir -p ${analysis_path}/GCOR
gcor_path="${analysis_path}/GCOR"



for s in ${subj[@]}; do
	mkdir -p ${analysis_path}/GCOR/WholeBrain/${s}

	dim1=$(fslval ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz dim1)
	dim2=$(fslval ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz dim2)
	dim3=$(fslval ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz dim3)
	M=$((dim1*dim2*dim3))

	N=$(fslval ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz dim4)

	# Get U >> the unit variance time series, by subtracting time series data
	# with the mean of time series and divide by the standard deviation of the time
	# series
	
	fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tmean ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_mean.nii.gz

	fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tstd ${gcor_path}/wholeBrain/${s}/${s}-${c}_WholeBrain_std.nii.gz

	fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -sub ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_mean.nii.gz -div ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_std.nii.gz ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_demeaned.nii.gz

	## Remove temporary files
		rm ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_mean.nii.gz ${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_std.nii.gz

	matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); calc_gcor('${M}', '${N}','${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_demeaned.nii.gz', '${gcor_path}/WholeBrain/${s}/${s}-${c}_WholeBrain_GCORmap.nii')" -nojvm

	gzip ${gcor_path}/WholeBrain/${s}/${s}_WholeBrain_GCORmap.nii


	# Checkpoint for taking ALFF of mean time series
	echo "${s} ${c} GCOR from the whole brain has been performed in matlab" >> ${log_path}/4d_volAnalysis_gcor_matlab_LOG.txt

done
