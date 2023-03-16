#!/bin/bash
cond=(as ns vs)

data_path="$HOME/BrainStates_Test"
analysis_path="$HOME/BrainStates_Test/Analysis"

mkdir -p ${analysis_path}/Compare_Conditions/Z-Transformed
cc_path="$HOME/BrainStates_Test/Analysis/Compare_Conditions/Z-Transformed"

grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"



########### Compare Mean ALFF in a region across the conditions

##### Whole Brain
mkdir -p ${cc_path}/ALFF/Whole_Brain

echo "ALFF in whole Brain as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/Whole_Brain/allsubs-as-meanALFF-Z.txt ${analysis_path}/ALFF/Whole_Brain/allsubs-ns-meanALFF-Z.txt ${analysis_path}/ALFF/Whole_Brain/allsubs-vs-meanALFF-Z.txt | column -s $'\t' -t > ${cc_path}/ALFF/Whole_Brain/allsubs-WholeBrain-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Whole_Brain/allsubs-WholeBrain-as-ns-vs-ALFF-Z-compare.txt

##### AUDITORY CORTEX
mkdir -p ${cc_path}/ALFF/AC

echo "ALFF in whole Auditory Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/AC/allsubs-as-meanALFF-Z-AC.txt ${analysis_path}/ALFF/AC/allsubs-ns-meanALFF-Z-AC.txt ${analysis_path}/ALFF/AC/allsubs-vs-meanALFF-Z-AC.txt | column -s $'\t' -t > ${cc_path}/ALFF/AC/allsubs-AC-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/AC/allsubs-AC-as-ns-vs-ALFF-Z-compare.txt

##### AUDITORY CORTEX GREY MATTER
mkdir -p ${cc_path}/ALFF/AC

echo "ALFF in Auditory Cortex grey matter as ns vs"
paste ${data_path}/subj_list.txt ${grey_ALFF}/AC/allsubs-as-ALFF-AC-grey-Z.txt ${grey_ALFF}/AC/allsubs-ns-ALFF-AC-grey-Z.txt ${grey_ALFF}/AC/allsubs-vs-ALFF-AC-grey-Z.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ALFF-Z-compare.txt


##### HESCHL'S GYRUS
mkdir -p ${cc_path}/ALFF/HG

echo "ALFF in whole Heschl's Gyrus as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/HG/allsubs-as-meanALFF-Z-HG.txt ${analysis_path}/ALFF/HG/allsubs-ns-meanALFF-Z-HG.txt ${analysis_path}/ALFF/HG/allsubs-vs-meanALFF-Z-HG.txt | column -s $'\t' -t > ${cc_path}/ALFF/HG/allsubs-HG-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/HG/allsubs-HG-as-ns-vs-ALFF-Z-compare.txt

##### HESCHL'S GYRUS GREY MATTER
mkdir -p ${cc_path}/ALFF/HG

echo "ALFF in Heschl's Gyrus grey matter as ns vs"
paste ${data_path}/subj_list.txt ${grey_ALFF}/HG/allsubs-as-ALFF-HG-grey-Z.txt ${grey_ALFF}/HG/allsubs-ns-ALFF-HG-grey-Z.txt ${grey_ALFF}/HG/allsubs-vs-ALFF-HG-grey-Z.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ALFF-Z-compare.txt

##### PLANUM TEMPORALE
mkdir -p ${cc_path}/ALFF/PT

echo "ALFF in whole Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/PT/allsubs-as-meanALFF-Z-PT.txt ${analysis_path}/ALFF/PT/allsubs-ns-meanALFF-Z-PT.txt ${analysis_path}/ALFF/PT/allsubs-vs-meanALFF-Z-PT.txt | column -s $'\t' -t > ${cc_path}/ALFF/PT/allsubs-PT-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/PT/allsubs-PT-as-ns-vs-ALFF-Z-compare.txt

##### PLANUM TEMPORALE GREY MATTER
mkdir -p ${cc_path}/ALFF/PT

echo "ALFF in whole Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${grey_ALFF}/PT/allsubs-as-ALFF-PT-grey-Z.txt ${grey_ALFF}/PT/allsubs-ns-ALFF-PT-grey-Z.txt ${grey_ALFF}/PT/allsubs-vs-ALFF-PT-grey-Z.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ALFF-Z-compare.txt

##### PRIMARY VISUAL CORTEXX
mkdir -p ${cc_path}/ALFF/V1

echo "ALFF in whole Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/V1/allsubs-as-meanALFF-Z-V1.txt ${analysis_path}/ALFF/V1/allsubs-ns-meanALFF-Z-V1.txt ${analysis_path}/ALFF/V1/allsubs-vs-meanALFF-Z-V1.txt | column -s $'\t' -t > ${cc_path}/ALFF/V1/allsubs-V1-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/V1/allsubs-V1-as-ns-vs-ALFF-Z-compare.txt

##### PRIMARY VISUAL CORTEX GREY MATTER
mkdir -p ${cc_path}/ALFF/PT

echo "ALFF in whole Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${grey_ALFF}/V1/allsubs-as-ALFF-V1-grey-Z.txt ${grey_ALFF}/V1/allsubs-ns-ALFF-V1-grey-Z.txt ${grey_ALFF}/V1/allsubs-vs-ALFF-V1-grey-Z.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ALFF-Z-compare.txt

##### THALAMUS
mkdir -p ${cc_path}/ALFF/Thal

echo "ALFF in whole Thal as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/Thal/allsubs-as-meanALFF-Z-Thal.txt ${analysis_path}/ALFF/Thal/allsubs-ns-meanALFF-Z-Thal.txt ${analysis_path}/ALFF/Thal/allsubs-vs-meanALFF-Z-Thal.txt | column -s $'\t' -t > ${cc_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-ALFF-Z-compare.txt

##### MEDIAL GENICULATE BODY
mkdir -p ${cc_path}/ALFF/MGB

echo "ALFF in whole MGB as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/MGB/allsubs-as-meanALFF-Z-MGB.txt ${analysis_path}/ALFF/MGB/allsubs-ns-meanALFF-Z-MGB.txt ${analysis_path}/ALFF/MGB/allsubs-vs-meanALFF-Z-MGB.txt | column -s $'\t' -t > ${cc_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-ALFF-Z-compare.txt

# cat ${cc_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-ALFF-Z-compare.txt

