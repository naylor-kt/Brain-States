%%% This is a workspace to create the plots to compare the different ways
%%% of calculating ALFF (ie mean ALFF VS ALFF of the mean time series)

%%%% This is a workspace to create the ALFF plots in matlab

in_FrontalPole = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-FrontalPole-lh-ns-vs-as-meanALFF.txt';
ALFF_FrontalPole = readmatrix(in_FrontalPole);
ALFF_FrontalPole(:,1) = [];

mean_FrontalPole = mean(ALFF_FrontalPole);
[nrows, ncols] = size(ALFF_FrontalPole);
std_FrontalPole = std(ALFF_FrontalPole);
SEM_FrontalPole = (std_FrontalPole/sqrt(nrows));


in_Insular = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Insular-lh-ns-vs-as-meanALFF.txt';
ALFF_Insular = readmatrix(in_Insular);
ALFF_Insular(:,1) = [];

mean_Insular = mean(ALFF_Insular);
[nrows, ncols] = size(ALFF_Insular);
std_Insular = std(ALFF_Insular);
SEM_Insular = (std_Insular/sqrt(nrows));
    
    
in_SuperiorFrontal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-SuperiorFrontal-lh-ns-vs-as-meanALFF.txt';
ALFF_SuperiorFrontal = readmatrix(in_SuperiorFrontal);
ALFF_SuperiorFrontal(:,1) = [];

mean_SuperiorFrontal = mean(ALFF_SuperiorFrontal);
[nrows, ncols] = size(ALFF_SuperiorFrontal);
std_SuperiorFrontal = std(ALFF_SuperiorFrontal);
SEM_SuperiorFrontal = (std_SuperiorFrontal/sqrt(nrows));


in_MiddleFrontal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-MiddleFrontal-lh-ns-vs-as-meanALFF.txt';
ALFF_MiddleFrontal = readmatrix(in_MiddleFrontal);
ALFF_MiddleFrontal(:,1) = [];

mean_MiddleFrontal = mean(ALFF_MiddleFrontal);
[nrows, ncols] = size(ALFF_MiddleFrontal);
std_MiddleFrontal = std(ALFF_MiddleFrontal);
SEM_MiddleFrontal = (std_MiddleFrontal/sqrt(nrows));


in_ParsTriangularis = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-ParsTriangularis-lh-ns-vs-as-meanALFF.txt';
ALFF_ParsTriangularis = readmatrix(in_ParsTriangularis);
ALFF_ParsTriangularis(:,1) = [];

mean_ParsTriangularis = mean(ALFF_ParsTriangularis);
[nrows, ncols] = size(ALFF_ParsTriangularis);
std_ParsTriangularis = std(ALFF_ParsTriangularis);
SEM_ParsTriangularis = (std_ParsTriangularis/sqrt(nrows));


in_ParsOpercularis = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-ParsOpercularis-lh-ns-vs-as-meanALFF.txt';
ALFF_ParsOpercularis = readmatrix(in_ParsOpercularis);
ALFF_ParsOpercularis(:,1) = [];

mean_ParsOpercularis = mean(ALFF_ParsOpercularis);
[nrows, ncols] = size(ALFF_ParsOpercularis);
std_ParsOpercularis = std(ALFF_ParsOpercularis);
SEM_ParsOpercularis = (std_ParsOpercularis/sqrt(nrows));


in_PrecentralGyrus = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PrecentralGyrus-lh-ns-vs-as-meanALFF.txt';
ALFF_PrecentralGyrus = readmatrix(in_PrecentralGyrus);
ALFF_PrecentralGyrus(:,1) = [];

mean_PrecentralGyrus = mean(ALFF_PrecentralGyrus);
[nrows, ncols] = size(ALFF_PrecentralGyrus);
std_PrecentralGyrus = std(ALFF_PrecentralGyrus);
SEM_PrecentralGyrus = (std_PrecentralGyrus/sqrt(nrows));


in_TemporalPole = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-TemporalPole-lh-ns-vs-as-meanALFF.txt';
ALFF_TemporalPole = readmatrix(in_TemporalPole);
ALFF_TemporalPole(:,1) = [];

