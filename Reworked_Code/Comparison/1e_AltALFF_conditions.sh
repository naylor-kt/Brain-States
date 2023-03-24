#!/bin/bash
cond=(as ns vs)
data_path="$HOME/BrainStates_Test"
mkdir -p $HOME/BrainStates_Test/Alternative_Analysis/Compare_Conditions
compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Compare_Conditions"

alt_ALFF="$HOME/BrainStates_Test/Alternative_Analysis/ALFF"
alt_fALFF="$HOME/BrainStates_Test/Alternative_Analysis/fALFF"

grey_alt_ALFF="$HOME/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs"
grey_alt_fALFF="$HOME/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs"


##### Auditory Cortex
mkdir -p ${compare_path}/ALFF/AC

echo "ALFF in the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/AC/allsubs-as-MTS-ALFF-AC.txt ${alt_ALFF}/AC/allsubs-ns-MTS-ALFF-AC.txt ${alt_ALFF}/AC/allsubs-vs-MTS-ALFF-AC.txt | column -s $'\t' -t > ${compare_path}/ALFF/AC/allsubs-AC-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/AC/allsubs-AC-as-ns-vs-MTS-ALFF-compare.txt


##### Auditory Cortex
mkdir -p ${compare_path}/ALFF/Grey_Matter_ROIs/AC

echo "ALFF in the grey matter of the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_ALFF}/AC/allsubs-as-MTS-ALFF-AC-grey.txt ${grey_alt_ALFF}/AC/allsubs-ns-MTS-ALFF-AC-grey.txt ${grey_alt_ALFF}/AC/allsubs-vs-MTS-ALFF-AC-grey.txt | column -s $'\t' -t > ${compare_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-MTS-ALFF-compare.txt


##### Heschl's Gyrus
mkdir -p ${compare_path}/ALFF/HG

echo "ALFF in the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/HG/allsubs-as-MTS-ALFF-HG.txt ${alt_ALFF}/HG/allsubs-ns-MTS-ALFF-HG.txt ${alt_ALFF}/HG/allsubs-vs-MTS-ALFF-HG.txt | column -s $'\t' -t > ${compare_path}/ALFF/HG/allsubs-HG-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/HG/allsubs-HG-as-ns-vs-MTS-ALFF-compare.txt


##### Heschl's Gyrus
mkdir -p ${compare_path}/ALFF/Grey_Matter_ROIs/HG

echo "ALFF in the grey matter of the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_ALFF}/HG/allsubs-as-MTS-ALFF-HG-grey.txt ${grey_alt_ALFF}/HG/allsubs-ns-MTS-ALFF-HG-grey.txt ${grey_alt_ALFF}/HG/allsubs-vs-MTS-ALFF-HG-grey.txt | column -s $'\t' -t > ${compare_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-MTS-ALFF-compare.txt

##### Planum Temporale
mkdir -p ${compare_path}/ALFF/PT

echo "ALFF in the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/PT/allsubs-as-MTS-ALFF-PT.txt ${alt_ALFF}/PT/allsubs-ns-MTS-ALFF-PT.txt ${alt_ALFF}/PT/allsubs-vs-MTS-ALFF-PT.txt | column -s $'\t' -t > ${compare_path}/ALFF/PT/allsubs-PT-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/PT/allsubs-PT-as-ns-vs-MTS-ALFF-compare.txt


##### Planum Temporale
mkdir -p ${compare_path}/ALFF/Grey_Matter_ROIs/PT

echo "ALFF in the grey matter of the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_ALFF}/PT/allsubs-as-MTS-ALFF-PT-grey.txt ${grey_alt_ALFF}/PT/allsubs-ns-MTS-ALFF-PT-grey.txt ${grey_alt_ALFF}/PT/allsubs-vs-MTS-ALFF-PT-grey.txt | column -s $'\t' -t > ${compare_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-MTS-ALFF-compare.txt

##### Primary Visual Cortex
mkdir -p ${compare_path}/ALFF/V1

