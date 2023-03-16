#!/bin/bash
REHO () {

data_path="$HOME/BrainStates_Test";s=$1
mkdir -p $HOME/BrainStates_Test/Analysis/ReHo

preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
preproc_path3="$HOME/BrainStates_Test/Preproc/Level_3"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"
mask_path="$HOME/BrainStates_Test/Mask/Func_Mask"
seg_mask_path="$HOME/BrainStates_Test/Mask/Segmentation/Grey_Matter_ROIs"


cond=(as ns vs)
neighbourhood=(7 19 27)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)


#Calculation of ReHo
    for c in ${cond[@]}; do
        for n in ${neighbourhood[@]}; do
        
        mkdir -p ${reho_path}/ReHo_${n}/Whole_Brain/${s}
        
        3dReHo -prefix ${reho_path}/ReHo_${n}/Whole_Brain/${s}/${s}-${c}-ReHo-${n}.nii.gz -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz -nneigh ${n}
        
        
            for r in ${region[@]}; do
                
                mkdir -p ${reho_path}/ReHo_${n}/${r}/${s}
        
                3dReHo -prefix ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-ReHo-${n}-${r}.nii.gz \
                       -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                       -nneigh ${n} \
                       -mask ${mask_path}/bin/${s}/${s}-${c}_${r}mask2func-bin.nii.gz
                
                fslstats ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-ReHo-${n}-${r}.nii.gz -M > ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-meanReHo-${n}-${r}.txt
            done
            
            for r in ${region_2[@]}; do
            
                mkdir -p ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/${s}
                
                3dReHo -prefix ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ReHo-${n}-${r}-grey.nii.gz \
                       -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                       -nneigh ${n} \
                       -mask ${seg_mask_path}/${r}/${s}/${s}-${c}-${r}-grey_funcmask.nii.gz
                
                fslstats ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-ReHo-${n}-${r}-grey.nii.gz -M > ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/${s}/${s}-${c}-meanReHo-${n}-${r}-grey.txt
            done
        done
    done
}

export -f REHO


#s=($(ls $HOME/BrainStates/RawData))
s=(sub-06)
echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'REHO {1}' ::: ${s[@]}
