#!/bin/bash
cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates_Test/Analysis"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis"

MTS_path="$HOME/BrainStates_Test/Mean_Time_Series"
mask_path="$HOME/BrainStates_Test/Mask"


mkdir -p $HOME/BrainStates_Test/Alternative_Analysis/Comparison
compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison"

mkdir -p $HOME/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs
grey_compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs"


##### Create a text file for each condition

########### ALFF

for c in ${cond[@]}; do

cat ${analysis_path}/ALFF/Whole_Brain/sub-01/sub-01-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-02/sub-02-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-03/sub-03-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-04/sub-04-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-05/sub-05-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-06/sub-06-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-07/sub-07-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-08/sub-08-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-09/sub-09-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-10/sub-10-${c}-stdALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-11/sub-11-${c}-stdALFF.txt > ${analysis_path}/ALFF/Whole_Brain/allsubs-${c}-stdALFF.txt


    for r in ${region[@]}; do
    cat ${analysis_path}/ALFF/${r}/sub-01/sub-01-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-02/sub-02-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-03/sub-03-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-04/sub-04-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-05/sub-05-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-06/sub-06-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-07/sub-07-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-08/sub-08-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-09/sub-09-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-10/sub-10-${c}-stdALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-11/sub-11-${c}-stdALFF-${r}.txt > ${analysis_path}/ALFF/${r}/allsubs-${c}-stdALFF-${r}.txt
    done
done
    

######## fALFF

for c in ${cond[@]}; do

cat ${analysis_path}/fALFF/Whole_Brain/sub-01/sub-01-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-02/sub-02-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-03/sub-03-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-04/sub-04-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-05/sub-05-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-06/sub-06-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-07/sub-07-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-08/sub-08-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-09/sub-09-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-10/sub-10-${c}-stdfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-11/sub-11-${c}-stdfALFF.txt > ${analysis_path}/fALFF/Whole_Brain/allsubs-${c}-stdfALFF.txt


    for r in ${region[@]}; do
    cat ${analysis_path}/fALFF/${r}/sub-01/sub-01-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-02/sub-02-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-03/sub-03-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-04/sub-04-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-05/sub-05-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-06/sub-06-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-07/sub-07-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-08/sub-08-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-09/sub-09-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-10/sub-10-${c}-stdfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-11/sub-11-${c}-stdfALFF-${r}.txt > ${analysis_path}/fALFF/${r}/allsubs-${c}-stdfALFF-${r}.txt
    done
done

#### Repeat for the grey matter specific ROIs
region_2=(AC HG PT V1)
grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
grey_alt_ALFF="$HOME/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs"

grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"
grey_alt_fALFF="$HOME/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs"

for c in ${cond[@]};do

    for r in ${region_2[@]}; do
        cat ${grey_ALFF}/${r}/sub-01/sub-01-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-02/sub-02-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-03/sub-03-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-04/sub-04-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-05/sub-05-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-06/sub-06-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-07/sub-07-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-08/sub-08-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-09/sub-09-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-10/sub-10-${c}-stdALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-11/sub-11-${c}-stdALFF-${r}-grey.txt > ${grey_ALFF}/${r}/allsubs-${c}-stdALFF-${r}-grey.txt
    

        
        cat ${grey_fALFF}/${r}/sub-01/sub-01-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-02/sub-02-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-03/sub-03-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-04/sub-04-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-05/sub-05-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-06/sub-06-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-07/sub-07-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-08/sub-08-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-09/sub-09-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-10/sub-10-${c}-stdfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-11/sub-11-${c}-stdfALFF-${r}-grey.txt > ${grey_fALFF}/${r}/allsubs-${c}-stdfALFF-${r}-grey.txt
    
    done
done