echo "ALFF in the Primary Visual Cortex as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/V1/allsubs-as-MTS-ALFF-V1.txt ${alt_ALFF}/V1/allsubs-ns-MTS-ALFF-V1.txt ${alt_ALFF}/V1/allsubs-vs-MTS-ALFF-V1.txt | column -s $'\t' -t > ${compare_path}/ALFF/V1/allsubs-V1-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/V1/allsubs-V1-as-ns-vs-MTS-ALFF-compare.txt


##### Primary Visual Cortex
mkdir -p ${compare_path}/ALFF/Grey_Matter_ROIs/V1

echo "ALFF in the grey matter of the Primary Visual Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_ALFF}/V1/allsubs-as-MTS-ALFF-V1-grey.txt ${grey_alt_ALFF}/V1/allsubs-ns-MTS-ALFF-V1-grey.txt ${grey_alt_ALFF}/V1/allsubs-vs-MTS-ALFF-V1-grey.txt | column -s $'\t' -t > ${compare_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-MTS-ALFF-compare.txt


##### Thalmus
mkdir -p ${compare_path}/ALFF/Thal

echo "ALFF in the Thalamus as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/Thal/allsubs-as-MTS-ALFF-Thal.txt ${alt_ALFF}/Thal/allsubs-ns-MTS-ALFF-Thal.txt ${alt_ALFF}/Thal/allsubs-vs-MTS-ALFF-Thal.txt | column -s $'\t' -t > ${compare_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/Thal/allsubs-Thal-as-ns-vs-MTS-ALFF-compare.txt

##### Medial Geniculate Body
mkdir -p ${compare_path}/ALFF/MGB

echo "ALFF in the Medial Geniculate Body  as ns vs"

