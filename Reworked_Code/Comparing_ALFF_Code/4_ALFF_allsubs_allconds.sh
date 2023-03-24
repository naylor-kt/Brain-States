#!/bin/bash
cond=(as ns vs)

data_path="$HOME/BrainStates_Test"
preproc_path1="$HOME/BrainStates_Test/Preproc/Level_1"
preproc_path2="$HOME/BrainStates_Test/Preproc/Level_2"
vol_path="$HOME/BrainStates_Test/Volumetric"
mask_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Mask"
T1_mask="${mask_path}/T1_Mask"
func_mask="${mask_path}/Func_Mask"
ALFF_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF"
alt_ALFF="$HOME/BrainStates_Test/Comparing_ALFF_Types/ALFF_of_Mean/ALFF_MTS"

mkdir -p $HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions
cc_path="$HOME/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions"



##### Create a text file for all subs in each condition

########### ALFF

for c in ${cond[@]}; do
 for r in `cat ${mask_path}/Region_List.txt`; do

    cat ${ALFF_path}/${r}/sub-01/sub-01-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-02/sub-02-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-03/sub-03-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-04/sub-04-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-05/sub-05-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-06/sub-06-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-07/sub-07-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-08/sub-08-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-09/sub-09-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-10/sub-10-${c}-${r}-meanALFF.txt ${ALFF_path}/${r}/sub-11/sub-11-${c}-${r}-meanALFF.txt > ${ALFF_path}/${r}/allsubs-${c}-${r}-meanALFF.txt


    cat ${alt_ALFF}/${r}/sub-01/sub-01-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-02/sub-02-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-03/sub-03-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-04/sub-04-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-05/sub-05-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-06/sub-06-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-07/sub-07-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-08/sub-08-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-09/sub-09-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-10/sub-10-${c}-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-11/sub-11-${c}-${r}-MTS-ALFF.txt > ${alt_ALFF}/${r}/allsubs-${c}-${r}-MTS-ALFF.txt
    
        for h in ${hemi[@]}; do
    
           cat ${ALFF_path}/${r}/sub-01/sub-01-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-02/sub-02-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-03/sub-03-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-04/sub-04-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-05/sub-05-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-06/sub-06-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-07/sub-07-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-08/sub-08-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-09/sub-09-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-10/sub-10-${c}-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/sub-11/sub-11-${c}-${r}-${h}-meanALFF.txt >
               ${ALFF_path}/${r}/allsubs-${c}-${r}-${h}-meanALFF.txt
               
               
            cat ${alt_ALFF}/${r}/sub-01/sub-01-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-02/sub-02-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-03/sub-03-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-04/sub-04-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-05/sub-05-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-06/sub-06-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-07/sub-07-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-08/sub-08-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-09/sub-09-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-10/sub-10-${c}-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/sub-11/sub-11-${c}-${r}-${h}-MTS-ALFF.txt > ${alt_ALFF}/${r}/allsubs-${c}-${r}-${h}-MTS-ALFF.txt
        done
    done
done
    

# Create a text file to compare across conditions (ns vs as)

 for r in `cat ${mask_path}/Region_List.txt`; do
    mkdir -p ${cc_path}/Mean_ALFF/Bilateral
    
    paste ${data_path}/subj_list.txt ${ALFF_path}/${r}/allsubs-ns-${r}-meanALFF.txt ${ALFF_path}/${r}/allsubs-vs-${r}-meanALFF.txt ${ALFF_path}/${r}/allsubs-as-${r}-meanALFF.txt | column -s $'\t' -t > ${cc_path}/Mean_ALFF/Bilateral/allsubs-${r}-ns-vs-as-meanALFF.txt


    mkdir -p ${cc_path}/ALFF_of_Mean/Bilateral
    
    paste ${data_path}/subj_list.txt ${alt_ALFF}/${r}/allsubs-ns-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/allsubs-vs-${r}-MTS-ALFF.txt ${alt_ALFF}/${r}/allsubs-as-${r}-MTS-ALFF.txt | column -s $'\t' -t > ${cc_path}/ALFF_of_Mean/Bilateral/allsubs-${r}-ns-vs-as-MTS-ALFF.txt
    
    for h in ${hemi[@]}; do
    
        mkdir -p ${cc_path}/Mean_ALFF/${h}
        
        paste ${data_path}/subj_list.txt ${ALFF_path}/${r}/allsubs-ns-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/allsubs-vs-${r}-${h}-meanALFF.txt ${ALFF_path}/${r}/allsubs-as-${r}-${h}-meanALFF.txt | column -s $'\t' -t > ${cc_path}/Mean_ALFF/${h}/allsubs-${r}-${h}-ns-vs-as-meanALFF.txt

        mkdir -p ${cc_path}/ALFF_of_Mean/${h}
    
        paste ${data_path}/subj_list.txt ${alt_ALFF}/${r}/allsubs-ns-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/allsubs-vs-${r}-${h}-MTS-ALFF.txt ${alt_ALFF}/${r}/allsubs-as-${r}-${h}-MTS-ALFF.txt | column -s $'\t' -t > ${cc_path}/ALFF_of_Mean/${h}/allsubs-${r}-${h}-ns-vs-as-MTS-ALFF.txt
    done
done 
