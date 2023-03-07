cond=(as ns vs)
region=(AC HG PT MGB V1 Thal)
region_2=(AC HG PT V1)
neighbourhood=(7 19 27)

data_path="$HOME/BrainStates_Test"
reho_path="$HOME/BrainStates_Test/Analysis/ReHo"

mkdir -p $HOME/BrainStates_Test/Analysis/ReHo/Compare

reho_compare="$HOME/BrainStates_Test/Analysis/ReHo/Compare"


        
# Compare the effect of different neighbourhood sizes on mean ReHo

mkdir -p ${reho_compare}/Neighbourhood

###### Auditory cortex

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/AC

echo "Compare the effect of neighbourhood size on mean ReHo in the Auditory Cortex ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/AC/allsubs-${c}-AC-7-meanReHo.txt ${reho_compare}/AC/allsubs-${c}-AC-19-meanReHo.txt ${reho_compare}/AC/allsubs-${c}-AC-27-meanReHo.txt | column -s $'\t' -t > ${reho_compare}/Neighbourhood/AC/${c}-AC-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/AC/${c}-AC-ReHo-neigh-compare.txt
done


##### Heschl's Gyrus

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/HG

echo "Compare the effect of neighbourhood size on mean ReHo in the Heschl's Gyrus ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/HG/allsubs-${c}-HG-7-meanReHo.txt ${reho_compare}/HG/allsubs-${c}-HG-19-meanReHo.txt ${reho_compare}/HG/allsubs-${c}-HG-27-meanReHo.txt | column -s $'\t' -t > ${reho_compare}/Neighbourhood/HG/${c}-HG-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/HG/${c}-HG-ReHo-neigh-compare.txt
done


##### Planum Temporale

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/PT

echo "Compare the effect of neighbourhood size on mean ReHo in the Planum Temporale ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/PT/allsubs-${c}-PT-7-meanReHo.txt ${reho_compare}/PT/allsubs-${c}-PT-19-meanReHo.txt ${reho_compare}/PT/allsubs-${c}-PT-27-meanReHo.txt | column -s $'\t' -t > ${reho_compare}/Neighbourhood/PT/${c}-PT-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/PT/${c}-PT-ReHo-neigh-compare.txt
done


##### Primary Visual Cortex

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/V1

echo "Compare the effect of the neighbourhood size on mean ReHo in the Primary Visual Cortex ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/V1/allsubs-${c}-V1-7-meanReHo.txt ${reho_compare}/V1/allsubs-${c}-V1-19-meanReHo.txt ${reho_compare}/V1/allsubs-${c}-V1-27-meanReHo.txt |column -s $'\t' -t > ${reho_compare}/Neighbourhood/V1/${c}-V1-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/V1/${c}-V1-ReHo-neigh-compare.txt
done


###### Medial Geniculate Body

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/MGB

echo "Compare the effect of the neighbourhood size on mean ReHo in the medial geniculate body ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/MGB/allsubs-${c}-MGB-7-meanReHo.txt ${reho_compare}/MGB/allsubs-${c}-MGB-19-meanReHo.txt ${reho_compare}/MGB/allsubs-${c}-MGB-27-meanReHo.txt | column -s '\t' -t > ${reho_compare}/Neighbourhood/MGB/${c}-MGB-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/MGB/${c}-MGB-ReHo-neigh-compare.txt
done


##### Thalamus

for c in ${cond[@]}; do

mkdir -p ${reho_compare}/Neighbourhood/Thal

echo "Compare the effect of the neighbourhood size on the mean ReHo in the Thalamus ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/Thal/allsubs-${c}-Thal-7-meanReHo.txt ${reho_compare}/Thal/allsubs-${c}-Thal-19-meanReHo.txt ${reho_compare}/Thal/allsubs-${c}-Thal-27-meanReHo.txt | column -s '\t' -t > ${reho_compare}/Neighbourhood/Thal/${c}-Thal-ReHo-neigh-compare.txt
cat ${reho_compare}/Neighbourhood/Thal/${c}-Thal-ReHo-neigh-compare.txt
done



#################### Repeat for the grey matter specific ROIs

# Compare the effect of different neighbourhood sizes on mean ReHo

mkdir -p ${reho_compare}/Neighbourhood/Grey_ROIs
grey_ReHo="${reho_compare}/Neighbourhood/Grey_ROIs"

##### Auditory cortex

for c in ${cond[@]}; do

mkdir -p ${grey_ReHo}/AC

echo "Compare the effect of neighbourhood size on mean ReHo in AC Grey Matter ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/Grey_ROIs/AC/allsubs-${c}-AC-7-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/AC/allsubs-${c}-AC-19-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/AC/allsubs-${c}-AC-27-meanReHo-grey.txt | column -s '\t' -t > ${grey_ReHo}/AC/${c}-AC-grey-ReHo-neigh-compare.txt
cat ${grey_ReHo}/AC/${c}-AC-grey-ReHo-neigh-compare.txt
done


##### Heschl's Gyrus

for c in ${cond[@]}; do

mkdir -p ${grey_ReHo}/HG

echo "Compare the effect of neighbourhood size on mean ReHo in HG Grey Matter ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/Grey_ROIs/HG/allsubs-${c}-HG-7-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/HG/allsubs-${c}-HG-19-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/HG/allsubs-${c}-HG-27-meanReHo-grey.txt | column -s '\t' -t > ${grey_ReHo}/HG/${c}-HG-grey-ReHo-neigh-compare.txt
cat ${grey_ReHo}/HG/${c}-HG-grey-ReHo-neigh-compare.txt
done


##### Planum Temporale

for c in ${cond[@]}; do

mkdir -p ${grey_ReHo}/PT

echo "Compare the effect of neighbourhood size on mean ReHo in PT Grey Matter ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/Grey_ROIs/PT/allsubs-${c}-PT-7-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/PT/allsubs-${c}-PT-19-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/PT/allsubs-${c}-PT-27-meanReHo-grey.txt | column -s $'\t' -t > ${grey_ReHo}/PT/${c}-PT-grey-ReHo-neigh-compare.txt
cat ${grey_ReHo}/PT/${c}-PT-grey-ReHo-neigh-compare.txt
done


##### Primary Visual Cortex

for c in ${cond[@]}; do

mkdir -p ${grey_ReHo}/V1

echo "Compare the effect of neighbourhood size on mean ReHo in V1 in Grey Matter ${c}"
paste ${reho_compare}/subj_list.txt ${reho_compare}/Grey_ROIs/V1/allsubs-${c}-V1-7-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/V1/allsubs-${c}-V1-19-meanReHo-grey.txt ${reho_compare}/Grey_ROIs/V1/allsubs-${c}-V1-27-meanReHo-grey.txt | column -s $'\t' -t > ${grey_ReHo}/V1/${c}-V1-grey-ReHo-neigh-compare.txt
cat ${grey_ReHo}/V1/${c}-V1-grey-ReHo-neigh-compare.txt
done





        
