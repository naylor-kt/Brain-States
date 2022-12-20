data_path="${HOME}/BS_Test_FL"

ls ${data_path}/RawData >> ${data_path}/subject_list.txt

for s in `cat ${data_path}/subject_list.txt`; do
    mkdir -p ${data_path}/Preproc/$s
    fslroi ${data_path}/RawData/${s}/func/*_task-ns_bold.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz 10 -1
    mkdir -p ${data_path}/OriginalMotion/$s
    mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/OriginalMotion/$s/${s}_oringal_motion -plots -rmsrel -rmsabs -spline_final
    line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}
    slicetimer -i ${data_path}/Preproc/$s/${s}-preproc.nii.gz -o ${data_path}/Preproc/$s/${s}-preproc.nii.gz -r $tr --odd
    mkdir -p ${data_path}/Preproc/$s/Motion_Correction
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/Motion_Correction/${s}_preproc_mean
    mcflirt -in ${data_path}/Preproc/$s/${s}-preproc.nii.gz -out ${data_path}/Preproc/$s/${s}-preproc -reffile ${data_path}/Preproc/$s/Motion_Correction/${s}_preproc_mean -mats -spline_final
    mv ${data_path}/Preproc/$s/${s}-preproc.mat ${data_path}/Preproc/$s/Motion_Correction/${s}_motion_correction.mat
    mkdir -p ${data_path}/Preproc/$s/TopUp/fmap
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz -Tmean /${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean
    fslmaths ${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz -Tmean /${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
    fslmerge -t /${data_path}/Preproc/$s/TopUp/fmap/${s}_combined /${data_path}/Preproc/$s/TopUp/fmap/${s}_fmap_mean /${data_path}/Preproc/$s/TopUp/fmap/${s}_revfmap_mean
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Results/
    topup --imain=/${data_path}/Preproc/$s/TopUp/fmap/${s}_combined --datain=${data_path}/acq_params/acq_params.txt --out=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results
    mkdir -p ${data_path}/Preproc/$s/TopUp/TopUp_Applied
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_fmap_tuapp
    applytopup  --imain=${data_path}/RawData/$s/fmap/${s}_field_map_reverse.nii.gz --inindex=2 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/TopUp/TopUp_Applied/${s}_revfmap_tuapp
    applytopup  --imain=${data_path}/Preproc/$s/${s}-preproc.nii.gz --inindex=1 --datain=${data_path}/acq_params/acq_params.txt --topup=${data_path}/Preproc/$s/TopUp/TopUp_Results/${s}_topup_results --method=jac --out=${data_path}/Preproc/$s/${s}-preproc.nii.gz
    mkdir -p ${data_path}/Registration/$s/Mean_Before_Filter
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz
    bet ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func.nii.gz ${data_path}/Registration/$s/Mean_Before_Filter/${s}_mean_func_bet -f 0.25 -m
    line=($(fslhd ${data_path}/Preproc/$s/${s}-preproc.nii.gz | grep pixdim4)); tr=${line[1]}; thp=$(bc -l <<< "100/($tr*2)"); tlp=$(bc -l <<< "10/($tr*2)")
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/${s}-mean.nii.gz
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -bptf $thp $tlp  -add ${data_path}/Preproc/$s/${s}-mean.nii.gz ${data_path}/Preproc/$s/${s}-preproc.nii.gz
    imrm ${data_path}/Preproc/$s/${s}-mean.nii.gz
    mkdir -p ${data_path}/Preproc/$s/DVARS
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -Tmean ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS
    bet ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet -f 0.25 -m
    fslmaths ${data_path}/Preproc/$s/${s}-preproc.nii.gz -mas ${data_path}/Preproc/$s/DVARS/${s}_mean4DVARS_bet_mask ${data_path}/Preproc/$s/DVARS/${s}_preproc_bet
    fsl_motion_outliers -i ${data_path}/Preproc/$s/DVARS/${s}_preproc_bet -o ${data_path}/Preproc/$s/DVARS/${s}_dvars --dvars --nomoco -s ${data_path}/Preproc/$s/DVARS/${s}_dvars.txt
done
