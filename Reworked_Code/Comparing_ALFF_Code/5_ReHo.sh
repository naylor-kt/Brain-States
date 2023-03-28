#!/bin/bash
REHO () {

data_path="$HOME/BrainStates_Test";s=$1
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"

mkdir -p /Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ReHo
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
reho_path="/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ReHo"
func_mask="/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Mask/Func_Mask/binarised"



cond=(as ns vs)
neighbourhood=(19)
hemi=(lh rh)

#Calculation of ReHo
for r in `cat ${mask_path}/Region_List.txt`; do

    for c in ${cond[@]}; do
        for n in ${neighbourhood[@]}; do
        
            mkdir -p ${reho_path}/ReHo_${n}/${r}/${s}
        
            3dReHo -prefix ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-ReHo-${n}.nii.gz \
                       -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                       -nneigh ${n} \
                       -mask ${func_mask}/${r}/${s}/${s}-${c}-${r}-funcmask-bin.nii.gz
                
            fslstats ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-ReHo-${n}.nii.gz -M > ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-meanReHo-${n}.txt
            
            imrm ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-ReHo-${n}.nii.gz
        
            for h in ${hemi[@]}; do
        
            3dReHo -prefix ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-${h}-ReHo-${n}.nii.gz \
                       -inset ${preproc_path2}/Temporally_Filtered/Restricted/${s}/${s}-${c}-psc-Rtf.nii.gz \
                       -nneigh ${n} \
                       -mask ${func_mask}/${r}/${s}/${s}-${c}-${r}-funcmask-bin-${h}.nii.gz
                
            fslstats ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-${h}-ReHo-${n}.nii.gz -M > ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-${h}-meanReHo-${n}.txt
            
            imrm ${reho_path}/ReHo_${n}/${r}/${s}/${s}-${c}-${r}-${h}-ReHo-${n}.nii.gz
            
            done
        done
    done
done
    
}

export -f REHO


s=($(ls $HOME/BrainStates_Test/RawData))

echo ${s[@]}

# Runs the analysis in parallel using GNU parallel
# Jobs is set to 0, which allows parallel to assign the jobs as it sees fit, and divide it across the CPUs itself
# Provide it with the name of the function, and specify it will take one argument, then provide this after the three colons

parallel --jobs 0 'REHO {1}' ::: ${s[@]}
