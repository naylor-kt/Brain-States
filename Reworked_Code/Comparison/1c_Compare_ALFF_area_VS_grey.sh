#!/bin/bash
cond=(as ns vs)

analysis_path="$HOME/BrainStates_Test/Analysis"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis"

compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison"
grey_compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs"

grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
grey_alt_ALFF="$HOME/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs"
grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"
grey_alt_fALFF="$HOME/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs"


########### Compare Mean ALFF in the whole area vs the grey matter specifically
 
mkdir -p ${compare_path}/Whole_VS_Grey/ALFF

##### Auditory Cortex

for c in ${cond[@]}; do

echo "${c} ALFF in whole Auditory Cortex VS AC Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/AC/allsubs-${c}-meanALFF-AC.txt ${grey_ALFF}/AC/allsubs-${c}-ALFF-AC-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/ALFF/${c}-AC-wholeVgm-ALFF.txt
cat ${compare_path}/Whole_VS_Grey/ALFF/${c}-AC-wholeVgm-ALFF.txt
done


##### Planum Temporale

for c in ${cond[@]}; do

echo "${c} ALFF in whole Planum Temporale vs PT Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/PT/allsubs-${c}-meanALFF-PT.txt ${grey_ALFF}/PT/allsubs-${c}-ALFF-PT-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/ALFF/${c}-PT-wholeVgm-ALFF.txt
cat ${compare_path}/Whole_VS_Grey/ALFF/${c}-PT-wholeVgm-ALFF.txt
done

##### Heschl's Gyrus

for c in ${cond[@]}; do

echo "${c} ALFF in Heschl's Gyrus vs HG Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/HG/allsubs-${c}-meanALFF-HG.txt ${grey_ALFF}/HG/allsubs-${c}-ALFF-HG-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/ALFF/${c}-HG-wholeVgm-ALFF.txt
cat ${compare_path}/Whole_VS_Grey/ALFF/${c}-HG-wholeVgm-ALFF.txt
done


##### Primary Auditory Cortex

for c in ${cond[@]}; do
mkdir -p ${compare_path}/Whole_VS_Grey/ALFF

echo "${c} ALFF Primary Visual Cortex vs V1 Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/V1/allsubs-${c}-meanALFF-V1.txt ${grey_ALFF}/V1/allsubs-${c}-ALFF-V1-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/ALFF/${c}-V1-wholeVgm-ALFF.txt
cat ${compare_path}/Whole_VS_Grey/ALFF/${c}-V1-wholeVgm-ALFF.txt
done


################ Repeat this for fALFF
mkdir -p ${compare_path}/Whole_VS_Grey/fALFF

##### Auditory Cortex

for c in ${cond[@]}; do

echo "${c} fALFF Auditory Cortex vs AC Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/AC/allsubs-${c}-meanfALFF-AC.txt ${grey_fALFF}/AC/allsubs-${c}-fALFF-AC-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/fALFF/${c}-AC-wholeVgm-fALFF.txt
cat ${compare_path}/Whole_VS_Grey/fALFF/${c}-AC-wholeVgm-fALFF.txt
done

##### Planum Temporale

for c in ${cond[@]}; do

echo "${c} fALFF Planum Temporale vs PT Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/PT/allsubs-${c}-meanfALFF-PT.txt ${grey_fALFF}/PT/allsubs-${c}-fALFF-PT-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/fALFF/${c}-PT-wholeVgm-fALFF.txt
cat ${compare_path}/Whole_VS_Grey/fALFF/${c}-PT-wholeVgm-fALFF.txt
done


##### Heschl's Gyrus

for c in ${cond[@]}; do

echo "${c} fALFF Heschl's Gyrus vs HG Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/HG/allsubs-${c}-meanfALFF-HG.txt ${grey_fALFF}/HG/allsubs-${c}-fALFF-HG-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/fALFF/${c}-HG-wholeVgm-fALFF.txt
cat ${compare_path}/Whole_VS_Grey/fALFF/${c}-HG-wholeVgm-fALFF.txt
done


##### Primary Visual Cortex

for c in ${cond[@]}; do

echo "${c} fALFF Primary Visual Cortex VS V1 Grey Matter"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/V1/allsubs-${c}-meanfALFF-V1.txt ${grey_fALFF}/V1/allsubs-${c}-fALFF-V1-grey.txt | column -s $'\t' -t > ${compare_path}/Whole_VS_Grey/fALFF/${c}-V1-wholeVgm-fALFF.txt
cat ${compare_path}/Whole_VS_Grey/fALFF/${c}-V1-wholeVgm-fALFF.txt
done

############################ Repeat for the alternative version of ALFF calculation

mkdir -p ${compare_path}/Whole_VS_Grey/Alternative_Calc/ALFF
WhGM_alt_ALFF="${compare_path}/Whole_VS_Grey/Alternative_Calc/ALFF"

##### Auditory Cortex

for c in ${cond[@]}; do

