#!/bin/bash
cond=(as ns vs)

MTS_path="$HOME/BrainStates_Test/Mean_Time_Series"
mask_path="$HOME/BrainStates_Test/Mask"
compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison"
grey_compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs"

analysis_path="$HOME/BrainStates_Test/Analysis"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis"
compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison"


#### Clearly show the difference between the two versions of calculating ALFF

### Auditory Cortex
for c in ${cond[@]}; do
mkdir -p ${compare_path}/AC

echo "${c} Auditory Cortex ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/AC/allsubs-${c}-meanALFF-AC.txt ${alt_analysis_path}/ALFF/AC/allsubs-${c}-MTS-ALFF-AC.txt | column -s $'\t' -t > ${compare_path}/AC/${c}-AC_ALFF_comparison.txt
cat ${compare_path}/AC/${c}-AC_ALFF_comparison.txt
done


### Heschl's Gyrus
for c in ${cond[@]}; do
mkdir -p ${compare_path}/HG

echo "${c} Heschl's Gyrus ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/HG/allsubs-${c}-meanALFF-HG.txt ${alt_analysis_path}/ALFF/HG/allsubs-${c}-MTS-ALFF-HG.txt | column -s $'\t' -t > ${compare_path}/HG/${c}-HG_ALFF_comparison.txt
cat ${compare_path}/HG/${c}-HG_ALFF_comparison.txt
done

## Planum Temporale
for c in ${cond[@]}; do
mkdir -p ${compare_path}/PT

echo "${c} Planum Temporale ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/PT/allsubs-${c}-meanALFF-PT.txt ${alt_analysis_path}/ALFF/PT/allsubs-${c}-MTS-ALFF-PT.txt | column -s $'\t' -t > ${compare_path}/PT/${c}-PT_ALFF_comparison.txt
cat ${compare_path}/PT/${c}-PT_ALFF_comparison.txt
done

### Primary Visual Cortex
for c in ${cond[@]}; do
mkdir -p ${compare_path}/V1

echo "${c} Primary Visual Cortex ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/V1/allsubs-${c}-meanALFF-V1.txt ${alt_analysis_path}/ALFF/V1/allsubs-${c}-MTS-ALFF-V1.txt | column -s $'\t' -t > ${compare_path}/V1/${c}-V1_ALFF_comparison.txt
cat ${compare_path}/V1/${c}-V1_ALFF_comparison.txt
done


### Medial Geniculate Body
for c in ${cond[@]}; do
mkdir -p ${compare_path}/MGB

echo "${c} Medial Geniculate Body ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/MGB/allsubs-${c}-meanALFF-MGB.txt ${alt_analysis_path}/ALFF/MGB/allsubs-${c}-MTS-ALFF-MGB.txt | column -s $'\t' -t > ${compare_path}/MGB/${c}-MGB_ALFF_comparison.txt
cat ${compare_path}/MGB/${c}-MGB_ALFF_comparison.txt
done

## Thalamus
for c in ${cond[@]}; do
mkdir -p ${compare_path}/Thal

echo "${c} Thalamus ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/ALFF/Thal/allsubs-${c}-meanALFF-Thal.txt ${alt_analysis_path}/ALFF/Thal/allsubs-${c}-MTS-ALFF-Thal.txt | column -s $'\t' -t > ${compare_path}/Thal/${c}-Thal_ALFF_comparison.txt
cat ${compare_path}/Thal/${c}-Thal_ALFF_comparison.txt
done

#### Clearly show the difference between the two versions of calculating fALFF

#for c in ${cond[@]}; do
#echo "${c} Whole Brain fALFF-->Mean VS Mean-->fALFF"
#paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/Whole_Brain/allsubs-${c}-meanfALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/allsubs-${c}-MTS-fALFF.txt | column -s $'\t' -t
#done

# Auditory Cortex
for c in ${cond[@]}; do