mean_TemporalPole = mean(ALFF_TemporalPole);
[nrows, ncols] = size(ALFF_TemporalPole);
std_TemporalPole = std(ALFF_TemporalPole);
SEM_TemporalPole = (std_TemporalPole/sqrt(nrows));


in_AnteriorSuperiorTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorSuperiorTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorSuperiorTemporal = readmatrix(in_AnteriorSuperiorTemporal);
ALFF_AnteriorSuperiorTemporal(:,1) = [];

mean_AnteriorSuperiorTemporal = mean(ALFF_AnteriorSuperiorTemporal);
[nrows, ncols] = size(ALFF_AnteriorSuperiorTemporal);
std_AnteriorSuperiorTemporal = std(ALFF_AnteriorSuperiorTemporal);
SEM_AnteriorSuperiorTemporal = (std_AnteriorSuperiorTemporal/sqrt(nrows));


in_PosteriorSuperiorTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorSuperiorTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorSuperiorTemporal = readmatrix(in_PosteriorSuperiorTemporal);
ALFF_PosteriorSuperiorTemporal(:,1) = [];

mean_PosteriorSuperiorTemporal = mean(ALFF_PosteriorSuperiorTemporal);
[nrows, ncols] = size(ALFF_PosteriorSuperiorTemporal);
std_PosteriorSuperiorTemporal = std(ALFF_PosteriorSuperiorTemporal);
SEM_PosteriorSuperiorTemporal = (std_PosteriorSuperiorTemporal/sqrt(nrows));


in_AnteriorMiddleTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorMiddleTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorMiddleTemporal = readmatrix(in_AnteriorMiddleTemporal);
ALFF_AnteriorMiddleTemporal(:,1) = [];

mean_AnteriorMiddleTemporal = mean(ALFF_AnteriorMiddleTemporal);
[nrows, ncols] = size(ALFF_AnteriorMiddleTemporal);
std_AnteriorMiddleTemporal = std(ALFF_AnteriorMiddleTemporal);
SEM_AnteriorMiddleTemporal = (std_AnteriorMiddleTemporal/sqrt(nrows));


in_PosteriorMiddleTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorMiddleTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorMiddleTemporal = readmatrix(in_PosteriorMiddleTemporal);
ALFF_PosteriorMiddleTemporal(:,1) = [];

mean_PosteriorMiddleTemporal = mean(ALFF_PosteriorMiddleTemporal);
[nrows, ncols] = size(ALFF_PosteriorMiddleTemporal);
std_PosteriorMiddleTemporal = std(ALFF_PosteriorMiddleTemporal);
SEM_PosteriorMiddleTemporal = (std_PosteriorMiddleTemporal/sqrt(nrows));


in_TemporooccipitalMiddleTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-TemporooccipitalMiddleTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_TemporooccipitalMiddleTemporal = readmatrix(in_TemporooccipitalMiddleTemporal);
ALFF_TemporooccipitalMiddleTemporal(:,1) = [];

mean_TemporooccipitalMiddleTemporal = mean(ALFF_TemporooccipitalMiddleTemporal);
[nrows, ncols] = size(ALFF_TemporooccipitalMiddleTemporal);
std_TemporooccipitalMiddleTemporal = std(ALFF_TemporooccipitalMiddleTemporal);
SEM_TemporooccipitalMiddleTemporal = (std_TemporooccipitalMiddleTemporal/sqrt(nrows));


in_AnteriorInferiorTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorInferiorTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorInferiorTemporal = readmatrix(in_AnteriorInferiorTemporal);
ALFF_AnteriorInferiorTemporal(:,1) = [];

mean_AnteriorInferiorTemporal = mean(ALFF_AnteriorInferiorTemporal);
[nrows, ncols] = size(ALFF_AnteriorInferiorTemporal);
std_AnteriorInferiorTemporal = std(ALFF_AnteriorInferiorTemporal);
SEM_AnteriorInferiorTemporal = (std_AnteriorInferiorTemporal/sqrt(nrows));


