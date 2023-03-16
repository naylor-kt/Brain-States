#!/bin/bash

cond=(as ns vs)
region=(AC HG PT V1)
hemi=(lh rh)

data_path="$HOME/BrainStates_Test"
surf_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF"
surf_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF"
sm_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed"
sm_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed"

mkdir -p /Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF
mkdir -p /Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF

cc_path="/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions"

########### Compare Mean ALFF in a region across the conditions

##### Whole Brain - ALFF in subject specific space
mkdir -p ${cc_path}/ALFF/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${surf_ALFF}/Whole_Brain/allsubs-as-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/allsubs-vs-${h}-MEAN-ALFF-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/Whole_Brain/allsubs-as-ns-vs-surf_ALFF-${h}-fs-compare.txt

done

##### Whole Brain - ALFF in fsavergae space
mkdir -p ${cc_path}/ALFF/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${surf_ALFF}/Whole_Brain/allsubs-as-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/allsubs-vs-${h}-MEAN-ALFF-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/Whole_Brain/allsubs-as-ns-vs-surf_ALFF-${h}-fsavg-compare.txt

done

##### Whole Brain - fALFF in subject specific space
mkdir -p ${cc_path}/fALFF/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${surf_fALFF}/Whole_Brain/allsubs-as-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/allsubs-vs-${h}-MEAN-fALFF-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/Whole_Brain/allsubs-as-ns-vs-surf_fALFF-${h}-fs-compare.txt

done

##### Whole Brain - ALFF in fsavergae space
mkdir -p ${cc_path}/fALFF/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${surf_fALFF}/Whole_Brain/allsubs-as-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/allsubs-vs-${h}-MEAN-fALFF-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/Whole_Brain/allsubs-as-ns-vs-surf_fALFF-${h}-fsavg-compare.txt

done


##### ROIs - ALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/ALFF/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${surf_ALFF}/${r}/allsubs-as-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/allsubs-ns-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/allsubs-vs-${h}-MEAN-ALFF-${r}-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/${r}/allsubs-as-ns-vs-surf_ALFF-${r}-${h}-fs-compare.txt

    done


    ##### ROIs - ALFF in fsavergae space
    mkdir -p ${cc_path}/ALFF/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${surf_ALFF}/${r}/allsubs-as-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/allsubs-ns-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/allsubs-vs-${h}-MEAN-ALFF-${r}-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/${r}/allsubs-as-ns-vs-surf_ALFF-${r}-${h}-fsavg-compare.txt

    done
done

##### ROIs - fALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/fALFF/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${surf_fALFF}/${r}/allsubs-as-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/allsubs-ns-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/allsubs-vs-${h}-MEAN-fALFF-${r}-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/${r}/allsubs-as-ns-vs-surf_fALFF-${r}-${h}-fs-compare.txt

    done


    ##### ROIs - fALFF in fsavergae space
    mkdir -p ${cc_path}/fALFF/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${surf_fALFF}/${r}/allsubs-as-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/allsubs-ns-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/allsubs-vs-${h}-MEAN-fALFF-${r}-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/${r}/allsubs-as-ns-vs-surf_fALFF-${r}-${h}-fsavg-compare.txt

    done
done


############# SMOOTHED DATA

##### Whole Brain - ALFF in subject specific space
mkdir -p ${cc_path}/ALFF/Smoothed/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${sm_ALFF}/Whole_Brain/allsubs-as-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-SM-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/Smoothed/Whole_Brain/allsubs-as-ns-vs-surf_ALFF-SM-${h}-fs-compare.txt

done

##### Whole Brain - ALFF in subject specific space
mkdir -p ${cc_path}/ALFF/Smoothed/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${sm_ALFF}/Whole_Brain/allsubs-as-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-ALFF-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/Smoothed/Whole_Brain/allsubs-as-ns-vs-surf_ALFF-SM-${h}-fsavg-compare.txt

done

##### Whole Brain - fALFF in subject specific space
mkdir -p ${cc_path}/fALFF/Smoothed/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${sm_fALFF}/Whole_Brain/allsubs-as-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-SM-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/Smoothed/Whole_Brain/allsubs-as-ns-vs-surf_fALFF-SM-${h}-fs-compare.txt

done

##### Whole Brain - fALFF in subject specific space
mkdir -p ${cc_path}/fALFF/Smoothed/Whole_Brain

for h in ${hemi[@]}; do

paste ${data_path}/subj_list.txt ${sm_fALFF}/Whole_Brain/allsubs-as-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/allsubs-ns-${h}-MEAN-fALFF-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/Smoothed/Whole_Brain/allsubs-as-ns-vs-surf_fALFF-SM-${h}-fsavg-compare.txt

done

##### Specific ROIs - ALFF in subject specific space

##### ROIs - ALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/ALFF/Smoothed/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${sm_ALFF}/${r}/allsubs-as-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/allsubs-ns-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/allsubs-vs-${h}-MEAN-ALFF-${r}-SM-fs.txt | column -s $'\t' -t > ${cc_path}/ALFF/Smoothed/${r}/allsubs-as-ns-vs-surf_ALFF-SM-${r}-${h}-fs-compare.txt

    done


    ##### ROIs - ALFF in fsavergae space
    mkdir -p ${cc_path}/ALFF/Smoothed/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${sm_ALFF}/${r}/allsubs-as-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/allsubs-ns-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/allsubs-vs-${h}-MEAN-ALFF-${r}-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/ALFF/Smoothed/${r}/allsubs-as-ns-vs-surf_ALFF-SM-${r}-${h}-fsavg-compare.txt

    done
done

##### Specific ROIs - fALFF in subject specific space

##### ROIs - fALFF in subject specific space
for r in ${region[@]}; do
    mkdir -p ${cc_path}/fALFF/Smoothed/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${sm_fALFF}/${r}/allsubs-as-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/allsubs-ns-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/allsubs-vs-${h}-MEAN-fALFF-${r}-SM-fs.txt | column -s $'\t' -t > ${cc_path}/fALFF/Smoothed/${r}/allsubs-as-ns-vs-surf_fALFF-SM-${r}-${h}-fs-compare.txt

    done


    ##### ROIs - ALFF in fsavergae space
    mkdir -p ${cc_path}/fALFF/Smoothed/${r}

    for h in ${hemi[@]}; do

    paste ${data_path}/subj_list.txt ${sm_fALFF}/${r}/allsubs-as-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/allsubs-ns-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/allsubs-vs-${h}-MEAN-fALFF-${r}-SM-fsavg.txt | column -s $'\t' -t > ${cc_path}/fALFF/Smoothed/${r}/allsubs-as-ns-vs-surf_fALFF-SM-${r}-${h}-fsavg-compare.txt

    done
done
