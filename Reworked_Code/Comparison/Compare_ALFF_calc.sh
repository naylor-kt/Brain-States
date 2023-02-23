#!/bin/bash
cond=(as ns vs)
region=(AC HG PT MGB V1)

preproc_path2S="$HOME/BrainStates_Test/Preproc/Level_2_Smoothed"
analysis_path="$HOME/BrainStates_Test/Analysis"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis"

MTS_path="$HOME/BrainStates_Test/Mean_Time_Series"
mask_path="$HOME/BrainStates_Test/Mask"


mkdir -p $HOME/BrainStates_Test/Alternative_Analysis/Comparison
compare_path="$HOME/BrainStates_Test/Alternative_Analysis/Comparison"

s=(sub-02)

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


##### Create a text file for each condition

########### ALFF

for c in ${cond[@]}; do

cat ${analysis_path}/ALFF/Whole_Brain/sub-01/sub-01-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-02/sub-02-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-03/sub-03-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-04/sub-04-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-05/sub-05-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-06/sub-06-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-07/sub-07-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-08/sub-08-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-09/sub-09-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-10/sub-10-${c}-meanALFF.txt ${analysis_path}/ALFF/Whole_Brain/sub-11/sub-11-${c}-meanALFF.txt > ${analysis_path}/ALFF/Whole_Brain/allsubs-${c}-meanALFF.txt

cat ${alt_analysis_path}/ALFF/Whole_Brain/sub-01/sub-01-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-02/sub-02-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-03/sub-03-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-04/sub-04-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-05/sub-05-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-06/sub-06-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-07/sub-07-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-08/sub-08-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-09/sub-09-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-10/sub-10-${c}-MTS-ALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/sub-11/sub-11-${c}-MTS-ALFF.txt > ${alt_analysis_path}/ALFF/Whole_Brain/allsubs-${c}-MTS-ALFF.txt

cat ${analysis_path}/ALFF/Auditory_Cortex/sub-01/sub-01-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-02/sub-02-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-03/sub-03-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-04/sub-04-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-05/sub-05-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-06/sub-06-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-07/sub-07-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-08/sub-08-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-09/sub-09-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-10/sub-10-${c}-meanALFF-AC.txt ${analysis_path}/ALFF/Auditory_Cortex/sub-11/sub-11-${c}-meanALFF-AC.txt > ${analysis_path}/ALFF/Auditory_Cortex/allsubs-${c}-meanALFF-AC.txt

cat ${analysis_path}/ALFF/Heschls_Gyrus/sub-01/sub-01-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-02/sub-02-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-03/sub-03-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-04/sub-04-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-05/sub-05-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-06/sub-06-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-07/sub-07-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-08/sub-08-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-09/sub-09-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-10/sub-10-${c}-meanALFF-HG.txt ${analysis_path}/ALFF/Heschls_Gyrus/sub-11/sub-11-${c}-meanALFF-HG.txt > ${analysis_path}/ALFF/Heschls_Gyrus/allsubs-${c}-meanALFF-HG.txt

cat ${analysis_path}/ALFF/Planum_Temporale/sub-01/sub-01-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-02/sub-02-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-03/sub-03-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-04/sub-04-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-05/sub-05-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-06/sub-06-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-07/sub-07-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-08/sub-08-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-09/sub-09-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-10/sub-10-${c}-meanALFF-PT.txt ${analysis_path}/ALFF/Planum_Temporale/sub-11/sub-11-${c}-meanALFF-PT.txt > ${analysis_path}/ALFF/Planum_Temporale/allsubs-${c}-meanALFF-PT.txt

cat ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-01/sub-01-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-02/sub-02-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-03/sub-03-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-04/sub-04-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-05/sub-05-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-06/sub-06-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-07/sub-07-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-08/sub-08-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-09/sub-09-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-10/sub-10-${c}-meanALFF-MGB.txt ${analysis_path}/ALFF/Medial_Geniculate_Body/sub-11/sub-11-${c}-meanALFF-MGB.txt > ${analysis_path}/ALFF/Medial_Geniculate_Body/allsubs-${c}-meanALFF-MGB.txt

cat ${analysis_path}/ALFF/Visual_Cortex_1/sub-01/sub-01-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-02/sub-02-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-03/sub-03-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-04/sub-04-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-05/sub-05-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-06/sub-06-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-07/sub-07-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-08/sub-08-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-09/sub-09-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-10/sub-10-${c}-meanALFF-V1.txt ${analysis_path}/ALFF/Visual_Cortex_1/sub-11/sub-11-${c}-meanALFF-V1.txt > ${analysis_path}/ALFF/Visual_Cortex_1/allsubs-${c}-meanALFF-V1.txt

