#!/bin/bash
cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
analysis_path="$HOME/BrainStates_Test/Analysis"
zALFF="${analysis_path}/Z-Transformed/ALFF"
zfALFF="${analysis_path}/Z-Transformed/fALFF"

##### Create a text file for each condition

########### ALFF
for c in ${cond[@]}; do

cat ${zALFF}/Whole_Brain/sub-01/sub-01-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-02/sub-02-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-03/sub-03-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-04/sub-04-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-05/sub-05-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-06/sub-06-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-07/sub-07-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-08/sub-08-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-09/sub-09-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-10/sub-10-${c}-ALFF-Zmean.txt ${zALFF}/Whole_Brain/sub-11/sub-11-${c}-ALFF-Zmean.txt > ${zALFF}/Whole_Brain/allsubs-${c}-meanALFF-Z.txt


    for r in ${region[@]}; do
    cat ${zALFF}/${r}/sub-01/sub-01-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-02/sub-02-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-03/sub-03-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-04/sub-04-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-05/sub-05-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-06/sub-06-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-07/sub-07-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-08/sub-08-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-09/sub-09-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-10/sub-10-${c}-ALFF-${r}-Zmean.txt ${zALFF}/${r}/sub-11/sub-11-${c}-ALFF-${r}-Zmean.txt > ${zALFF}/${r}/allsubs-${c}-meanALFF-Z-${r}.txt
    done
done
    

######## fALFF

for c in ${cond[@]}; do

cat ${zfALFF}/Whole_Brain/sub-01/sub-01-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-02/sub-02-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-03/sub-03-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-04/sub-04-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-05/sub-05-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-06/sub-06-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-07/sub-07-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-08/sub-08-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-09/sub-09-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-10/sub-10-as-fALFF-Zmean.txt ${zfALFF}/Whole_Brain/sub-11/sub-11-as-fALFF-Zmean.txt > ${zfALFF}/Whole_Brain/allsubs-${c}-meanfALFF-Z.txt


    for r in ${region[@]}; do
    cat ${zfALFF}/${r}/sub-01/sub-01-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-02/sub-02-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-03/sub-03-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-04/sub-04-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-05/sub-05-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-06/sub-06-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-07/sub-07-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-08/sub-08-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-09/sub-09-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-10/sub-10-${c}-fALFF-${r}-Zmean.txt ${zfALFF}/${r}/sub-11/sub-11-${c}-fALFF-${r}-Zmean.txt > ${zfALFF}/${r}/allsubs-${c}-meanfALFF-${r}-Z.txt
    done
done

#### Repeat for the grey matter specific ROIs
region_2=(AC HG PT V1)
grey_zALFF="${analysis_path}/Z-Transformed/ALFF/Grey_Matter_ROIs"
grey_zfALFF="${analysis_path}/Z-Transformed/fALFF/Grey_Matter_ROIs"

for c in ${cond[@]};do

    for r in ${region_2[@]}; do
        cat ${grey_zALFF}/${r}/sub-01/sub-01-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-02/sub-02-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-03/sub-03-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-04/sub-04-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-05/sub-05-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-06/sub-06-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-07/sub-07-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-08/sub-08-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-09/sub-09-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-10/sub-10-${c}-ALFF-${r}-grey-Zmean.txt ${grey_zALFF}/${r}/sub-11/sub-11-${c}-ALFF-${r}-grey-Zmean.txt > ${grey_zALFF}/${r}/allsubs-${c}-ALFF-${r}-grey-Z.txt
    
        cat ${grey_zfALFF}/${r}/sub-01/sub-01-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-02/sub-02-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-03/sub-03-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-04/sub-04-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-05/sub-05-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-06/sub-06-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-07/sub-07-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-08/sub-08-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-09/sub-09-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-10/sub-10-${c}-fALFF-${r}-grey-Zmean.txt ${grey_zfALFF}/${r}/sub-11/sub-11-${c}-fALFF-${r}-grey-Zmean.txt > ${grey_zfALFF}/${r}/allsubs-${c}-fALFF-${r}-grey-Z.txt
    
    done
done