in_PosteriorInferiorTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorInferiorTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorInferiorTemporal = readmatrix(in_PosteriorInferiorTemporal);
ALFF_PosteriorInferiorTemporal(:,1) = [];

mean_PosteriorInferiorTemporal = mean(ALFF_PosteriorInferiorTemporal);
[nrows, ncols] = size(ALFF_PosteriorInferiorTemporal);
std_PosteriorInferiorTemporal = std(ALFF_PosteriorInferiorTemporal);
SEM_PosteriorInferiorTemporal = (std_PosteriorInferiorTemporal/sqrt(nrows));


in_TemporooccipitalInferiorTemporal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-TemporooccipitalInferiorTemporal-lh-ns-vs-as-meanALFF.txt';
ALFF_TemporooccipitalInferiorTemporal = readmatrix(in_TemporooccipitalInferiorTemporal);
ALFF_TemporooccipitalInferiorTemporal(:,1) = [];

mean_TemporooccipitalInferiorTemporal = mean(ALFF_TemporooccipitalInferiorTemporal);
[nrows, ncols] = size(ALFF_TemporooccipitalInferiorTemporal);
std_TemporooccipitalInferiorTemporal = std(ALFF_TemporooccipitalInferiorTemporal);
SEM_TemporooccipitalInferiorTemporal = (std_TemporooccipitalInferiorTemporal/sqrt(nrows));


in_Postcentral = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Postcentral-lh-ns-vs-as-meanALFF.txt';
ALFF_Postcentral = readmatrix(in_Postcentral);
ALFF_Postcentral(:,1) = [];

mean_Postcentral = mean(ALFF_Postcentral);
[nrows, ncols] = size(ALFF_Postcentral);
std_Postcentral = std(ALFF_Postcentral);
SEM_Postcentral = (std_Postcentral/sqrt(nrows));


in_SuperiorParietal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-SuperiorParietal-lh-ns-vs-as-meanALFF.txt';
ALFF_SuperiorParietal = readmatrix(in_SuperiorParietal);
ALFF_SuperiorParietal(:,1) = [];

mean_SuperiorParietal = mean(ALFF_SuperiorParietal);
[nrows, ncols] = size(ALFF_SuperiorParietal);
std_SuperiorParietal = std(ALFF_SuperiorParietal);
SEM_SuperiorParietal = (std_SuperiorParietal/sqrt(nrows));


in_AnteriorSupramarginal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorSupramarginal-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorSupramarginal = readmatrix(in_AnteriorSupramarginal);
ALFF_AnteriorSupramarginal(:,1) = [];

mean_AnteriorSupramarginal = mean(ALFF_AnteriorSupramarginal);
[nrows, ncols] = size(ALFF_AnteriorSupramarginal);
std_AnteriorSupramarginal = std(ALFF_AnteriorSupramarginal);
SEM_AnteriorSupramarginal = (std_AnteriorSupramarginal/sqrt(nrows));


in_PosteriorSupramarginal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorSupramarginal-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorSupramarginal = readmatrix(in_PosteriorSupramarginal);
ALFF_PosteriorSupramarginal(:,1) = [];

mean_PosteriorSupramarginal = mean(ALFF_PosteriorSupramarginal);
[nrows, ncols] = size(ALFF_PosteriorSupramarginal);
std_PosteriorSupramarginal = std(ALFF_PosteriorSupramarginal);
SEM_PosteriorSupramarginal = (std_PosteriorSupramarginal/sqrt(nrows));


in_Angular = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Angular-lh-ns-vs-as-meanALFF.txt';
ALFF_Angular = readmatrix(in_Angular);
ALFF_Angular(:,1) = [];

mean_Angular = mean(ALFF_Angular);
[nrows, ncols] = size(ALFF_Angular);
std_Angular = std(ALFF_Angular);
SEM_Angular = (std_Angular/sqrt(nrows));


in_SuperiorLateralOccipital = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-SuperiorLateralOccipital-lh-ns-vs-as-meanALFF.txt';
ALFF_SuperiorLateralOccipital = readmatrix(in_SuperiorLateralOccipital);
ALFF_SuperiorLateralOccipital(:,1) = [];

