#!/bin/bash
cond=(as ns vs)

data_path="$HOME/BrainStates_Test"
analysis_path="$HOME/BrainStates_Test/Analysis"

mkdir -p ${analysis_path}/Compare_Conditions
cc_path="$HOME/BrainStates_Test/Analysis/Compare_Conditions"




grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"



########### Compare Mean ALFF in a region across the conditions

##### Auditory Cortex
mkdir -p ${cc_path}/ALFF/AC

echo "ALFF in whole Auditory Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/AC/allsubs-as-meanALFF-AC.txt ${analysis_path}/ALFF/AC/allsubs-ns-meanALFF-AC.txt ${analysis_path}/ALFF/AC/allsubs-vs-meanALFF-AC.txt | column -s $'\t' -t > ${cc_path}/ALFF/AC/allsubs-AC-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/AC/allsubs-AC-as-ns-vs-ALFF-compare.txt

##### Auditory Cortex Grey Matter
mkdir -p ${cc_path}/ALFF/Grey_Matter_ROIs/AC

echo "ALFF in the grey matter of the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_ALFF}/AC/allsubs-as-ALFF-AC-grey.txt ${grey_ALFF}/AC/allsubs-ns-ALFF-AC-grey.txt ${grey_ALFF}/AC/allsubs-vs-ALFF-AC-grey.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ALFF-compare.txt

##### Planum Temporale
mkdir -p ${cc_path}/ALFF/PT

echo "ALFF in whole Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/PT/allsubs-as-meanALFF-PT.txt ${analysis_path}/ALFF/PT/allsubs-ns-meanALFF-PT.txt ${analysis_path}/ALFF/PT/allsubs-vs-meanALFF-PT.txt | column -s $'\t' -t > ${cc_path}/ALFF/PT/allsubs-PT-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/PT/allsubs-PT-as-ns-vs-ALFF-compare.txt


##### Planum Temporale Grey Matter
mkdir -p ${cc_path}/ALFF/Grey_Matter_ROIs/PT

echo "ALFF in the grey matter of the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${grey_ALFF}/PT/allsubs-as-ALFF-PT-grey.txt ${grey_ALFF}/PT/allsubs-ns-ALFF-PT-grey.txt ${grey_ALFF}/PT/allsubs-vs-ALFF-PT-grey.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ALFF-compare.txt


##### Heschl's Gyrus
mkdir -p ${cc_path}/ALFF/HG

echo "ALFF in whole Heschl's Gyrus as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/HG/allsubs-as-meanALFF-HG.txt ${analysis_path}/ALFF/HG/allsubs-ns-meanALFF-HG.txt ${analysis_path}/ALFF/HG/allsubs-vs-meanALFF-HG.txt | column -s $'\t' -t > ${cc_path}/ALFF/HG/allsubs-HG-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/HG/allsubs-HG-as-ns-vs-ALFF-compare.txt


##### Heschl's Gyrus Grey Matter
mkdir -p ${cc_path}/ALFF/Grey_Matter_ROIs/HG

echo "ALFF in the grey matter of the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${grey_ALFF}/HG/allsubs-as-ALFF-HG-grey.txt ${grey_ALFF}/HG/allsubs-ns-ALFF-HG-grey.txt ${grey_ALFF}/HG/allsubs-vs-ALFF-HG-grey.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ALFF-compare.txt


##### Primary Visual Cortex
mkdir -p ${cc_path}/ALFF/V1

echo "ALFF in whole Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/V1/allsubs-as-meanALFF-V1.txt ${analysis_path}/ALFF/V1/allsubs-ns-meanALFF-V1.txt ${analysis_path}/ALFF/V1/allsubs-vs-meanALFF-V1.txt | column -s $'\t' -t > ${cc_path}/ALFF/V1/allsubs-V1-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/V1/allsubs-V1-as-ns-vs-ALFF-compare.txt


##### Heschl's Gyrus Grey Matter
mkdir -p ${cc_path}/ALFF/Grey_Matter_ROIs/V1

echo "ALFF in the grey matter of the Primary Visual Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_ALFF}/V1/allsubs-as-ALFF-V1-grey.txt ${grey_ALFF}/V1/allsubs-ns-ALFF-V1-grey.txt ${grey_ALFF}/V1/allsubs-vs-ALFF-V1-grey.txt | column -s $'\t' -t > ${cc_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ALFF-compare.txt


##### Thalamus
mkdir -p ${cc_path}/ALFF/Thal

echo "ALFF in whole Thalamus as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/Thal/allsubs-as-meanALFF-Thal.txt ${analysis_path}/ALFF/Thal/allsubs-ns-meanALFF-Thal.txt ${analysis_path}/ALFF/Thal/allsubs-vs-meanALFF-Thal.txt | column -s $'\t' -t > ${cc_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-ALFF-compare.txt


##### Medial Geniculate Body
mkdir -p ${cc_path}/ALFF/MGB

echo "ALFF in whole Medial Geniculate Body as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/ALFF/MGB/allsubs-as-meanALFF-MGB.txt ${analysis_path}/ALFF/MGB/allsubs-ns-meanALFF-MGB.txt ${analysis_path}/ALFF/MGB/allsubs-vs-meanALFF-MGB.txt | column -s $'\t' -t > ${cc_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-ALFF-compare.txt

# cat ${cc_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-ALFF-compare.txt


########################################################################################################################################################################
#################################################### Compare Mean fALFF in a region across the conditions ##############################################################

##### Auditory Cortex
mkdir -p ${cc_path}/fALFF/AC