for r in ${region[@]}; do

cat ${alt_analysis_path}/ALFF/${r}/sub-01/sub-01-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-02/sub-02-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-03/sub-03-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-04/sub-04-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-05/sub-05-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-06/sub-06-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-07/sub-07-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-08/sub-08-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-09/sub-09-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-10/sub-10-${c}-MTS-ALFF-${r}.txt ${alt_analysis_path}/ALFF/${r}/sub-11/sub-11-${c}-MTS-ALFF-${r}.txt > ${alt_analysis_path}/ALFF/${r}/allsubs-${c}-MTS-ALFF-${r}.txt
done

done
    

######## fALFF

for c in ${cond[@]}; do

cat ${analysis_path}/fALFF/Whole_Brain/sub-01/sub-01-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-02/sub-02-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-03/sub-03-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-04/sub-04-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-05/sub-05-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-06/sub-06-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-07/sub-07-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-08/sub-08-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-09/sub-09-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-10/sub-10-${c}-meanfALFF.txt ${analysis_path}/fALFF/Whole_Brain/sub-11/sub-11-${c}-meanfALFF.txt > ${analysis_path}/fALFF/Whole_Brain/allsubs-${c}-meanfALFF.txt

cat ${alt_analysis_path}/fALFF/Whole_Brain/sub-01/sub-01-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-02/sub-02-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-03/sub-03-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-04/sub-04-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-05/sub-05-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-06/sub-06-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-07/sub-07-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-08/sub-08-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-09/sub-09-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-10/sub-10-${c}-MTS-fALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/sub-11/sub-11-${c}-MTS-fALFF.txt > ${alt_analysis_path}/fALFF/Whole_Brain/allsubs-${c}-MTS-fALFF.txt

cat ${analysis_path}/fALFF/Auditory_Cortex/sub-01/sub-01-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-02/sub-02-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-03/sub-03-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-04/sub-04-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-05/sub-05-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-06/sub-06-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-07/sub-07-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-08/sub-08-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-09/sub-09-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-10/sub-10-${c}-meanfALFF-AC.txt ${analysis_path}/fALFF/Auditory_Cortex/sub-11/sub-11-${c}-meanfALFF-AC.txt > ${analysis_path}/fALFF/Auditory_Cortex/allsubs-${c}-meanfALFF-AC.txt

cat ${analysis_path}/fALFF/Heschls_Gyrus/sub-01/sub-01-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-02/sub-02-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-03/sub-03-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-04/sub-04-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-05/sub-05-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-06/sub-06-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-07/sub-07-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-08/sub-08-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-09/sub-09-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-10/sub-10-${c}-meanfALFF-HG.txt ${analysis_path}/fALFF/Heschls_Gyrus/sub-11/sub-11-${c}-meanfALFF-HG.txt > ${analysis_path}/fALFF/Heschls_Gyrus/allsubs-${c}-meanfALFF-HG.txt

cat ${analysis_path}/fALFF/Planum_Temporale/sub-01/sub-01-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-02/sub-02-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-03/sub-03-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-04/sub-04-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-05/sub-05-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-06/sub-06-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-07/sub-07-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-08/sub-08-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-09/sub-09-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-10/sub-10-${c}-meanfALFF-PT.txt ${analysis_path}/fALFF/Planum_Temporale/sub-11/sub-11-${c}-meanfALFF-PT.txt > ${analysis_path}/fALFF/Planum_Temporale/allsubs-${c}-meanfALFF-PT.txt

cat ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-01/sub-01-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-02/sub-02-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-03/sub-03-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-04/sub-04-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-05/sub-05-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-06/sub-06-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-07/sub-07-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-08/sub-08-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-09/sub-09-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-10/sub-10-${c}-meanfALFF-MGB.txt ${analysis_path}/fALFF/Medial_Geniculate_Body/sub-11/sub-11-${c}-meanfALFF-MGB.txt > ${analysis_path}/fALFF/Medial_Geniculate_Body/allsubs-${c}-meanfALFF-MGB.txt

