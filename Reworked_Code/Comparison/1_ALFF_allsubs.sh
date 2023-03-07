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

cat ${analysis_path}/ALFF/Whole_Brain/sub-01/sub-01-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-02/sub-02-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-03/sub-03-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-04/sub-04-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-05/sub-05-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-06/sub-06-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-07/sub-07-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-08/sub-08-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-09/sub-09-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-10/sub-10-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-11/sub-11-${c}-meanALFF.txt > ${analysis_path}/ALFF/Whole_Brain/allsubs-${c}-meanALFF.txt

# cat ${alt_analysis_path}/ALFF/Whole_Brain/sub-01/sub-01-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-02/sub-02-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-03/sub-03-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-04/sub-04-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-05/sub-05-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-06/sub-06-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-07/sub-07-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-08/sub-08-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-09/sub-09-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-10/sub-10-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-11/sub-11-${c}-MTS-ALFF.txt > ${alt_analysis_path}/ALFF/Whole_Brain/allsubs-${c}-MTS-ALFF.txt

    for r in ${region[@]}; do
    cat ${analysis_path}/ALFF/${r}/sub-01/sub-01-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-02/sub-02-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-03/sub-03-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-04/sub-04-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-05/sub-05-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-06/sub-06-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-07/sub-07-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-08/sub-08-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-09/sub-09-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-10/sub-10-${c}-meanALFF-${r}.txt ${analysis_path}/ALFF/${r}/sub-11/sub-11-${c}-meanALFF-${r}.txt > ${analysis_path}/ALFF/${r}/allsubs-${c}-meanALFF-${r}.txt
 

    cat ${alt_analysis_path}/ALFF/${r}/sub-01/sub-01-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-02/sub-02-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-03/sub-03-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-04/sub-04-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-05/sub-05-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-06/sub-06-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-07/sub-07-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-08/sub-08-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-09/sub-09-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-10/sub-10-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-11/sub-11-${c}-MTS-ALFF-${r}.txt > ${alt_analysis_path}/ALFF/${r}/allsubs-${c}-MTS-ALFF-${r}.txt
    done
done
    

######## fALFF

for c in ${cond[@]}; do

cat ${analysis_path}/fALFF/Whole_Brain/sub-01/sub-01-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-02/sub-02-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-03/sub-03-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-04/sub-04-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-05/sub-05-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-06/sub-06-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-07/sub-07-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-08/sub-08-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-09/sub-09-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-10/sub-10-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-11/sub-11-${c}-meanfALFF.txt > ${analysis_path}/fALFF/Whole_Brain/allsubs-${c}-meanfALFF.txt

# cat ${alt_analysis_path}/fALFF/Whole_Brain/sub-01/sub-01-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-02/sub-02-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-03/sub-03-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-04/sub-04-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-05/sub-05-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-06/sub-06-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-07/sub-07-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-08/sub-08-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-09/sub-09-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-10/sub-10-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-11/sub-11-${c}-MTS-fALFF.txt > ${alt_analysis_path}/fALFF/Whole_Brain/allsubs-${c}-MTS-fALFF.txt

    for r in ${region[@]}; do
    cat ${analysis_path}/fALFF/${r}/sub-01/sub-01-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-02/sub-02-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-03/sub-03-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-04/sub-04-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-05/sub-05-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-06/sub-06-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-07/sub-07-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-08/sub-08-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-09/sub-09-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-10/sub-10-${c}-meanfALFF-${r}.txt ${analysis_path}/fALFF/${r}/sub-11/sub-11-${c}-meanfALFF-${r}.txt > ${analysis_path}/fALFF/${r}/allsubs-${c}-meanfALFF-${r}.txt

    cat ${alt_analysis_path}/fALFF/${r}/sub-01/sub-01-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-02/sub-02-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-03/sub-03-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-04/sub-04-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-05/sub-05-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-06/sub-06-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-07/sub-07-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-08/sub-08-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-09/sub-09-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-10/sub-10-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-11/sub-11-${c}-MTS-fALFF-${r}.txt > ${alt_analysis_path}/fALFF/${r}/allsubs-${c}-MTS-fALFF-${r}.txt
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
        cat ${grey_ALFF}/${r}/sub-01/sub-01-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-02/sub-02-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-03/sub-03-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-04/sub-04-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-05/sub-05-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-06/sub-06-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-07/sub-07-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-08/sub-08-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-09/sub-09-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-10/sub-10-${c}-meanALFF-${r}-grey.txt ${grey_ALFF}/${r}/sub-11/sub-11-${c}-meanALFF-${r}-grey.txt > ${grey_ALFF}/${r}/allsubs-${c}-ALFF-${r}-grey.txt
    
        cat ${grey_alt_ALFF}/${r}/sub-01/sub-01-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-02/sub-02-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-03/sub-03-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-04/sub-04-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-05/sub-05-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-06/sub-06-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-07/sub-07-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-08/sub-08-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-09/sub-09-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-10/sub-10-${c}-MTS-ALFF-${r}-grey.txt ${grey_alt_ALFF}/${r}/sub-11/sub-11-${c}-MTS-ALFF-${r}-grey.txt > ${grey_alt_ALFF}/${r}/allsubs-${c}-MTS-ALFF-${r}-grey.txt
        
        cat ${grey_fALFF}/${r}/sub-01/sub-01-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-02/sub-02-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-03/sub-03-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-04/sub-04-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-05/sub-05-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-06/sub-06-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-07/sub-07-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-08/sub-08-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-09/sub-09-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-10/sub-10-${c}-meanfALFF-${r}-grey.txt ${grey_fALFF}/${r}/sub-11/sub-11-${c}-meanfALFF-${r}-grey.txt > ${grey_fALFF}/${r}/allsubs-${c}-fALFF-${r}-grey.txt
    
        cat ${grey_alt_fALFF}/${r}/sub-01/sub-01-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-02/sub-02-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-03/sub-03-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-04/sub-04-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-05/sub-05-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-06/sub-06-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-07/sub-07-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-08/sub-08-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-09/sub-09-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-10/sub-10-${c}-MTS-fALFF-${r}-grey.txt ${grey_alt_fALFF}/${r}/sub-11/sub-11-${c}-MTS-fALFF-${r}-grey.txt > ${grey_alt_fALFF}/${r}/allsubs-${c}-MTS-fALFF-${r}-grey.txt
    done
done