echo "${c} Auditory Cortex fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/AC/allsubs-${c}-meanfALFF-AC.txt ${alt_analysis_path}/fALFF/AC/allsubs-${c}-MTS-fALFF-AC.txt | column -s $'\t' -t > ${compare_path}/AC/${c}-AC_fALFF_comparison.txt
cat ${compare_path}/AC/${c}-AC_fALFF_comparison.txt
done

### Heschl's Gyrus
for c in ${cond[@]}; do
echo "${c} Heschel's Gyrus fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/HG/allsubs-${c}-meanfALFF-HG.txt ${alt_analysis_path}/fALFF/HG/allsubs-${c}-MTS-fALFF-HG.txt | column -s $'\t' -t > ${compare_path}/HG/${c}-HG_fALFF_comparison.txt
cat ${compare_path}/HG/${c}-HG_fALFF_comparison.txt
done

### Planum Temporale
for c in ${cond[@]}; do
echo "${c} Planum Temporale fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/PT/allsubs-${c}-meanfALFF-PT.txt ${alt_analysis_path}/fALFF/PT/allsubs-${c}-MTS-fALFF-PT.txt | column -s $'\t' -t > ${compare_path}/PT/${c}-PT_fALFF_comparison.txt
cat ${compare_path}/PT/${c}-PT_fALFF_comparison.txt
done

## Primary Visual Cortex
for c in ${cond[@]}; do
echo "Primary Visual Cortex fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/V1/allsubs-${c}-meanfALFF-V1.txt ${alt_analysis_path}/fALFF/V1/allsubs-${c}-MTS-fALFF-V1.txt | column -s $'\t' -t > ${compare_path}/V1/${c}-V1_fALFF_comparison.txt
cat ${compare_path}/V1/${c}-V1_fALFF_comparison.txt
done

## Medial Geniculate Body
for c in ${cond[@]}; do
echo "Medial Geniculate fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/MGB/allsubs-${c}-meanfALFF-MGB.txt ${alt_analysis_path}/fALFF/MGB/allsubs-${c}-MTS-fALFF-MGB.txt | column -s $'\t' -t > ${compare_path}/MGB/${c}-MGB_fALFF_comparison.txt
cat ${compare_path}/MGB/${c}-MGB_fALFF_comparison.txt
done

## Thalamus
for c in ${cond[@]}; do
echo "Thalamus fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${analysis_path}/fALFF/Thal/allsubs-${c}-meanfALFF-Thal.txt ${alt_analysis_path}/fALFF/Thal/allsubs-${c}-MTS-fALFF-Thal.txt | column -s $'\t' -t > ${compare_path}/Thal/${c}-Thal_fALFF_comparison.txt
cat ${compare_path}/Thal/${c}-Thal_fALFF_comparison.txt
done


##### Repeat this for the grey matter ROIs

cond=(as ns vs)
region_2=(AS HG PT V1)
grey_ALFF="$HOME/BrainStates_Test/Analysis/ALFF/Grey_Matter_ROIs"
grey_alt_ALFF="$HOME/BrainStates_Test/Alternative_Analysis/ALFF/Grey_Matter_ROIs"

grey_fALFF="$HOME/BrainStates_Test/Analysis/fALFF/Grey_Matter_ROIs"
grey_alt_fALFF="$HOME/BrainStates_Test/Alternative_Analysis/fALFF/Grey_Matter_ROIs"
         
## Auditory Cortex
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/AC

echo "Auditory Cortex Grey Matter ALFF-->mean VS Mean--> ALFF"
paste ${compare_path}/subj_list.txt ${grey_ALFF}/AC/allsubs-${c}-ALFF-AC-grey.txt ${grey_alt_ALFF}/AC/allsubs-${c}-MTS-ALFF-AC-grey.txt | column -s $'\t' -t > ${grey_compare_path}/AC/${c}-AC-ALFF-comparison.txt
cat ${grey_compare_path}/AC/${c}-AC-ALFF-comparison.txt
done


## Heschl's Gyrus
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/HG