paste ${data_path}/subj_list.txt ${alt_ALFF}/MGB/allsubs-as-MTS-ALFF-MGB.txt ${alt_ALFF}/MGB/allsubs-ns-MTS-ALFF-MGB.txt ${alt_ALFF}/MGB/allsubs-vs-MTS-ALFF-MGB.txt | column -s $'\t' -t > ${compare_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-MTS-ALFF-compare.txt

# cat ${compare_path}/ALFF/MGB/allsubs-MGB-as-ns-vs-MTS-ALFF-compare.txt

### Repeat this for fALFF

##### Auditory Cortex
mkdir -p ${compare_path}/fALFF/AC

echo "fALFF in the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/AC/allsubs-as-MTS-fALFF-AC.txt ${alt_fALFF}/AC/allsubs-ns-MTS-fALFF-AC.txt ${alt_fALFF}/AC/allsubs-vs-MTS-fALFF-AC.txt | column -s $'\t' -t > ${compare_path}/fALFF/AC/allsubs-AC-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/AC/allsubs-AC-as-ns-vs-MTS-fALFF-compare.txt


##### Auditory Cortex
mkdir -p ${compare_path}/fALFF/Grey_Matter_ROIs/AC

echo "fALFF in the grey matter of the Auditory Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_fALFF}/AC/allsubs-as-MTS-fALFF-AC-grey.txt ${grey_alt_fALFF}/AC/allsubs-ns-MTS-fALFF-AC-grey.txt ${grey_alt_fALFF}/AC/allsubs-vs-MTS-fALFF-AC-grey.txt | column -s $'\t' -t > ${compare_path}/fALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-MTS-fALFF-compare.txt


##### Heschl's Gyrus
mkdir -p ${compare_path}/fALFF/HG

echo "fALFF in the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/HG/allsubs-as-MTS-fALFF-HG.txt ${alt_fALFF}/HG/allsubs-ns-MTS-fALFF-HG.txt ${alt_fALFF}/HG/allsubs-vs-MTS-fALFF-HG.txt | column -s $'\t' -t > ${compare_path}/fALFF/HG/allsubs-HG-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/HG/allsubs-HG-as-ns-vs-MTS-fALFF-compare.txt


##### Auditory Cortex
mkdir -p ${compare_path}/fALFF/Grey_Matter_ROIs/HG

echo "fALFF in the grey matter of the Heschl's Gyrus as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_fALFF}/HG/allsubs-as-MTS-fALFF-HG-grey.txt ${grey_alt_fALFF}/HG/allsubs-ns-MTS-fALFF-HG-grey.txt ${grey_alt_fALFF}/HG/allsubs-vs-MTS-fALFF-HG-grey.txt | column -s $'\t' -t > ${compare_path}/fALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-MTS-fALFF-compare.txt


##### Planum Temporale
mkdir -p ${compare_path}/fALFF/PT

echo "fALFF in the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/PT/allsubs-as-MTS-fALFF-PT.txt ${alt_fALFF}/PT/allsubs-ns-MTS-fALFF-PT.txt ${alt_fALFF}/PT/allsubs-vs-MTS-fALFF-PT.txt | column -s $'\t' -t > ${compare_path}/fALFF/PT/allsubs-PT-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/PT/allsubs-PT-as-ns-vs-MTS-fALFF-compare.txt


##### Planum Temporale
mkdir -p ${compare_path}/fALFF/Grey_Matter_ROIs/PT

echo "fALFF in the grey matter of the Planum Temporale as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_fALFF}/PT/allsubs-as-MTS-fALFF-PT-grey.txt ${grey_alt_fALFF}/PT/allsubs-ns-MTS-fALFF-PT-grey.txt ${grey_alt_fALFF}/PT/allsubs-vs-MTS-fALFF-PT-grey.txt | column -s $'\t' -t > ${compare_path}/fALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-MTS-fALFF-compare.txt

##### Primary Visual Cortex
mkdir -p ${compare_path}/fALFF/V1

echo "fALFF in the Primary Visual Cortex  as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/V1/allsubs-as-MTS-fALFF-V1.txt ${alt_fALFF}/V1/allsubs-ns-MTS-fALFF-V1.txt ${alt_fALFF}/V1/allsubs-vs-MTS-fALFF-V1.txt | column -s $'\t' -t > ${compare_path}/fALFF/V1/allsubs-V1-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/V1/allsubs-V1-as-ns-vs-MTS-fALFF-compare.txt


##### Primary Visual Cortex
mkdir -p ${compare_path}/fALFF/Grey_Matter_ROIs/V1

echo "fALFF in the grey matter of the Primary Visual Cortex as ns vs"

paste ${data_path}/subj_list.txt ${grey_alt_fALFF}/V1/allsubs-as-MTS-fALFF-V1-grey.txt ${grey_alt_fALFF}/V1/allsubs-ns-MTS-fALFF-V1-grey.txt ${grey_alt_fALFF}/V1/allsubs-vs-MTS-fALFF-V1-grey.txt | column -s $'\t' -t > ${compare_path}/fALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-MTS-fALFF-compare.txt


##### Thalamus
mkdir -p ${compare_path}/fALFF/Thal

echo "fALFF in the Thalamus  as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/Thal/allsubs-as-MTS-fALFF-Thal.txt ${alt_fALFF}/Thal/allsubs-ns-MTS-fALFF-Thal.txt ${alt_fALFF}/Thal/allsubs-vs-MTS-fALFF-Thal.txt | column -s $'\t' -t > ${compare_path}/fALFF/Thal/allsubs-Thal-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/Thal/allsubs-Thal-as-ns-vs-MTS-fALFF-compare.txt

##### Medial Geniculate Body
mkdir -p ${compare_path}/fALFF/MGB

echo "fALFF in the Medial Geniculate Body  as ns vs"

paste ${data_path}/subj_list.txt ${alt_fALFF}/MGB/allsubs-as-MTS-fALFF-MGB.txt ${alt_fALFF}/MGB/allsubs-ns-MTS-fALFF-MGB.txt ${alt_fALFF}/MGB/allsubs-vs-MTS-fALFF-MGB.txt | column -s $'\t' -t > ${compare_path}/fALFF/MGB/allsubs-MGB-as-ns-vs-MTS-fALFF-compare.txt

# cat ${compare_path}/fALFF/MGB/allsubs-MGB-as-ns-vs-MTS-fALFF-compare.txt