mean_SuperiorLateralOccipital = mean(ALFF_SuperiorLateralOccipital);
[nrows, ncols] = size(ALFF_SuperiorLateralOccipital);
std_SuperiorLateralOccipital = std(ALFF_SuperiorLateralOccipital);
SEM_SuperiorLateralOccipital = (std_SuperiorLateralOccipital/sqrt(nrows));


in_InferiorLateralOccipital = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-InferiorLateralOccipital-lh-ns-vs-as-meanALFF.txt';
ALFF_InferiorLateralOccipital = readmatrix(in_InferiorLateralOccipital);
ALFF_InferiorLateralOccipital(:,1) = [];

mean_InferiorLateralOccipital = mean(ALFF_InferiorLateralOccipital);
[nrows, ncols] = size(ALFF_InferiorLateralOccipital);
std_InferiorLateralOccipital = std(ALFF_InferiorLateralOccipital);
SEM_InferiorLateralOccipital = (std_InferiorLateralOccipital/sqrt(nrows));


in_Intracalcarine = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Intracalcarine-lh-ns-vs-as-meanALFF.txt';
ALFF_Intracalcarine = readmatrix(in_Intracalcarine);
ALFF_Intracalcarine(:,1) = [];

mean_Intracalcarine = mean(ALFF_Intracalcarine);
[nrows, ncols] = size(ALFF_Intracalcarine);
std_Intracalcarine = std(ALFF_Intracalcarine);
SEM_Intracalcarine = (std_Intracalcarine/sqrt(nrows));


in_FrontalMedial = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-FrontalMedial-lh-ns-vs-as-meanALFF.txt';
ALFF_FrontalMedial = readmatrix(in_FrontalMedial);
ALFF_FrontalMedial(:,1) = [];

mean_FrontalMedial = mean(ALFF_FrontalMedial);
[nrows, ncols] = size(ALFF_FrontalMedial);
std_FrontalMedial = std(ALFF_FrontalMedial);
SEM_FrontalMedial = (std_FrontalMedial/sqrt(nrows));


in_JuxtapositionalLobule = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-JuxtapositionalLobule-lh-ns-vs-as-meanALFF.txt';
ALFF_JuxtapositionalLobule = readmatrix(in_JuxtapositionalLobule);
ALFF_JuxtapositionalLobule(:,1) = [];

mean_JuxtapositionalLobule = mean(ALFF_JuxtapositionalLobule);
[nrows, ncols] = size(ALFF_JuxtapositionalLobule);
std_JuxtapositionalLobule = std(ALFF_JuxtapositionalLobule);
SEM_JuxtapositionalLobule = (std_JuxtapositionalLobule/sqrt(nrows));


in_Subcallosal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Subcallosal-lh-ns-vs-as-meanALFF.txt';
ALFF_Subcallosal = readmatrix(in_Subcallosal);
ALFF_Subcallosal(:,1) = [];

mean_Subcallosal = mean(ALFF_Subcallosal);
[nrows, ncols] = size(ALFF_Subcallosal);
std_Subcallosal = std(ALFF_Subcallosal);
SEM_Subcallosal = (std_Subcallosal/sqrt(nrows));


in_Paracingulate = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Paracingulate-lh-ns-vs-as-meanALFF.txt';
ALFF_Paracingulate = readmatrix(in_Paracingulate);
ALFF_Paracingulate(:,1) = [];

mean_Paracingulate = mean(ALFF_Paracingulate);
[nrows, ncols] = size(ALFF_Paracingulate);
std_Paracingulate = std(ALFF_Paracingulate);
SEM_Paracingulate = (std_Paracingulate/sqrt(nrows));


in_AnteriorCingulate = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorCingulate-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorCingulate = readmatrix(in_AnteriorCingulate);
ALFF_AnteriorCingulate(:,1) = [];

mean_AnteriorCingulate = mean(ALFF_AnteriorCingulate);
[nrows, ncols] = size(ALFF_AnteriorCingulate);
std_AnteriorCingulate = std(ALFF_AnteriorCingulate);
SEM_AnteriorCingulate = (std_AnteriorCingulate/sqrt(nrows));


