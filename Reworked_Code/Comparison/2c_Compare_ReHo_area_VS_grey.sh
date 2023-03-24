cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)
neighbourhood=(7 19 27)

data_path="$HOME/BrainStates_Test"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"

mkdir -p $HOME/BrainStates_Test/Analysis/ReHo/Compare

reho_compare="$HOME/BrainStates_Test/Analysis/ReHo/Compare"


        
# Compare the effect of different neighbourhood sizes on mean ReHo

mkdir -p ${reho_compare}/Area_VS_Grey
reho_area="${reho_compare}/Area_VS_Grey"

###### Auditory cortex

for c in ${cond[@]}; do
    for n in ${neighbourhood[@]}; do
    
    mkdir -p ${reho_area}/AC

    echo "Compare mean ReHo in the whole area vs grey matter in the Auditory Cortex ${c} Neighbourhood size ${n}"
    paste ${reho_compare}/subj_list.txt ${reho_compare}/AC/allsubs-${c}-AC-${n}-meanReHo.txt ${reho_compare}/Grey_ROIs/AC/allsubs-${c}-AC-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${reho_area}/AC/${c}-${n}-AC-ReHo-wholeVgm.txt
    cat ${reho_area}/AC/${c}-${n}-AC-ReHo-wholeVgm.txt
    done
done

##### Heschl's Gyrus
            
for c in ${cond[@]}; do
    for n in ${neighbourhood[@]}; do
    
    mkdir -p ${reho_area}/HG
    
    echo "Compare mean ReHo in the whole area vs grey matter in the Heschl's Gyrus ${c} Neighbourhood size ${n}"
    paste ${reho_compare}/subj_list.txt ${reho_compare}/HG/allsubs-${c}-HG-${n}-meanReHo.txt ${reho_compare}/Grey_ROIs/HG/allsubs-${c}-HG-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${reho_area}/HG/${c}-${n}-HG-ReHo-wholeVgm.txt
    cat ${reho_area}/HG/${c}-${n}-HG-ReHo-wholeVgm.txt
    done
done


##### Planum Temporale

for c in ${cond[@]}; do
    for n in ${neighbourhood[@]}; do
    
    mkdir -p ${reho_area}/PT
    
    echo "Compare mean ReHo in the whole area vs grey matter in the Planum Temporale ${c} Neighbourhood size ${n}"
    paste ${reho_compare}/subj_list.txt ${reho_compare}/PT/allsubs-${c}-PT-${n}-meanReHo.txt ${reho_compare}/Grey_ROIs/PT/allsubs-${c}-PT-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${reho_area}/PT/${c}-${n}-PT-ReHo-wholeVgm.txt
    cat ${reho_area}/PT/${c}-${n}-PT-ReHo-wholeVgm.txt
    done
done


##### Primary Visual Cortex

for c in ${cond[@]}; do
    for n in ${neighbourhood[@]}; do
    
    mkdir -p ${reho_area}/V1
    
    echo "Compare mean ReHo in the whole area vs grey matter in the Planum Temporale ${c} Neighbourhood size ${n}"
    paste ${reho_compare}/subj_list.txt ${reho_compare}/V1/allsubs-${c}-V1-${n}-meanReHo.txt ${reho_compare}/Grey_ROIs/V1/allsubs-${c}-V1-${n}-meanReHo-grey.txt | column -s $'\t' -t > ${reho_area}/V1/${c}-${n}-V1-ReHo-wholeVgm.txt
    cat ${reho_area}/V1/${c}-${n}-V1-ReHo-wholeVgm.txt
    done
done



        
