%%%% This is a workspace to create the ALFF plots in matlab 

% Auditory Cortex
infile_AC_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ReHo_7-compare.txt';
reho_AC_7= readmatrix(infile_AC_7);
reho_AC_7(:,1) = [];

mean_AC_7 = mean(reho_AC_7);
[nrows, ncols] = size(reho_AC_7);
std_AC_7 = std(reho_AC_7);
SEM_AC_7 = (std_AC_7/sqrt(nrows));

infile_AC_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ReHo_19-compare.txt';
reho_AC_19= readmatrix(infile_AC_19);
reho_AC_19(:,1) = [];

mean_AC_19 = mean(reho_AC_19);
[nrows, ncols] = size(reho_AC_19);
std_AC_19 = std(reho_AC_19);
SEM_AC_19 = (std_AC_19/sqrt(nrows));

infile_AC_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-ReHo_27-compare.txt';
reho_AC_27= readmatrix(infile_AC_27);
reho_AC_27(:,1) = [];

mean_AC_27 = mean(reho_AC_27);
[nrows, ncols] = size(reho_AC_27);
std_AC_27 = std(reho_AC_27);
SEM_AC_27 = (std_AC_27/sqrt(nrows));

% Heschl's Gyrus
infile_HG_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ReHo_7-compare.txt';
reho_HG_7= readmatrix(infile_HG_7);
reho_HG_7(:,1) = [];

mean_HG_7 = mean(reho_HG_7);
[nrows, ncols] = size(reho_HG_7);
std_HG_7 = std(reho_HG_7);
SEM_HG_7 = (std_HG_7/sqrt(nrows));

infile_HG_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ReHo_19-compare.txt';
reho_HG_19= readmatrix(infile_HG_19);
reho_HG_19(:,1) = [];

mean_HG_19 = mean(reho_HG_19);
[nrows, ncols] = size(reho_HG_19);
std_HG_19 = std(reho_HG_19);
SEM_HG_19 = (std_HG_19/sqrt(nrows));

infile_HG_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-ReHo_27-compare.txt';
reho_HG_27= readmatrix(infile_HG_27);
reho_HG_27(:,1) = [];

mean_HG_27 = mean(reho_HG_27);
[nrows, ncols] = size(reho_HG_27);
std_HG_27 = std(reho_HG_27);
SEM_HG_27 = (std_HG_27/sqrt(nrows));


% Planum Temporale
infile_PT_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ReHo_7-compare.txt';
reho_PT_7= readmatrix(infile_PT_7);
reho_PT_7(:,1) = [];

mean_PT_7 = mean(reho_PT_7);
[nrows, ncols] = size(reho_PT_7);
std_PT_7 = std(reho_PT_7);
SEM_PT_7 = (std_PT_7/sqrt(nrows));

infile_PT_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ReHo_19-compare.txt';
reho_PT_19= readmatrix(infile_PT_19);
reho_PT_19(:,1) = [];

mean_PT_19 = mean(reho_PT_19);
[nrows, ncols] = size(reho_PT_19);
std_PT_19 = std(reho_PT_19);
SEM_PT_19 = (std_PT_19/sqrt(nrows));

infile_PT_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-ReHo_27-compare.txt';
reho_PT_27= readmatrix(infile_PT_27);
reho_PT_27(:,1) = [];

mean_PT_27 = mean(reho_PT_27);
[nrows, ncols] = size(reho_PT_27);
std_PT_27 = std(reho_PT_27);
SEM_PT_27 = (std_PT_27/sqrt(nrows));

% Primary Visual Cortex 
infile_V1_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ReHo_7-compare.txt';
reho_V1_7= readmatrix(infile_V1_7);
reho_V1_7(:,1) = [];

mean_V1_7 = mean(reho_V1_7);
[nrows, ncols] = size(reho_V1_7);
std_V1_7 = std(reho_V1_7);
SEM_V1_7 = (std_V1_7/sqrt(nrows));

infile_V1_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ReHo_19-compare.txt';
reho_V1_19= readmatrix(infile_V1_19);
reho_V1_19(:,1) = [];

mean_V1_19 = mean(reho_V1_19);
[nrows, ncols] = size(reho_V1_19);
std_V1_19 = std(reho_V1_19);
SEM_V1_19 = (std_V1_19/sqrt(nrows));

infile_V1_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-ReHo_27-compare.txt';
reho_V1_27= readmatrix(infile_V1_27);
reho_V1_27(:,1) = [];

mean_V1_27 = mean(reho_V1_27);
[nrows, ncols] = size(reho_V1_27);
std_V1_27 = std(reho_V1_27);
SEM_V1_27 = (std_V1_27/sqrt(nrows));


% Figure for nn=7
ReHo7fig = tiledlayout(2,2, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC_7);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 
er = errorbar(mean_AC_7, SEM_AC_7, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile
nexttile
b = bar(mean_HG_7);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 
er = errorbar(mean_HG_7, SEM_HG_7, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT_7);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]  
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 
er = errorbar(mean_PT_7, SEM_PT_7, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile
nexttile
b = bar(mean_V1_7);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 
er = errorbar(mean_V1_7, SEM_V1_7, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ReHo (Neighbourhood = 7 voxels) in they grey matter of each Brain Region in Presence of Different Stimuli', 'FontSize', 20)

saveas(ReHo7fig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/ReHo/Grey-MeanReHo-7-allAreas-allConds.m')

% Figure for nn=19
ReHo19fig = tiledlayout(2,2, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC_19);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]  
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_AC_19, SEM_AC_19, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile
nexttile
b = bar(mean_HG_19);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]  
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_HG_19, SEM_HG_19, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT_19);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_PT_19, SEM_PT_19, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th tile
nexttile
b = bar(mean_V1_19);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_V1_19, SEM_V1_19, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ReHo (Neighbourhood = 19 voxels) in each Brain Region in Presence of Different Stimuli', 'FontSize', 20)

saveas(ReHo19fig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/ReHo/Grey-MeanReHo-19-allAreas-allConds.m')

% Figure for nn=27
ReHo27fig = tiledlayout(2,2, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC_27);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_AC_27, SEM_AC_27, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile
nexttile
b = bar(mean_HG_27);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_HG_27, SEM_HG_27, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT_27);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_PT_27, SEM_PT_27, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile
nexttile
b = bar(mean_V1_27);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ReHo', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.5])
hold on 
er = errorbar(mean_V1_27, SEM_V1_27, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ReHo (Neighbourhood = 27 voxels) in each Brain Region in Presence of Different Stimuli', 'FontSize', 20)

saveas(ReHo27fig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/ReHo/Grey-MeanReHo-27-allAreas-allConds.m')