in_PosteriorCingulate = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorCingulate-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorCingulate = readmatrix(in_PosteriorCingulate);
ALFF_PosteriorCingulate(:,1) = [];

mean_PosteriorCingulate = mean(ALFF_PosteriorCingulate);
[nrows, ncols] = size(ALFF_PosteriorCingulate);
std_PosteriorCingulate = std(ALFF_PosteriorCingulate);
SEM_PosteriorCingulate = (std_PosteriorCingulate/sqrt(nrows));


in_Precuneous = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Precuneous-lh-ns-vs-as-meanALFF.txt';
ALFF_Precuneous = readmatrix(in_Precuneous);
ALFF_Precuneous(:,1) = [];

mean_Precuneous = mean(ALFF_Precuneous);
[nrows, ncols] = size(ALFF_Precuneous);
std_Precuneous = std(ALFF_Precuneous);
SEM_Precuneous = (std_Precuneous/sqrt(nrows));


in_Cuneal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Cuneal-lh-ns-vs-as-meanALFF.txt';
ALFF_Cuneal = readmatrix(in_Cuneal);
ALFF_Cuneal(:,1) = [];

mean_Cuneal = mean(ALFF_Cuneal);
[nrows, ncols] = size(ALFF_Cuneal);
std_Cuneal = std(ALFF_Cuneal);
SEM_Cuneal = (std_Cuneal/sqrt(nrows));


in_FrontalOrbital = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-FrontalOrbital-lh-ns-vs-as-meanALFF.txt';
ALFF_FrontalOrbital = readmatrix(in_FrontalOrbital);
ALFF_FrontalOrbital(:,1) = [];

mean_FrontalOrbital = mean(ALFF_FrontalOrbital);
[nrows, ncols] = size(ALFF_FrontalOrbital);
std_FrontalOrbital = std(ALFF_FrontalOrbital);
SEM_FrontalOrbital = (std_FrontalOrbital/sqrt(nrows));


in_AnteriorParahippocampal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorParahippocampal-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorParahippocampal = readmatrix(in_AnteriorParahippocampal);
ALFF_AnteriorParahippocampal(:,1) = [];

mean_AnteriorParahippocampal = mean(ALFF_AnteriorParahippocampal);
[nrows, ncols] = size(ALFF_AnteriorParahippocampal);
std_AnteriorParahippocampal = std(ALFF_AnteriorParahippocampal);
SEM_AnteriorParahippocampal = (std_AnteriorParahippocampal/sqrt(nrows));


in_PosteriorParahippocampal = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorParahippocampal-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorParahippocampal = readmatrix(in_PosteriorParahippocampal);
ALFF_PosteriorParahippocampal(:,1) = [];

mean_PosteriorParahippocampal = mean(ALFF_PosteriorParahippocampal);
[nrows, ncols] = size(ALFF_PosteriorParahippocampal);
std_PosteriorParahippocampal = std(ALFF_PosteriorParahippocampal);
SEM_PosteriorParahippocampal = (std_PosteriorParahippocampal/sqrt(nrows));


in_Lingual = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Lingual-lh-ns-vs-as-meanALFF.txt';
ALFF_Lingual = readmatrix(in_Lingual);
ALFF_Lingual(:,1) = [];

mean_Lingual = mean(ALFF_Lingual);
[nrows, ncols] = size(ALFF_Lingual);
std_Lingual = std(ALFF_Lingual);
SEM_Lingual = (std_Lingual/sqrt(nrows));


in_AnteriorTemporalFusiform = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-AnteriorTemporalFusiform-lh-ns-vs-as-meanALFF.txt';
ALFF_AnteriorTemporalFusiform = readmatrix(in_AnteriorTemporalFusiform);
ALFF_AnteriorTemporalFusiform(:,1) = [];

