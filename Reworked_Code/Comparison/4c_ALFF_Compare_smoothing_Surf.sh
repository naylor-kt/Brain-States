#!/bin/bash

cond=(as ns vs)
region=(AC HG PT V1)
hemi=(lh rh)

data_path="$HOME/BrainStates_Test"
surf_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF"
surf_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF"
sm_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed"
sm_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed"

mkdir -p /Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Smoothing/ALFF
mkdir -p /Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Smoothing/fALFF

cc_path="/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Smoothing"

########### Compare Mean ALFF in a region across the conditions

##### Whole Brain - ALFF in subject specific space
mkdir -p ${cc_path}/ALFF/Whole_Brain

for h in ${hemi[@]}; do
    for c in ${cond[@]}; do
    paste ${data_path}/subj_list.txt ${surf_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-fs.txt ${sm_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-SM-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/Whole_Brain/allsubs-${c}-surf_ALFF-${h}-fs-smoothing-compare.txt
    done
done

##### Whole Brain - ALFF in fsavergae space
mkdir -p ${cc_path}/ALFF/Whole_Brain

for h in ${hemi[@]}; do
    for c in ${cond[@]}; do
    paste ${data_path}/subj_list.txt ${surf_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-fsavg.txt ${sm_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/Whole_Brain/allsubs-${c}-surf_ALFF-${h}-fsavg-smoothing-compare.txt
    done
done

##### Whole Brain - fALFF in subject specific space
mkdir -p ${cc_path}/fALFF/Whole_Brain

for h in ${hemi[@]}; do
    for c in ${cond[@]}; do
    paste ${data_path}/subj_list.txt ${surf_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-fs.txt ${sm_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-SM-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/Whole_Brain/allsubs-${c}-surf_fALFF-${h}-fs-smoothing-compare.txt
    done
done

##### Whole Brain - fALFF in fsavergae space
mkdir -p ${cc_path}/fALFF/Whole_Brain

for h in ${hemi[@]}; do
    for c in ${cond[@]}; do
    paste ${data_path}/subj_list.txt ${surf_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-fsavg.txt ${sm_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/Whole_Brain/allsubs-${c}-surf_fALFF-${h}-fsavg-smoothing-compare.txt
    done
done

##### ROIs - ALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/ALFF/${r}
    for c in ${cond[@]}; do
    
        for h in ${hemi[@]}; do

        paste ${data_path}/subj_list.txt ${surf_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${sm_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/${r}/allsubs-${c}-surf_ALFF-${r}-${h}-fs-smoothing-compare.txt

        done


        ##### ROIs - ALFF in fsavergae space
        mkdir -p ${cc_path}/ALFF/${r}

        for h in ${hemi[@]}; do

        paste ${data_path}/subj_list.txt ${surf_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${sm_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/${r}/allsubs-${c}-surf_ALFF-${r}-${h}-fsavg-smoothing-compare.txt

        done
    done
done

##### ROIs - fALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/fALFF/${r}
    for c in ${cond[@]}; do
    
        for h in ${hemi[@]}; do

        paste ${data_path}/subj_list.txt ${surf_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${sm_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/${r}/allsubs-${c}-surf_fALFF-${r}-${h}-fs-smoothing-compare.txt

        done


        ##### ROIs - fALFF in fsavergae space
        mkdir -p ${cc_path}/fALFF/${r}

        for h in ${hemi[@]}; do

        paste ${data_path}/subj_list.txt ${surf_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${sm_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/${r}/allsubs-${c}-surf_fALFF-${r}-${h}-fsavg-smoothing-compare.txt

        done
    done
done