echo "Heschl's Gyrus Grey Matter ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${grey_ALFF}/HG/allsubs-${c}-ALFF-HG-grey.txt ${grey_alt_ALFF}/HG/allsubs-${c}-MTS-ALFF-HG-grey.txt | column -s $'\t' -t > ${grey_compare_path}/HG/${c}-HG-ALFF-comparison.txt
cat ${grey_compare_path}/HG/${c}-HG-ALFF-comparison.txt
done


## Planum Temporale
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/PT

echo "Planum Temporale Grey Matter ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${grey_ALFF}/PT/allsubs-${c}-ALFF-PT-grey.txt ${grey_alt_ALFF}/PT/allsubs-${c}-MTS-ALFF-PT-grey.txt | column -s $'\t' -t > ${grey_compare_path}/PT/${c}-PT-ALFF-comparison.txt
cat ${grey_compare_path}/PT/${c}-PT-ALFF-comparison.txt
done


## Primary Visual Cortex
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/V1

echo "Primary Visual Cortex Grey Matter ALFF-->Mean VS Mean-->ALFF"
paste ${compare_path}/subj_list.txt ${grey_ALFF}/V1/allsubs-${c}-ALFF-V1-grey.txt ${grey_alt_ALFF}/V1/allsubs-${c}-MTS-ALFF-V1-grey.txt | column -s $'\t' -t > ${grey_compare_path}/V1/${c}-V1-ALFF-comparison.txt
cat ${grey_compare_path}/V1/${c}-V1-ALFF-comparison.txt
done


### fALFF

# Auditory Cortex
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/AC

echo "Auditory Cortex Grey Matter fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${grey_fALFF}/AC/allsubs-${c}-fALFF-AC-grey.txt ${grey_alt_fALFF}/AC/allsubs-${c}-MTS-fALFF-AC-grey.txt | column -s $'\t' -t > ${grey_compare_path}/AC/${c}-AC-fALFF-comparison.txt
cat ${grey_compare_path}/AC/${c}-AC-fALFF-comparison.txt
done


## Heschl's Gyrus
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/HG

echo "Heschl's Gyrus Grey Matter fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${grey_fALFF}/HG/allsubs-${c}-fALFF-HG-grey.txt ${grey_alt_fALFF}/HG/allsubs-${c}-MTS-fALFF-HG-grey.txt | column -s $'\t' -t > ${grey_compare_path}/HG/${c}-HG-fALFF-comparison.txt
cat ${grey_compare_path}/HG/${c}-HG-fALFF-comparison.txt
done


## Planum Temporale
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/PT

echo "Planum Temporale Grey Matter fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${grey_fALFF}/PT/allsubs-${c}-fALFF-PT-grey.txt ${grey_alt_fALFF}/PT/allsubs-${c}-MTS-fALFF-PT-grey.txt | column -s $'\t' -t > ${grey_compare_path}/PT/${c}-PT-fALFF-comparison.txt
cat ${grey_compare_path}/PT/${c}-PT-fALFF-comparison.txt
done


## Primary Visual Cortex
for c in ${cond[@]}; do
mkdir -p ${grey_compare_path}/V1

echo "Primary Visual Cortex Grey Matter fALFF-->Mean VS Mean-->fALFF"
paste ${compare_path}/subj_list.txt ${grey_fALFF}/V1/allsubs-${c}-fALFF-V1-grey.txt ${grey_alt_fALFF}/V1/allsubs-${c}-MTS-fALFF-V1-grey.txt | column -s $'\t' -t > ${grey_compare_path}/V1/${c}-V1-fALFF-comparison.txt
cat ${grey_compare_path}/V1/${c}-V1-fALFF-comparison.txt
done





























########## IF you want the single subject comparisons #################

