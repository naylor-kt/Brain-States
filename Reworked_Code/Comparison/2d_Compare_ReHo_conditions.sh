#!/bin/bash
cond=(as ns vs)
neighbourhood=(7 19 27)

data_path="$HOME/BrainStates_Test"
analysis_path="$HOME/BrainStates_Test/Analysis"

mkdir -p ${analysis_path}/Compare_Conditions
cc_path="$HOME/BrainStates_Test/Analysis/Compare_Conditions"

reho_compare="$HOME/BrainStates_Test/Analysis/ReHo/Compare"


########### Compare Mean ReHo in a region across the conditions

##### Auditory Cortex
mkdir -p ${cc_path}/ReHo/AC

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Auditory Cortex as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/AC/allsubs-as-AC-${n}-meanReHo.txt ${reho_compare}/AC/allsubs-ns-AC-${n}-meanReHo.txt ${reho_compare}/AC/allsubs-vs-AC-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/AC/allsubs-AC-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/AC/allsubs-AC-as-ns-vs-ReHo_${n}-compare.txt
done


##### Auditory Cortex Grey Matter
mkdir -p ${cc_path}/ReHo/Grey_Matter_ROIs/AC

for n in ${neighbourhood[@]};do
echo "ReHo in the grey matter of the Auditory Cortex as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/Grey_ROIs/AC/allsubs-as-AC-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/AC/allsubs-ns-AC-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/AC/allsubs-ns-AC-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${cc_path}/ReHo/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ReHo_${n}-compare.txt
done



##### Planum Temporale
mkdir -p ${cc_path}/ReHo/PT

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/PT/allsubs-as-PT-${n}-meanReHo.txt ${reho_compare}/PT/allsubs-ns-PT-${n}-meanReHo.txt ${reho_compare}/PT/allsubs-vs-PT-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/PT/allsubs-PT-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/PT/allsubs-PT-as-ns-vs-ReHo_${n}-compare.txt
done


##### Planum Temporale Grey Matter
mkdir -p ${cc_path}/ReHo/Grey_Matter_ROIs/PT

for n in ${neighbourhood[@]};do
echo "ReHo in the grey matter of the Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/Grey_ROIs/PT/allsubs-as-PT-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/PT/allsubs-ns-PT-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/PT/allsubs-ns-PT-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${cc_path}/ReHo/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ReHo_${n}-compare.txt
done



##### Heschl's Gyrus
mkdir -p ${cc_path}/ReHo/HG

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Heschl's Gyrus as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/HG/allsubs-as-HG-${n}-meanReHo.txt ${reho_compare}/HG/allsubs-ns-HG-${n}-meanReHo.txt ${reho_compare}/HG/allsubs-vs-HG-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/HG/allsubs-HG-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/HG/allsubs-HG-as-ns-vs-ReHo_${n}-compare.txt
done


##### Heschl's Gyrus Grey Matter
mkdir -p ${cc_path}/ReHo/Grey_Matter_ROIs/HG

for n in ${neighbourhood[@]};do
echo "ReHo in the grey matter of the Heschl's Gyrus as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/Grey_ROIs/HG/allsubs-as-HG-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/HG/allsubs-ns-HG-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/HG/allsubs-ns-HG-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${cc_path}/ReHo/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ReHo_${n}-compare.txt
done



##### Primary Visual Cortex
mkdir -p ${cc_path}/ReHo/V1

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/V1/allsubs-as-V1-${n}-meanReHo.txt ${reho_compare}/V1/allsubs-ns-V1-${n}-meanReHo.txt ${reho_compare}/V1/allsubs-vs-V1-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/V1/allsubs-V1-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/V1/allsubs-V1-as-ns-vs-ReHo_${n}-compare.txt
done


##### Primary Visual Cortex Grey Matter
mkdir -p ${cc_path}/ReHo/Grey_Matter_ROIs/V1

for n in ${neighbourhood[@]};do
echo "ReHo in the grey matter of the Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/Grey_ROIs/V1/allsubs-as-V1-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/V1/allsubs-ns-V1-${n}-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/V1/allsubs-ns-V1-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${cc_path}/ReHo/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ReHo_${n}-compare.txt
done



##### Thalamus
mkdir -p ${cc_path}/ReHo/Thal

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Thalamus as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/Thal/allsubs-as-Thal-${n}-meanReHo.txt ${reho_compare}/Thal/allsubs-ns-Thal-${n}-meanReHo.txt ${reho_compare}/Thal/allsubs-vs-Thal-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/Thal/allsubs-Thal-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/Thal/allsubs-Thal-as-ns-vs-ReHo_${n}-compare.txt
done



##### Medial Geniculate Body
mkdir -p ${cc_path}/ReHo/MGB

for n in ${neighbourhood[@]}; do
echo "ReHo in whole Medial Geniculate Body as ns vs"
paste ${data_path}/subj_list.txt ${reho_compare}/MGB/allsubs-as-MGB-${n}-meanReHo.txt ${reho_compare}/MGB/allsubs-ns-MGB-${n}-meanReHo.txt ${reho_compare}/MGB/allsubs-vs-MGB-${n}-meanReHo.txt | column -s $'\t' -t > ${cc_path}/ReHo/MGB/allsubs-MGB-as-ns-vs-ReHo_${n}-compare.txt

# cat ${cc_path}/ReHo/MGB/allsubs-MGB-as-ns-vs-ReHo_${n}-compare.txt
done
