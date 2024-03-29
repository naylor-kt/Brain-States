#!/bin/bash

ALFF () {

data_path="$HOME/BrainStates_Test";s=$1

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates_Test/Analysis"
mask_path="$HOME/BrainStates_Test/Mask"

cond=(as ns vs)
hemi=(lh rh)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)


#Calculation of ALFF

mkdir -p ${analysis_path}/ALFF/Whole_Brain/${s}/

for c in ${cond[@]}; do
        
   fslmaths ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -Tstd ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF
   
   fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -M > ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-meanALFF.txt
   
   fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -S > ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-stdALFF.txt
done

# Calculation of fALFF
    # Step 1 - calculate ALFF of the wide (0-0.25Hz) Filtered data
    # Step 2 - divide Alff(0.01-0.1) by ALFF (0-0.25Hz)
    
mkdir -p ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/
    
for c in ${cond[@]}; do

    fslmaths ${preproc_path2}/Temporally_Filtered/Wide/${s}/${s}-${c}-psc-Wtf.nii.gz -Tstd ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz
     
        
    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -div ${analysis_path}/fALFF/Whole_Brain/${s}/Wide_Filtered_SD/${s}-${c}-Wtf-SD.nii.gz ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz

    fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -M > ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-meanfALFF.txt
    
    fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -S > ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-stdfALFF.txt
done


# Masked ALFF for the auditory cortex regions
for r in ${region[@]}; do
    mkdir -p ${analysis_path}/ALFF/${r}/${s}/
   
    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}

    fslstats ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r} -M > ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-meanALFF-${r}.txt
    
    fslstats ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-ALFF-${r} -S > ${analysis_path}/ALFF/${r}/${s}/${s}-${c}-stdALFF-${r}.txt
    done
done

# Masked ALFF for the auditory cortex regions (lh or rh)

for r in ${region[@]}; do
    for h in ${hemi[@]}; do
    mkdir -p ${analysis_path}/ALFF/${r}/${h}/${s}/
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_${r}mask2func-bin-${h} ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-${h}
        
        fslstats ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-${h} -M > ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-meanALFF-${r}-${h}.txt
        
        fslstats ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-${h} -S > ${analysis_path}/ALFF/${r}/${h}/${s}/${s}-${c}-stdALFF-${r}-${h}.txt

        done
    done
done

                              

# Masked fALFF for the auditory cortex regions

for r in ${region[@]};do
    mkdir -p ${analysis_path}/fALFF/${r}/${s}/
    
    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}

    fslstats ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r} -M > ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-meanfALFF-${r}.txt
    
    fslstats ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-fALFF-${r} -S > ${analysis_path}/fALFF/${r}/${s}/${s}-${c}-stdfALFF-${r}.txt
    
    done
done

# Masked fALFF for the auditory cortex regions (lh or rh)

for r in ${region[@]}; do
    for h in ${hemi[@]}; do
    
    mkdir -p ${analysis_path}/fALFF/${r}/${h}/${s}/

        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Func_Mask/${h}/bin/${s}/${s}-${c}_${r}mask2func-bin-${h} ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-${h}
        
        fslstats ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-${h} -M > ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-meanfALFF-${r}-${h}.txt
        
        fslstats ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-${h} -S > ${analysis_path}/fALFF/${r}/${h}/${s}/${s}-${c}-stdfALFF-${r}-${h}.txt
        done
    done
done
######## Repeat for the Grey Matter Masks

# Masked ALFF for the auditory cortex regions
for r in ${region_2[@]}; do
    mkdir -p ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}
    
    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey

    fslstats ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey -M > ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-meanALFF-${r}-grey.txt
    
    fslstats ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey -S > ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-stdALFF-${r}-grey.txt
    done
done

# Masked ALFF for the auditory cortex regions (lh or rh)

for r in ${region_2[@]}; do
    for h in ${hemi[@]}; do
    mkdir -p ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-${r}-grey_funcmask-${h}.nii.gz ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-grey-${h}
        
        fslstats ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-grey-${h} -M > ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-meanALFF-${r}-grey-${h}.txt
        
        fslstats ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-ALFF-${r}-grey-${h} -S > ${analysis_path}/ALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-stdALFF-${r}-grey-${h}.txt
        done
    done
done

                              

# Masked fALFF for the auditory cortex regions

for r in ${region_2[@]};do
       mkdir -p ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}
    
    for c in ${cond[@]}; do

    fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey

    fslstats ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey -M > ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-meanfALFF-${r}-grey.txt
    
    fslstats ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey -S > ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-stdfALFF-${r}-grey.txt
    done
done

# Masked fALFF for the auditory cortex regions (lh or rh)

