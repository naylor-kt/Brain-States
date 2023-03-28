#!/bin/bash
data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"
reho_path="/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/ReHo"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions
cc_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions"

cond=(as ns vs)
hemi=(lh rh)

##### Create a text file for all subs in each condition

########### ALFF

for c in ${cond[@]}; do
 for r in `cat ${mask_path}/Region_List.txt`; do

    cat ${reho_path}/ReHo_19/${r}/sub-01/sub-01-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-02/sub-02-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-03/sub-03-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-04/sub-04-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-05/sub-05-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-06/sub-06-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-07/sub-07-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-08/sub-08-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-09/sub-09-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-10/sub-10-${c}-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-11/sub-11-${c}-${r}-meanReHo-19.txt > ${reho_path}/ReHo_19/${r}/allsubs-${c}-${r}-meanReHo-19.txt

    
        for h in ${hemi[@]}; do
    
           cat ${reho_path}/ReHo_19/${r}/sub-01/sub-01-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-02/sub-02-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-03/sub-03-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-04/sub-04-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-05/sub-05-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-06/sub-06-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-07/sub-07-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-08/sub-08-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-09/sub-09-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-10/sub-10-${c}-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/sub-11/sub-11-${c}-${r}-${h}-meanReHo-19.txt > ${reho_path}/ReHo_19/${r}/allsubs-${c}-${r}-${h}-meanReHo-19.txt
        done
    done
done
    

# Create a text file to compare across conditions (ns vs as)

 for r in `cat ${mask_path}/Region_List.txt`; do
    mkdir -p ${cc_path}/Mean_ReHo/Bilateral
    
    paste ${data_path}/subj_list.txt ${reho_path}/ReHo_19/${r}/allsubs-ns-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/allsubs-vs-${r}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/allsubs-as-${r}-meanReHo-19.txt | column -s $'\t' -t > ${cc_path}/Mean_ReHo/Bilateral/allsubs-${r}-ns-vs-as-meanReHo-19.txt

    
    for h in ${hemi[@]}; do
    
        mkdir -p ${cc_path}/Mean_ReHo/${h}
        
        paste ${data_path}/subj_list.txt ${reho_path}/ReHo_19/${r}/allsubs-ns-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/allsubs-vs-${r}-${h}-meanReHo-19.txt ${reho_path}/ReHo_19/${r}/allsubs-as-${r}-${h}-meanReHo-19.txt | column -s $'\t' -t > ${cc_path}/Mean_ReHo/${h}/allsubs-${r}-${h}-ns-vs-as-meanReHo-19.txt

    done
done 