mean_AnteriorTemporalFusiform = mean(ALFF_AnteriorTemporalFusiform);
[nrows, ncols] = size(ALFF_AnteriorTemporalFusiform);
std_AnteriorTemporalFusiform = std(ALFF_AnteriorTemporalFusiform);
SEM_AnteriorTemporalFusiform = (std_AnteriorTemporalFusiform/sqrt(nrows));


in_PosteriorTemporalFusiform = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PosteriorTemporalFusiform-lh-ns-vs-as-meanALFF.txt';
ALFF_PosteriorTemporalFusiform = readmatrix(in_PosteriorTemporalFusiform);
ALFF_PosteriorTemporalFusiform(:,1) = [];

mean_PosteriorTemporalFusiform = mean(ALFF_PosteriorTemporalFusiform);
[nrows, ncols] = size(ALFF_PosteriorTemporalFusiform);
std_PosteriorTemporalFusiform = std(ALFF_PosteriorTemporalFusiform);
SEM_PosteriorTemporalFusiform = (std_PosteriorTemporalFusiform/sqrt(nrows));


in_TemporalOccipitalFusiform = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-TemporalOccipitalFusiform-lh-ns-vs-as-meanALFF.txt';
ALFF_TemporalOccipitalFusiform = readmatrix(in_TemporalOccipitalFusiform);
ALFF_TemporalOccipitalFusiform(:,1) = [];

mean_TemporalOccipitalFusiform = mean(ALFF_TemporalOccipitalFusiform);
[nrows, ncols] = size(ALFF_TemporalOccipitalFusiform);
std_TemporalOccipitalFusiform = std(ALFF_TemporalOccipitalFusiform);
SEM_TemporalOccipitalFusiform = (std_TemporalOccipitalFusiform/sqrt(nrows));


in_OccipitalFusiform = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-OccipitalFusiform-lh-ns-vs-as-meanALFF.txt';
ALFF_OccipitalFusiform = readmatrix(in_OccipitalFusiform);
ALFF_OccipitalFusiform(:,1) = [];

mean_OccipitalFusiform = mean(ALFF_OccipitalFusiform);
[nrows, ncols] = size(ALFF_OccipitalFusiform);
std_OccipitalFusiform = std(ALFF_OccipitalFusiform);
SEM_OccipitalFusiform = (std_OccipitalFusiform/sqrt(nrows));


in_FrontalOperculum = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-FrontalOperculum-lh-ns-vs-as-meanALFF.txt';
ALFF_FrontalOperculum = readmatrix(in_FrontalOperculum);
ALFF_FrontalOperculum(:,1) = [];

mean_FrontalOperculum = mean(ALFF_FrontalOperculum);
[nrows, ncols] = size(ALFF_FrontalOperculum);
std_FrontalOperculum = std(ALFF_FrontalOperculum);
SEM_FrontalOperculum = (std_FrontalOperculum/sqrt(nrows));


in_CentralOpercular = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-CentralOpercular-lh-ns-vs-as-meanALFF.txt';
ALFF_CentralOpercular = readmatrix(in_CentralOpercular);
ALFF_CentralOpercular(:,1) = [];

mean_CentralOpercular = mean(ALFF_CentralOpercular);
[nrows, ncols] = size(ALFF_CentralOpercular);
std_CentralOpercular = std(ALFF_CentralOpercular);
SEM_CentralOpercular = (std_CentralOpercular/sqrt(nrows));


in_ParietalOperculum = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-ParietalOperculum-lh-ns-vs-as-meanALFF.txt';
ALFF_ParietalOperculum = readmatrix(in_ParietalOperculum);
ALFF_ParietalOperculum(:,1) = [];

mean_ParietalOperculum = mean(ALFF_ParietalOperculum);
[nrows, ncols] = size(ALFF_ParietalOperculum);
std_ParietalOperculum = std(ALFF_ParietalOperculum);
SEM_ParietalOperculum = (std_ParietalOperculum/sqrt(nrows));


in_PlanumPolare = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PlanumPolare-lh-ns-vs-as-meanALFF.txt';
ALFF_PlanumPolare = readmatrix(in_PlanumPolare);
ALFF_PlanumPolare(:,1) = [];