for c in ${cond[@]}; do

    mkdir -p ${compare_path}/ALFF/Whole_Brain/${s}

    echo "${s}-${c} Comparisons on Whole Brain ALFF --> Mean OR Mean --> ALFF"

    cat ${analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-meanALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/${s}/${s}-${c}-MTS-ALFF.txt > ${compare_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-compare.txt
    
    cat ${compare_path}/ALFF/Whole_Brain/${s}/${s}-${c}-ALFF-compare.txt
    
    # Compare the different ways of calculating ALFF in the ROIs (As this is a lot more relevant)
    
    ########### AC ##########
        mkdir -p ${compare_path}/ALFF/AC/${s}
    
        echo "${s}-${c} Comparisons on AC ALFF --> Mean OR Mean --> ALFF"
  
        cat ${analysis_path}/ALFF/Auditory_Cortex/${s}/${s}-${c}-meanALFF-AC.txt ${alt_analysis_path}/ALFF/AC/${s}/${s}-${c}-MTS-ALFF-AC.txt > ${compare_path}/ALFF/AC/${s}/${s}-${c}-ALFF-AC-compare.txt
        
        cat ${compare_path}/ALFF/AC/${s}/${s}-${c}-ALFF-AC-compare.txt
  
    ########### HG ##########
        mkdir -p ${compare_path}/ALFF/HG/${s}
    
        echo "${s}-${c} Comparisons on HG ALFF --> Mean OR Mean --> ALFF"
  
        cat ${analysis_path}/ALFF/Heschls_Gyrus/${s}/${s}-${c}-meanALFF-HG.txt ${alt_analysis_path}/ALFF/HG/${s}/${s}-${c}-MTS-ALFF-HG.txt > ${compare_path}/ALFF/HG/${s}/${s}-${c}-ALFF-HG-compare.txt
        
        cat ${compare_path}/ALFF/HG/${s}/${s}-${c}-ALFF-HG-compare.txt
        
    ########### PT ##########
        mkdir -p ${compare_path}/ALFF/PT/${s}
    
        echo "${s}-${c} Comparisons on PT ALFF --> Mean OR Mean --> ALFF"
  
        cat ${analysis_path}/ALFF/Planum_Temporale/${s}/${s}-${c}-meanALFF-PT.txt ${alt_analysis_path}/ALFF/PT/${s}/${s}-${c}-MTS-ALFF-PT.txt > ${compare_path}/ALFF/PT/${s}/${s}-${c}-ALFF-PT-compare.txt
        
        cat ${compare_path}/ALFF/PT/${s}/${s}-${c}-ALFF-PT-compare.txt
        
    ########### MGB ##########
        mkdir -p ${compare_path}/ALFF/MGB/${s}
    
        echo "${s}-${c} Comparisons on MGB ALFF --> Mean OR Mean --> ALFF"
  
        cat ${analysis_path}/ALFF/Medial_Geniculate_Body/${s}/${s}-${c}-meanALFF-MGB.txt ${alt_analysis_path}/ALFF/MGB/${s}/${s}-${c}-MTS-ALFF-MGB.txt > ${compare_path}/ALFF/MGB/${s}/${s}-${c}-ALFF-MGB-compare.txt
        
        cat ${compare_path}/ALFF/MGB/${s}/${s}-${c}-ALFF-MGB-compare.txt
        
    ########### V1 ##########
        mkdir -p ${compare_path}/ALFF/V1/${s}
    
        echo "${s}-${c} Comparisons on V1 ALFF --> Mean OR Mean --> ALFF"
  
        cat ${analysis_path}/ALFF/Visual_Cortex_1/${s}/${s}-${c}-meanALFF-V1.txt ${alt_analysis_path}/ALFF/V1/${s}/${s}-${c}-MTS-ALFF-V1.txt > ${compare_path}/ALFF/V1/${s}/${s}-${c}-ALFF-V1-compare.txt
        
        cat ${compare_path}/ALFF/V1/${s}/${s}-${c}-ALFF-V1-compare.txt
        
done

#### Repeat this comparison for fALFF
     
for c in ${cond[@]}; do

    mkdir -p ${compare_path}/fALFF/Whole_Brain/${s}

    echo "${s}-${c} Comparisons on Whole Brain fALFF --> Mean OR Mean --> fALFF"

    cat ${analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-meanfALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/${s}/${s}-${c}-MTS-fALFF.txt > ${compare_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-compare.txt
    
    cat ${compare_path}/fALFF/Whole_Brain/${s}/${s}-${c}-fALFF-compare.txt
    
    # Compare the different ways of calculating ALFF in the ROIs (As this is a lot more relevant)
    
    ########### AC ##########
        mkdir -p ${compare_path}/fALFF/AC/${s}
    
        echo "${s}-${c} Comparisons on AC fALFF --> Mean OR Mean --> fALFF"
  
        cat ${analysis_path}/fALFF/Auditory_Cortex/${s}/${s}-${c}-meanfALFF-AC.txt ${alt_analysis_path}/fALFF/AC/${s}/${s}-${c}-MTS-fALFF-AC.txt > ${compare_path}/fALFF/AC/${s}/${s}-${c}-fALFF-AC-compare.txt
        
        cat ${compare_path}/fALFF/AC/${s}/${s}-${c}-fALFF-AC-compare.txt
  
    ########### HG ##########
        mkdir -p ${compare_path}/fALFF/HG/${s}
    
        echo "${s}-${c} Comparisons on HG fALFF --> Mean OR Mean --> fALFF"
  
        cat ${analysis_path}/fALFF/Heschls_Gyrus/${s}/${s}-${c}-meanfALFF-HG.txt ${alt_analysis_path}/fALFF/HG/${s}/${s}-${c}-MTS-fALFF-HG.txt > ${compare_path}/fALFF/HG/${s}/${s}-${c}-fALFF-HG-compare.txt
        
        cat ${compare_path}/fALFF/HG/${s}/${s}-${c}-fALFF-HG-compare.txt
        
    ########### PT ##########
        mkdir -p ${compare_path}/fALFF/PT/${s}
    
        echo "${s}-${c} Comparisons on PT fALFF --> Mean OR Mean --> fALFF"
  
        cat ${analysis_path}/fALFF/Planum_Temporale/${s}/${s}-${c}-meanfALFF-PT.txt ${alt_analysis_path}/fALFF/PT/${s}/${s}-${c}-MTS-fALFF-PT.txt > ${compare_path}/fALFF/PT/${s}/${s}-${c}-fALFF-PT-compare.txt
        
        cat ${compare_path}/fALFF/PT/${s}/${s}-${c}-fALFF-PT-compare.txt
        
    ########### MGB ##########
        mkdir -p ${compare_path}/fALFF/MGB/${s}
    
        echo "${s}-${c} Comparisons on MGB fALFF --> Mean OR Mean --> fALFF"
  
        cat ${analysis_path}/fALFF/Medial_Geniculate_Body/${s}/${s}-${c}-meanfALFF-MGB.txt ${alt_analysis_path}/fALFF/MGB/${s}/${s}-${c}-MTS-fALFF-MGB.txt > ${compare_path}/fALFF/MGB/${s}/${s}-${c}-fALFF-MGB-compare.txt
        
        cat ${compare_path}/fALFF/MGB/${s}/${s}-${c}-fALFF-MGB-compare.txt
        
    ########### V1 ##########
        mkdir -p ${compare_path}/fALFF/V1/${s}
    
        echo "${s}-${c} Comparisons on V1 fALFF --> Mean OR Mean --> fALFF"
  
        cat ${analysis_path}/fALFF/Visual_Cortex_1/${s}/${s}-${c}-meanfALFF-V1.txt ${alt_analysis_path}/fALFF/V1/${s}/${s}-${c}-MTS-fALFF-V1.txt > ${compare_path}/fALFF/V1/${s}/${s}-${c}-fALFF-V1-compare.txt
        
        cat ${compare_path}/fALFF/V1/${s}/${s}-${c}-fALFF-V1-compare.txt
        
done
