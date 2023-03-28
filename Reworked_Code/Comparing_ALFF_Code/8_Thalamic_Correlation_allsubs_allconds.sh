#!/bin/bash
data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"
thal_corr="$HOME/BrainStates_Test/Comparing_ALFF_Types/Thalmic_Correlation"
mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions
cc_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions"

cond=(as ns vs)
hemi=(lh rh)

##### Create a text file for all subs in each condition
            
########### ALFF

for c in ${cond[@]}; do
 for r in `cat ${mask_path}/Region_List.txt`; do

    cat ${thal_corr}/Correlation/${r}/sub-01/sub-01-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-02/sub-02-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-03/sub-03-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-04/sub-04-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-05/sub-05-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-06/sub-06-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-07/sub-07-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-08/sub-08-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-09/sub-09-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-10/sub-10-${c}-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/sub-11/sub-11-${c}-${r}-corr2Thalamus.txt > ${thal_corr}/Correlation/${r}/allsubs-${c}-${r}-corr2Thalamus.txt

    
        for h in ${hemi[@]}; do
                    
           cat ${thal_corr}/Correlation/${r}/sub-01/sub-01-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-02/sub-02-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-03/sub-03-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-04/sub-04-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-05/sub-05-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-06/sub-06-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-07/sub-07-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-08/sub-08-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-09/sub-09-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-10/sub-10-${c}-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/sub-11/sub-11-${c}-${r}-corr2Thalamus-${h}.txt > ${thal_corr}/Correlation/${r}/allsubs-${c}-${r}-corr2Thalamus-${h}.txt
        done
    done
done
    

# Create a text file to compare across conditions (ns vs as)

 for r in `cat ${mask_path}/Region_List.txt`; do
    mkdir -p ${cc_path}/Thalamic_Correlation/Bilateral
    
    paste ${data_path}/subj_list.txt ${thal_corr}/Correlation/${r}/allsubs-ns-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/allsubs-vs-${r}-corr2Thalamus.txt ${thal_corr}/Correlation/${r}/allsubs-as-${r}-corr2Thalamus.txt | column -s $'\t' -t > ${cc_path}/Thalmic_Correlation/Bilateral/allsubs-${r}-ns-vs-as-corr2thalamus.txt

    
    for h in ${hemi[@]}; do
    
        mkdir -p ${cc_path}/Thalmic_Correlation/${h}
        
        paste ${data_path}/subj_list.txt ${thal_corr}/Correlation/${r}/allsubs-ns-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/allsubs-vs-${r}-corr2Thalamus-${h}.txt ${thal_corr}/Correlation/${r}/allsubs-as-${r}-corr2Thalamus-${h}.txt | column -s $'\t' -t > ${cc_path}/Thalmic_Correlation/${h}/allsubs-${r}-${h}-ns-vs-as-corr2thalamus.txt

    done
done 