echo "${c} ALFF of the mean time series Auditory Cortex VS AC Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/ALFF/AC/allsubs-${c}-MTS-ALFF-AC.txt ${grey_alt_ALFF}/AC/allsubs-${c}-MTS-ALFF-AC-grey.txt | column -s $'\t' -t > ${WhGM_alt_ALFF}/${c}-AC-wholeVgm-alt-ALFF.txt
cat ${WhGM_alt_ALFF}/${c}-AC-wholeVgm-alt-ALFF.txt
done
 

##### Planum Temporale

for c in ${cond[@]}; do

echo " ${c} ALFF of the mean time series Planum Temporale VS PT Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/ALFF/PT/allsubs-${c}-MTS-ALFF-PT.txt ${grey_alt_ALFF}/PT/allsubs-${c}-MTS-ALFF-PT-grey.txt | column -s $'\t' -t > ${WhGM_alt_ALFF}/${c}-PT-wholeVgm-alt-ALFF.txt
cat ${WhGM_alt_ALFF}/${c}-PT-wholeVgm-alt-ALFF.txt
done


##### Heschl's Gyrus

for c in ${cond[@]}; do

echo "${c} ALFF of the mean time series Heschl's Gyrus VS HG Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/ALFF/HG/allsubs-${c}-MTS-ALFF-HG.txt ${grey_alt_ALFF}/HG/allsubs-${c}-MTS-ALFF-HG-grey.txt | column -s $'\t' -t > ${WhGM_alt_ALFF}/${c}-HG-wholeVgm-alt-ALFF.txt
cat ${WhGM_alt_ALFF}/${c}-HG-wholeVgm-alt-ALFF.txt
done


##### Primary Visual Cortex

for c in ${cond[@]}; do

echo "${c} ALFF of the mean time series Primary Visual Cortex VS V1 Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/ALFF/V1/allsubs-${c}-MTS-ALFF-V1.txt ${grey_alt_ALFF}/V1/allsubs-${c}-MTS-ALFF-V1-grey.txt | column -s $'\t' -t > ${WhGM_alt_ALFF}/${c}-V1-wholeVgm-alt-ALFF.txt
cat ${WhGM_alt_ALFF}/${c}-V1-wholeVgm-alt-ALFF.txt
done


################### Repeat for the alternative calculation of fALFF
 
mkdir -p ${compare_path}/Whole_VS_Grey/Alternative_Calc/fALFF
WhGM_alt_fALFF="${compare_path}/Whole_VS_Grey/Alternative_Calc/fALFF"

##### Auditory Cortex

for c in ${cond[@]}; do

echo "${c} fALFF of the mean time series in Auditory Cortex VS AC Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/fALFF/AC/allsubs-${c}-MTS-fALFF-AC.txt ${grey_alt_fALFF}/AC/allsubs-${c}-MTS-fALFF-AC-grey.txt | column -s $'\t' -t > ${WhGM_alt_fALFF}/${c}-AC-wholeVgm-alt-fALFF.txt
cat ${WhGM_alt_fALFF}/${c}-AC-wholeVgm-alt-fALFF.txt
done


##### Planum Temporale

for c in ${cond[@]}; do

echo "${c} fALFF of the mean time series in Planum Temporale VS PT Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/fALFF/PT/allsubs-${c}-MTS-fALFF-PT.txt ${grey_alt_fALFF}/PT/allsubs-${c}-MTS-fALFF-PT-grey.txt | column -s $'/t' -t > ${WhGM_alt_fALFF}/${c}-PT-wholeVgm-alt-fALFF.txt
cat ${WhGM_alt_fALFF}/${c}-PT-wholeVgm-alt-fALFF.txt
done


##### Heschl's Gyrus

for c in ${cond[@]}; do

echo "${c} fALFF of the mean time series in Heschl's Gyrus VS HG Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/fALFF/HG/allsubs-${c}-MTS-fALFF-HG.txt ${grey_alt_fALFF}/HG/allsubs-${c}-MTS-fALFF-HG-grey.txt | column -s $'\t' -t > ${WhGM_alt_fALFF}/${c}-HG-wholeVgm-alt-fALFF.txt
cat ${WhGM_alt_fALFF}/${c}-HG-wholeVgm-alt-fALFF.txt
done


##### Primary Visual Cortex

for c in ${cond[@]}; do

echo "${c} fALFF of the mean time series in Primary Visual Cortex VS V1 Grey Matter"
paste ${compare_path}/subj_list.txt ${alt_analysis_path}/fALFF/V1/allsubs-${c}-MTS-fALFF-V1.txt ${grey_alt_fALFF}/V1/allsubs-${c}-MTS-fALFF-V1-grey.txt | column -s $'\t' -t > ${WhGM_alt_fALFF}/${c}-V1-wholeVgm-alt-fALFF.txt
cat ${WhGM_alt_fALFF}/${c}-V1-wholeVgm-alt-fALFF.txt
done
