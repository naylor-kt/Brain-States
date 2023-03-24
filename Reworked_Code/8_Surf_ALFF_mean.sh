#!/bin/bash

# This script will calculate ALFF and fALFF of the mean time series, using a matlab function built for this
surf_ALFFmean () {
data_path="$HOME/BrainStates_Test";s=$1


########## Calculate Mean ALFF on the cortical surface
cond=(as ns vs)
region=(AC HG PT V1)
hemi=(lh rh)


##### Create the mean of ALFF in subject specific space (Unsmoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/Mean
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-fs.txt')" -nojvm
        done
    done


#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/Mean
  
        for c in ${cond[@]};do
        
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-${r}-fs.txt')" -nojvm
            done
        done
    done

##### Create the mean of fALFF in subject specific space (Unsmoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/Mean
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-fs.txt')" -nojvm
        done
    done

#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/Mean
  
        for c in ${cond[@]};do
        
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-${r}-fs.txt')" -nojvm
            done
        done
    done

######### Create the mean of ALFF in fsaverage space (Unsmoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/Mean
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-fsavg.txt')" -nojvm
        done
    done


#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/Mean
  
        for c in ${cond[@]};do
        
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt')" -nojvm
            done
        done
    done

##### Create the mean of fALFF in fsaverage space (Unsmoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/Mean
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-fsavg.txt')" -nojvm
        done
    done


#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/Mean
  
        for c in ${cond[@]};do
        
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt')" -nojvm
            done
        done
    done

########### REPEAT FOR THE SMOOTHED DATA

##### Create the mean of ALFF in subject specific space (Smoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/Mean
    
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-SM-fs.txt')" -nojvm
        done
    done

#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/Mean
  
        for c in ${cond[@]};do
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt')" -nojvm
            done
        done
    done

##### Create the mean of fALFF in subject specific space (Smoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/Mean
    
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-SM-fs.txt')" -nojvm
        done
    done

#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/Mean
  
        for c in ${cond[@]};do
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fs.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt')" -nojvm
            done
        done
    done

##### Create the mean of ALFF in fsaverage space (Smoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/Mean
    
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-ALFF-SM-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-SM-fsavg.txt')" -nojvm
        done
    done

#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/Mean
  
        for c in ${cond[@]};do
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-ALFF-${r}-SM-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt')" -nojvm
            done
        done
    done

##### Create the mean of fALFF in fsaverage space (Smoothed)

#### Whole_Brain
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/Mean
    
    for c in ${cond[@]};do
        
        for h in ${hemi[@]}; do
            
        matlab -batch "freesurfer_startup" -nojvm
        matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/${s}-${c}-${h}-fALFF-SM-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/Whole_Brain/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-SM-fsavg.txt')" -nojvm
        done
    done

#### Individual ROIs
    for r in ${region[@]}; do
    mkdir -p $HOME/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/Mean
  
        for c in ${cond[@]};do
            for h in ${hemi[@]}; do
            
            matlab -batch "freesurfer_startup" -nojvm
            matlab -batch "cd('/Users/mszkcn/Brain_States_Code/Brain-States/MATLAB_CODE'); fsmeanALFF('/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/${s}-${c}-${h}-fALFF-${r}-SM-fsavg.mgz', 'mean', '/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed/${r}/${s}/Mean/${s}-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt')" -nojvm
            done
        done
    done
}

# Exports the function
export -f surf_ALFFmean

# Create an array with subjects (as they are in the RawData file
s=($(ls $HOME/BrainStates_Test/RawData))

# Check the contents of the subject array
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'surf_ALFFmean {1}' ::: ${s[@]}