mean_PlanumPolare = mean(ALFF_PlanumPolare);
[nrows, ncols] = size(ALFF_PlanumPolare);
std_PlanumPolare = std(ALFF_PlanumPolare);
SEM_PlanumPolare = (std_PlanumPolare/sqrt(nrows));


in_HeschlsGyrus = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-HeschlsGyrus-lh-ns-vs-as-meanALFF.txt';
ALFF_HeschlsGyrus = readmatrix(in_HeschlsGyrus);
ALFF_HeschlsGyrus(:,1) = [];

mean_HeschlsGyrus = mean(ALFF_HeschlsGyrus);
[nrows, ncols] = size(ALFF_HeschlsGyrus);
std_HeschlsGyrus = std(ALFF_HeschlsGyrus);
SEM_HeschlsGyrus = (std_HeschlsGyrus/sqrt(nrows));


in_PlanumTemporale = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-PlanumTemporale-lh-ns-vs-as-meanALFF.txt';
ALFF_PlanumTemporale = readmatrix(in_PlanumTemporale);
ALFF_PlanumTemporale(:,1) = [];

mean_PlanumTemporale = mean(ALFF_PlanumTemporale);
[nrows, ncols] = size(ALFF_PlanumTemporale);
std_PlanumTemporale = std(ALFF_PlanumTemporale);
SEM_PlanumTemporale = (std_PlanumTemporale/sqrt(nrows));


in_Supracalcarine = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-Supracalcarine-lh-ns-vs-as-meanALFF.txt';
ALFF_Supracalcarine = readmatrix(in_Supracalcarine);
ALFF_Supracalcarine(:,1) = [];

mean_Supracalcarine = mean(ALFF_Supracalcarine);
[nrows, ncols] = size(ALFF_Supracalcarine);
std_Supracalcarine = std(ALFF_Supracalcarine);
SEM_Supracalcarine = (std_Supracalcarine/sqrt(nrows));


in_OccipitalPole = '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/Mean_ALFF/lh/allsubs-OccipitalPole-lh-ns-vs-as-meanALFF.txt';
ALFF_OccipitalPole = readmatrix(in_OccipitalPole);
ALFF_OccipitalPole(:,1) = [];

mean_OccipitalPole = mean(ALFF_OccipitalPole);
[nrows, ncols] = size(ALFF_OccipitalPole);
std_OccipitalPole = std(ALFF_OccipitalPole);
SEM_OccipitalPole = (std_OccipitalPole/sqrt(nrows));


%%% Create the input data and errorbar data

% Create the input data and error bar data
y = [ mean_FrontalPole; mean_Insular; mean_SuperiorFrontal; mean_MiddleFrontal; mean_ParsTriangularis; mean_ParsOpercularis; mean_PrecentralGyrus; mean_TemporalPole; mean_AnteriorSuperiorTemporal; mean_PosteriorSuperiorTemporal; mean_AnteriorMiddleTemporal; mean_PosteriorMiddleTemporal; mean_TemporooccipitalMiddleTemporal; mean_AnteriorInferiorTemporal; mean_PosteriorInferiorTemporal; mean_TemporooccipitalInferiorTemporal; mean_Postcentral; mean_SuperiorParietal; mean_AnteriorSupramarginal; mean_PosteriorSupramarginal; mean_Angular; mean_SuperiorLateralOccipital; mean_InferiorLateralOccipital; mean_Intracalcarine; mean_FrontalMedial; mean_JuxtapositionalLobule; mean_Subcallosal; mean_Paracingulate; mean_AnteriorCingulate; mean_PosteriorCingulate; mean_Precuneous; mean_Cuneal; mean_FrontalOrbital; mean_AnteriorParahippocampal; mean_PosteriorParahippocampal; mean_Lingual; mean_AnteriorTemporalFusiform; mean_PosteriorTemporalFusiform; mean_TemporalOccipitalFusiform; mean_OccipitalFusiform; mean_FrontalOperculum; mean_CentralOpercular; mean_ParietalOperculum; mean_PlanumPolare; mean_HeschlsGyrus; mean_PlanumTemporale; mean_Supracalcarine; mean_OccipitalPole ] ;