for r in ${region_2[@]}; do
    for h in ${hemi[@]}; do
    
    mkdir -p ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}

        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-${r}-grey_funcmask-${h}.nii.gz ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-grey-${h}
        
        fslstats ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-grey-${h} -M > ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-meanfALFF-${r}-grey-${h}.txt
        
        fslstats ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-fALFF-${r}-grey-${h} -S > ${analysis_path}/fALFF/Grey_Matter_ROIs/${r}/${h}/${s}/${s}-${c}-stdfALFF-${r}-grey-${h}.txt

        done
    done
done
}

export -f ALFF

# Create an array with subjects (as they are in the RawData file
#s=($(ls $HOME/BrainStates/RawData))
s=(sub-06)

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'ALFF {1}' ::: ${s[@]}


### Create a Z-Transformed version of ALFF and fALFF

#subj=($(ls $HOME/BrainStates/RawData))
subj=(sub-06)


for s in ${subj[@]}; do
    for c in ${cond[@]}; do
        mkdir -p ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}
        mkdir -p ${analysis_path}/Z-Transformed/fALFF/Whole_Brain/${s}
        
  # Create a Z-Transformed version of ALFF
        meanALFF=($(fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz -M))
        stdALFF=($(fslstats ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF.nii.gz -S))
        
        fslmaths ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF -sub ${meanALFF} ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z.nii.gz
        
        fslmaths ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z.nii.gz -div ${stdALFF} ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z.nii.gz
        
        fslstats ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z.nii.gz -M > ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Zmean.txt
        
    # Create a Z-Transformed version of fALFF
        meanfALFF=($(fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz -M))
        stdfALFF=($(fslstats ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz -S))
        
        fslmaths ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF.nii.gz -sub ${meanfALFF} ${analysis_path}/Z-Transformed/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-Z.nii.gz
        
        fslmaths ${analysis_path}/Z-Transformed/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-Z.nii.gz -div ${stdfALFF} ${analysis_path}/Z-Transformed/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-Z.nii.gz
        
        fslstats ${analysis_path}/Z-Transformed/fALFF/Whole_Brsin/${s}/${s}-${c}-fALFF-Z.nii.gz -M > ${analysis_path}/Z-Transformed/fALFF/Whole_Brsin/${s}/${s}-${c}-fALFF-Zmean.txt
    done
       
  # Masked ALFF and fALFF for the auditory cortex regions
    for r in ${region[@]}; do
        mkdir -p ${analysis_path}/Z-Transformed/ALFF/${r}/${s}
        mkdir -p ${analysis_path}/Z-Transformed/fALFF/${r}/${s}
        
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z -mas ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin ${analysis_path}/Z-Transformed/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}-Z
        
        fslstats ${analysis_path}/Z-Transformed/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}-Z -M > ${analysis_path}/Z-Transformed/ALFF/${r}/${s}/${s}-${c}-ALFF-${r}-Zmean.txt
        
        fslmaths ${analysis_path}/Z-Transformed/fALFF/Whole_Brsin/${s}/${s}-${c}-fALFF-Z.nii.gz -mas ${mask_path}/Func_Mask/bin/${s}/${s}-${c}_${r}mask2func-bin ${analysis_path}/Z-Transformed/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}-Z
        
        fslstats ${analysis_path}/Z-Transformed/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}-Z -M > ${analysis_path}/Z-Transformed/fALFF/${r}/${s}/${s}-${c}-fALFF-${r}-Zmean.txt
    
        done
    done
       
   # Masked ALFF for the auditory cortex regions
    for r in ${region_2[@]}; do
                mkdir -p ${analysis_path}/Z-Transformed/ALFF/Grey_Matter_ROIs/${r}/${s}
                mkdir -p ${analysis_path}/Z-Transformed/fALFF/Grey_Matter_ROIs/${r}/${s}
    
        for c in ${cond[@]}; do

        fslmaths ${analysis_path}/Z-Transformed/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-Z.nii.gz -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz ${analysis_path}/Z-Transformed/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey-Z

        fslstats ${analysis_path}/Z-Transformed/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey-Z -M > ${analysis_path}/Z-Transformed/ALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ALFF-${r}-grey-Zmean.txt
    
        fslmaths ${analysis_path}/Z-Transformed/fALFF/Whole_Brsin/${s}/${s}-${c}-fALFF-Z.nii.gz -mas ${mask_path}/Segmentation/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz ${analysis_path}/Z-Transformed/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey-Z

        fslstats ${analysis_path}/Z-Transformed/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey-Z -M > ${analysis_path}/Z-Transformed/fALFF/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-fALFF-${r}-grey-Zmean.txt
           
        done
    done
done