echo "fALFF in whole Auditory Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/AC/allsubs-as-meanfALFF-AC.txt ${analysis_path}/fALFF/AC/allsubs-ns-meanfALFF-AC.txt ${analysis_path}/fALFF/AC/allsubs-vs-meanfALFF-AC.txt | column -s $'\t' -t > ${cc_path}/fALFF/AC/allsubs-AC-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/AC/allsubs-AC-as-ns-vs-fALFF-compare.txt

##### Auditory Cortex Grey Matter
mkdir -p ${cc_path}/fALFF/Grey_Matter_ROIs/AC

echo "fALFF in the grey matter of the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_fALFF}/AC/allsubs-as-fALFF-AC-grey.txt ${grey_fALFF}/AC/allsubs-ns-fALFF-AC-grey.txt ${grey_fALFF}/AC/allsubs-vs-fALFF-AC-grey.txt | column -s $'\t' -t > ${cc_path}/fALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-fALFF-compare.txt

##### Planum Temporale
mkdir -p ${cc_path}/fALFF/PT

echo "fALFF in whole Planum Temporale as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/PT/allsubs-as-meanfALFF-PT.txt ${analysis_path}/fALFF/PT/allsubs-ns-meanfALFF-PT.txt ${analysis_path}/fALFF/PT/allsubs-vs-meanfALFF-PT.txt | column -s $'\t' -t > ${cc_path}/fALFF/PT/allsubs-PT-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/PT/allsubs-PT-as-ns-vs-fALFF-compare.txt


##### Planum Temporale Grey Matter
mkdir -p ${cc_path}/fALFF/Grey_Matter_ROIs/PT

echo "fALFF in the grey matter of the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${grey_fALFF}/PT/allsubs-as-fALFF-PT-grey.txt ${grey_fALFF}/PT/allsubs-ns-fALFF-PT-grey.txt ${grey_fALFF}/PT/allsubs-vs-fALFF-PT-grey.txt | column -s $'\t' -t > ${cc_path}/fALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-fALFF-compare.txt


##### Heschl's Gyrus
mkdir -p ${cc_path}/fALFF/HG

echo "fALFF in whole Heschl's Gyrus as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/HG/allsubs-as-meanfALFF-HG.txt ${analysis_path}/fALFF/HG/allsubs-ns-meanfALFF-HG.txt ${analysis_path}/fALFF/HG/allsubs-vs-meanfALFF-HG.txt | column -s $'\t' -t > ${cc_path}/fALFF/HG/allsubs-HG-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/HG/allsubs-HG-as-ns-vs-fALFF-compare.txt


##### Heschl's Gyrus Grey Matter
mkdir -p ${cc_path}/fALFF/Grey_Matter_ROIs/HG

echo "fALFF in the grey matter of the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${grey_fALFF}/HG/allsubs-as-fALFF-HG-grey.txt ${grey_fALFF}/HG/allsubs-ns-fALFF-HG-grey.txt ${grey_fALFF}/HG/allsubs-vs-fALFF-HG-grey.txt | column -s $'\t' -t > ${cc_path}/fALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-fALFF-compare.txt


##### Primary Visual Cortex
mkdir -p ${cc_path}/fALFF/V1

echo "fALFF in whole Primary Visual Cortex as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/V1/allsubs-as-meanfALFF-V1.txt ${analysis_path}/fALFF/V1/allsubs-ns-meanfALFF-V1.txt ${analysis_path}/fALFF/V1/allsubs-vs-meanfALFF-V1.txt | column -s $'\t' -t > ${cc_path}/fALFF/V1/allsubs-V1-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/V1/allsubs-V1-as-ns-vs-fALFF-compare.txt


##### Heschl's Gyrus Grey Matter
mkdir -p ${cc_path}/fALFF/Grey_Matter_ROIs/V1

echo "fALFF in the grey matter of the Primary Visual Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_fALFF}/V1/allsubs-as-fALFF-V1-grey.txt ${grey_fALFF}/V1/allsubs-ns-fALFF-V1-grey.txt ${grey_fALFF}/V1/allsubs-vs-fALFF-V1-grey.txt | column -s $'\t' -t > ${cc_path}/fALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-fALFF-compare.txt


##### Thalamus
mkdir -p ${cc_path}/fALFF/Thal

echo "fALFF in whole Thalamus as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/Thal/allsubs-as-meanfALFF-Thal.txt ${analysis_path}/fALFF/Thal/allsubs-ns-meanfALFF-Thal.txt ${analysis_path}/fALFF/Thal/allsubs-vs-meanfALFF-Thal.txt | column -s $'\t' -t > ${cc_path}/fALFF/Thal/allsubs-Thal-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/Thal/allsubs-Thal-as-ns-vs-fALFF-compare.txt


##### Medial Geniculate Body
mkdir -p ${cc_path}/fALFF/MGB

echo "fALFF in whole Medial Geniculate Body as ns vs"
paste ${data_path}/subj_list.txt ${analysis_path}/fALFF/MGB/allsubs-as-meanfALFF-MGB.txt ${analysis_path}/fALFF/MGB/allsubs-ns-meanfALFF-MGB.txt ${analysis_path}/fALFF/MGB/allsubs-vs-meanfALFF-MGB.txt | column -s $'\t' -t > ${cc_path}/fALFF/MGB/allsubs-MGB-as-ns-vs-fALFF-compare.txt

# cat ${cc_path}/fALFF/MGB/allsubs-MGB-as-ns-vs-fALFF-compare.txt
