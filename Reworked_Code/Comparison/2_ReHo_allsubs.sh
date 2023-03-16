#!/bin/bash
cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)
neighbourhood=(7 19 27)

data_path="$HOME/BrainStates_Test"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"

mkdir -p $HOME/BrainStates_Test/Analysis/ReHo/Compare

reho_compare="$HOME/BrainStates_Test/Analysis/ReHo/Compare"


for c in ${cond[@]}; do
    for n in ${neighbourhood[@]}; do
        for r in ${region[@]}; do
        mkdir -p ${reho_compare}/${r}
        
        cat ${reho_path}/ReHo_${n}/${r}/sub-01/sub-01-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-02/sub-02-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-03/sub-03-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-04/sub-04-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-05/sub-05-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-06/sub-06-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-07/sub-07-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-08/sub-08-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-09/sub-09-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-10/sub-10-${c}-meanReHo-${n}-${r}.txt ${reho_path}/ReHo_${n}/${r}/sub-11/sub-11-${c}-meanReHo-${n}-${r}.txt > ${reho_compare}/${r}/allsubs-${c}-${r}-${n}-meanReHo.txt
        
        done
        
        for r in ${region_2[@]}; do
        
        mkdir -p ${reho_compare}/Grey_ROIs/${r}
        
        cat ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-01/sub-01-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-02/sub-02-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-03/sub-03-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-04/sub-04-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-05/sub-05-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-06/sub-06-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-07/sub-07-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-08/sub-08-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-09/sub-09-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-10/sub-10-${c}-meanReHo-${n}-${r}-grey.txt ${reho_path}/ReHo_${n}/Grey_Matter_ROIs/${r}/sub-11/sub-11-${c}-meanReHo-${n}-${r}-grey.txt > ${reho_compare}/Grey_ROIs/${r}/allsubs-${c}-${r}-${n}-meanReHo-grey.txt
        done
    done
done




                