cat ${analysis_path}/fALFF/Visual_Cortex_1/sub-01/sub-01-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-02/sub-02-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-03/sub-03-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-04/sub-04-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-05/sub-05-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-06/sub-06-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-07/sub-07-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-08/sub-08-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-09/sub-09-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-10/sub-10-${c}-meanfALFF-V1.txt ${analysis_path}/fALFF/Visual_Cortex_1/sub-11/sub-11-${c}-meanfALFF-V1.txt > ${analysis_path}/fALFF/Visual_Cortex_1/allsubs-${c}-meanfALFF-V1.txt

for r in ${region[@]}; do

cat ${alt_analysis_path}/fALFF/${r}/sub-01/sub-01-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-02/sub-02-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-03/sub-03-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-04/sub-04-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-05/sub-05-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-06/sub-06-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-07/sub-07-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-08/sub-08-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-09/sub-09-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-10/sub-10-${c}-MTS-fALFF-${r}.txt ${alt_analysis_path}/fALFF/${r}/sub-11/sub-11-${c}-MTS-fALFF-${r}.txt > ${alt_analysis_path}/fALFF/${r}/allsubs-${c}-MTS-fALFF-${r}.txt

done

done


analysis_path="$HOME/BrainStates_Test/Analysis"
alt_analysis_path="$HOME/BrainStates_Test/Alternative_Analysis"
cond=(as ns vs)


#### Clearly show the difference between the two versions of calculating ALFF

for c in ${cond[@]}; do
echo "${c} Whole Brain ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Whole_Brain/allsubs-${c}-meanALFF.txt ${alt_analysis_path}/ALFF/Whole_Brain/allsubs-${c}-MTS-ALFF.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Auditory Cortex ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Auditory_Cortex/allsubs-${c}-meanALFF-AC.txt ${alt_analysis_path}/ALFF/AC/allsubs-${c}-MTS-ALFF-AC.txt | column -s $'\t' -t
done

for c in ${cond[@]}; do
echo "${c} Heschel's Gyrus ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Heschls_Gyrus/allsubs-${c}-meanALFF-HG.txt ${alt_analysis_path}/ALFF/HG/allsubs-${c}-MTS-ALFF-HG.txt | column -s $'\t' -t
done

for c in ${cond[@]}; do
echo "${c} Planum Temporale ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Planum_Temporale/allsubs-${c}-meanALFF-PT.txt ${alt_analysis_path}/ALFF/PT/allsubs-${c}-MTS-ALFF-PT.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Medial Geniculate Body ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Medial_Geniculate_Body/allsubs-${c}-meanALFF-MGB.txt ${alt_analysis_path}/ALFF/MGB/allsubs-${c}-MTS-ALFF-MGB.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Primary Visual Cortex ALFF-->Mean VS Mean-->ALFF"
paste ${analysis_path}/ALFF/Visual_Cortex_1/allsubs-${c}-meanALFF-V1.txt ${alt_analysis_path}/ALFF/V1/allsubs-${c}-MTS-ALFF-V1.txt | column -s $'\t' -t
done

#### Clearly show the difference between the two versions of calculating fALFF

for c in ${cond[@]}; do
echo "${c} Whole Brain fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Whole_Brain/allsubs-${c}-meanfALFF.txt ${alt_analysis_path}/fALFF/Whole_Brain/allsubs-${c}-MTS-fALFF.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Auditory Cortex fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Auditory_Cortex/allsubs-${c}-meanfALFF-AC.txt ${alt_analysis_path}/fALFF/AC/allsubs-${c}-MTS-fALFF-AC.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Heschel's Gyrus fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Heschls_Gyrus/allsubs-${c}-meanfALFF-HG.txt ${alt_analysis_path}/fALFF/HG/allsubs-${c}-MTS-fALFF-HG.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "${c} Planum Temporale fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Planum_Temporale/allsubs-${c}-meanfALFF-PT.txt ${alt_analysis_path}/fALFF/PT/allsubs-${c}-MTS-fALFF-PT.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "Medial Geniculate fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Medial_Geniculate_Body/allsubs-${c}-meanfALFF-MGB.txt ${alt_analysis_path}/fALFF/MGB/allsubs-${c}-MTS-fALFF-MGB.txt | column -s $'\t' -t
done


for c in ${cond[@]}; do
echo "Primary Visual Cortex fALFF-->Mean VS Mean-->fALFF"
paste ${analysis_path}/fALFF/Visual_Cortex_1/allsubs-${c}-meanfALFF-V1.txt ${alt_analysis_path}/fALFF/V1/allsubs-${c}-MTS-fALFF-V1.txt | column -s $'\t' -t
done
