#!/bin/bash
cond=(as ns vs)
region=(AC HG PT V1)
hemi=(lh rh)

surf_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF"
surf_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF"
sm_ALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/ALFF/Smoothed"
sm_fALFF="/Users/mszkcn/BrainStates_Test/Surface/Analysis/fALFF/Smoothed"

##### Create a text file for each condition

###### UNSMOOTHED

for c in ${cond[@]}; do
    for h in ${hemi[@]}; do

   ## Unsmoothed ALFF in subject specific space
   
    cat ${surf_ALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-fs.txt ${surf_ALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-fs.txt > ${surf_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-fs.txt

   ## Unsmoothed ALFF in fsaverage space
    
    cat ${surf_ALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-fsavg.txt ${surf_ALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-fsavg.txt > ${surf_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-fsavg.txt

   ## Unsmoothed fALFF in subject specific space
   
    cat ${surf_fALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-fs.txt ${surf_fALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-fs.txt > ${surf_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-fs.txt

   ## Unsmoothed fALFF in fsaverage space
    
    cat ${surf_fALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-fsavg.txt ${surf_fALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-fsavg.txt > ${surf_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-fsavg.txt
    done
done

#### For the individual ROIs

for c in ${cond[@]}; do
    for r in ${region[@]}; do
        for h in ${hemi[@]}; do
        
           ## Unsmoothed ALFF in subject specific space
   
            cat ${surf_ALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-${r}-fs.txt ${surf_ALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-${r}-fs.txt > ${surf_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-fs.txt
            
            ## Unsmoothed ALFF in fsaverage space
   
            cat ${surf_ALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt ${surf_ALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt > ${surf_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-fsavg.txt
            
            ## Unsmoothed fALFF in subject specific space
   
            cat ${surf_fALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-${r}-fs.txt ${surf_fALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-${r}-fs.txt > ${surf_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-fs.txt
            
            ## Unsmoothed fALFF in fsaverage space
   
            cat ${surf_fALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt ${surf_fALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt > ${surf_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-fsavg.txt
            
        done
    done
done

    
###### SMOOTHED

### Whole Brain
for c in ${cond[@]}; do
    for h in ${hemi[@]}; do

   ## Smoothed ALFF in subject specific space
   
    cat ${sm_ALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-SM-fs.txt ${sm_ALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-SM-fs.txt > ${sm_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-SM-fs.txt

   ## Smoothed ALFF in fsaverage space
   
    cat ${sm_ALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-SM-fsavg.txt ${sm_ALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-SM-fsavg.txt > ${sm_ALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-ALFF-SM-fsavg.txt

   ## Smoothed fALFF in subject specific space
   
    cat ${sm_fALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-SM-fs.txt ${sm_fALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-SM-fs.txt > ${sm_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-SM-fs.txt

   ## Smoothed fALFF in fsaverage space
   
    cat ${sm_fALFF}/Whole_Brain/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-SM-fsavg.txt ${sm_fALFF}/Whole_Brain/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-SM-fsavg.txt > ${sm_fALFF}/Whole_Brain/allsubs-${c}-${h}-MEAN-fALFF-SM-fsavg.txt
    
    done
done

#### For the individual ROIs

for c in ${cond[@]}; do
    for r in ${region[@]}; do
        for h in ${hemi[@]}; do
        
           ## Unsmoothed ALFF in subject specific space
   
            cat ${sm_ALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt ${sm_ALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt > ${sm_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-SM-fs.txt
            
            ## Unsmoothed ALFF in fsaverage space
   
            cat ${sm_ALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt ${sm_ALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt > ${sm_ALFF}/${r}/allsubs-${c}-${h}-MEAN-ALFF-${r}-SM-fsavg.txt


           ## Unsmoothed fALFF in subject specific space
   
            cat ${sm_fALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt ${sm_fALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt > ${sm_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-SM-fs.txt
            
            ## Unsmoothed fALFF in fsaverage space
   
            cat ${sm_fALFF}/${r}/sub-01/Mean/sub-01-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-02/Mean/sub-02-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-03/Mean/sub-03-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-04/Mean/sub-04-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-05/Mean/sub-05-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-06/Mean/sub-06-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-07/Mean/sub-07-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-08/Mean/sub-08-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-09/Mean/sub-09-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-10/Mean/sub-10-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt ${sm_fALFF}/${r}/sub-11/Mean/sub-11-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt > ${sm_fALFF}/${r}/allsubs-${c}-${h}-MEAN-fALFF-${r}-SM-fsavg.txt
        done
    done
done