err = [ SEM_FrontalPole; SEM_Insular; SEM_SuperiorFrontal; SEM_MiddleFrontal; SEM_ParsTriangularis; SEM_ParsOpercularis; SEM_PrecentralGyrus; SEM_TemporalPole; SEM_AnteriorSuperiorTemporal; SEM_PosteriorSuperiorTemporal; SEM_AnteriorMiddleTemporal; SEM_PosteriorMiddleTemporal; SEM_TemporooccipitalMiddleTemporal; SEM_AnteriorInferiorTemporal; SEM_PosteriorInferiorTemporal; SEM_TemporooccipitalInferiorTemporal; SEM_Postcentral; SEM_SuperiorParietal; SEM_AnteriorSupramarginal; SEM_PosteriorSupramarginal; SEM_Angular; SEM_SuperiorLateralOccipital; SEM_InferiorLateralOccipital; SEM_Intracalcarine; SEM_FrontalMedial; SEM_JuxtapositionalLobule; SEM_Subcallosal; SEM_Paracingulate; SEM_AnteriorCingulate; SEM_PosteriorCingulate; SEM_Precuneous; SEM_Cuneal; SEM_FrontalOrbital; SEM_AnteriorParahippocampal; SEM_PosteriorParahippocampal; SEM_Lingual; SEM_AnteriorTemporalFusiform; SEM_PosteriorTemporalFusiform; SEM_TemporalOccipitalFusiform; SEM_OccipitalFusiform; SEM_FrontalOperculum; SEM_CentralOpercular; SEM_ParietalOperculum; SEM_PlanumPolare; SEM_HeschlsGyrus; SEM_PlanumTemporale; SEM_Supracalcarine; SEM_OccipitalPole ] ;


b = bar(y, 'grouped');
title('Mean ALFF (Left Hemisphere)', 'FontSize', 20, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 15, 'FontWeight', 'bold')
xticklabels({ 'Frontal Pole', 'Insular', 'Superior Frontal', 'Middle Frontal', 'Pars Triangularis', 'Pars Opercularis', 'Precentral Gyrus', 'Temporal Pole', 'Anterior Superior Temporal', 'Posterior Superior Temporal', 'Anterior Middle Temporal', 'Posterior Middle Temporal', 'Temporooccipital Middle Temporal', 'Anterior Inferior Temporal', 'Posterior Inferior Temporal', 'Temporooccipital Inferior Temporal', 'Postcentral', 'Superior Parietal', 'Anterior Supramarginal', 'Posterior Supramarginal', 'Angular', 'Superior Lateral Occipital', 'Inferior Lateral Occipital', 'Intracalcarine', 'Frontal Medial', 'Juxtapositional Lobule', 'Subcallosal', 'Paracingulate', 'Anterior Cingulate', 'Posterior Cingulate', 'Precuneous', 'Cuneal', 'Frontal Orbital', 'Anterior Parahippocampal', 'Posterior Parahippocampal', 'Lingual', 'Anterior Temporal Fusiform', 'Posterior Temporal Fusiform', 'Temporal Occipital Fusiform', 'Occipital Fusiform', 'Frontal Operculum', 'Central Opercular', 'Parietal Operculum', 'Planum Polare', 'Heschls Gyrus', 'Planum Temporale', 'Supracalcarine', 'Occipital Pole'})
xtickangle(45)
ylabel('ALFF', 'FontSize', 15, 'FontWeight', 'bold')
b(1).FaceColor = [1 0.698 0.4]
b(2).FaceColor = [1 0.4 0.698]
b(3).FaceColor = [0.4 0.698 1]
hold on

% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(y);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y(:,i), err(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'No Stimulus', 'Visual Stimulus', 'Auditory Stimulus'}, 'FontSize', 12, 'Location', 'southoutside');
set(gcf,'position',[0 100 1000 800]);
saveas(b, '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/MeanALFF-lh.m')
saveas(gcf, '/Users/mszkcn/BrainStates_Test/Comparing_ALFF_Types/Analysis/Compare_Conditions/MeanALFF-lh.jpg')
