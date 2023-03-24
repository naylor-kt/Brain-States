%%% This is a workspace to create the plots to compare the different ways
%%% of calculating ALFF (ie mean ALFF VS ALFF of the mean time series)
%%%% This is a workspace to create the ALFF plots in matlab 

% Auditory Cortex
infile_AC_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/AC/allsubs-AC-as-ns-vs-ReHo_7-compare.txt';
reho_AC_7= readmatrix(infile_AC_7);
reho_AC_7(:,1) = [];

mean_AC_7 = mean(reho_AC_7);
[nrows, ncols] = size(reho_AC_7);
std_AC_7 = std(reho_AC_7);
SEM_AC_7 = (std_AC_7/sqrt(nrows));

infile_AC_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/AC/allsubs-AC-as-ns-vs-ReHo_19-compare.txt';
reho_AC_19= readmatrix(infile_AC_19);
reho_AC_19(:,1) = [];

mean_AC_19 = mean(reho_AC_19);
[nrows, ncols] = size(reho_AC_19);
std_AC_19 = std(reho_AC_19);
SEM_AC_19 = (std_AC_19/sqrt(nrows));

infile_AC_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/AC/allsubs-AC-as-ns-vs-ReHo_27-compare.txt';
reho_AC_27= readmatrix(infile_AC_27);
reho_AC_27(:,1) = [];

mean_AC_27 = mean(reho_AC_27);
[nrows, ncols] = size(reho_AC_27);
std_AC_27 = std(reho_AC_27);
SEM_AC_27 = (std_AC_27/sqrt(nrows));

% Heschl's Gyrus
infile_HG_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/HG/allsubs-HG-as-ns-vs-ReHo_7-compare.txt';
reho_HG_7= readmatrix(infile_HG_7);
reho_HG_7(:,1) = [];

mean_HG_7 = mean(reho_HG_7);
[nrows, ncols] = size(reho_HG_7);
std_HG_7 = std(reho_HG_7);
SEM_HG_7 = (std_HG_7/sqrt(nrows));

infile_HG_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/HG/allsubs-HG-as-ns-vs-ReHo_19-compare.txt';
reho_HG_19= readmatrix(infile_HG_19);
reho_HG_19(:,1) = [];

mean_HG_19 = mean(reho_HG_19);
[nrows, ncols] = size(reho_HG_19);
std_HG_19 = std(reho_HG_19);
SEM_HG_19 = (std_HG_19/sqrt(nrows));

infile_HG_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/HG/allsubs-HG-as-ns-vs-ReHo_27-compare.txt';
reho_HG_27= readmatrix(infile_HG_27);
reho_HG_27(:,1) = [];

mean_HG_27 = mean(reho_HG_27);
[nrows, ncols] = size(reho_HG_27);
std_HG_27 = std(reho_HG_27);
SEM_HG_27 = (std_HG_27/sqrt(nrows));


% Planum Temporale
infile_PT_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/PT/allsubs-PT-as-ns-vs-ReHo_7-compare.txt';
reho_PT_7= readmatrix(infile_PT_7);
reho_PT_7(:,1) = [];

mean_PT_7 = mean(reho_PT_7);
[nrows, ncols] = size(reho_PT_7);
std_PT_7 = std(reho_PT_7);
SEM_PT_7 = (std_PT_7/sqrt(nrows));

infile_PT_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/PT/allsubs-PT-as-ns-vs-ReHo_19-compare.txt';
reho_PT_19= readmatrix(infile_PT_19);
reho_PT_19(:,1) = [];

mean_PT_19 = mean(reho_PT_19);
[nrows, ncols] = size(reho_PT_19);
std_PT_19 = std(reho_PT_19);
SEM_PT_19 = (std_PT_19/sqrt(nrows));

infile_PT_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/PT/allsubs-PT-as-ns-vs-ReHo_27-compare.txt';
reho_PT_27= readmatrix(infile_PT_27);
reho_PT_27(:,1) = [];

mean_PT_27 = mean(reho_PT_27);
[nrows, ncols] = size(reho_PT_27);
std_PT_27 = std(reho_PT_27);
SEM_PT_27 = (std_PT_27/sqrt(nrows));

% Primary Visual Cortex 
infile_V1_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/V1/allsubs-V1-as-ns-vs-ReHo_7-compare.txt';
reho_V1_7= readmatrix(infile_V1_7);
reho_V1_7(:,1) = [];

mean_V1_7 = mean(reho_V1_7);
[nrows, ncols] = size(reho_V1_7);
std_V1_7 = std(reho_V1_7);
SEM_V1_7 = (std_V1_7/sqrt(nrows));

infile_V1_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/V1/allsubs-V1-as-ns-vs-ReHo_19-compare.txt';
reho_V1_19= readmatrix(infile_V1_19);
reho_V1_19(:,1) = [];

mean_V1_19 = mean(reho_V1_19);
[nrows, ncols] = size(reho_V1_19);
std_V1_19 = std(reho_V1_19);
SEM_V1_19 = (std_V1_19/sqrt(nrows));

infile_V1_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/V1/allsubs-V1-as-ns-vs-ReHo_27-compare.txt';
reho_V1_27= readmatrix(infile_V1_27);
reho_V1_27(:,1) = [];

mean_V1_27 = mean(reho_V1_27);
[nrows, ncols] = size(reho_V1_27);
std_V1_27 = std(reho_V1_27);
SEM_V1_27 = (std_V1_27/sqrt(nrows));


% Thalamus
infile_Thal_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Thal/allsubs-Thal-as-ns-vs-ReHo_7-compare.txt';
reho_Thal_7= readmatrix(infile_Thal_7);
reho_Thal_7(:,1) = [];

mean_Thal_7 = mean(reho_Thal_7);
[nrows, ncols] = size(reho_Thal_7);
std_Thal_7 = std(reho_Thal_7);
SEM_Thal_7 = (std_Thal_7/sqrt(nrows));

infile_Thal_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Thal/allsubs-Thal-as-ns-vs-ReHo_19-compare.txt';
reho_Thal_19= readmatrix(infile_Thal_19);
reho_Thal_19(:,1) = [];

mean_Thal_19 = mean(reho_Thal_19);
[nrows, ncols] = size(reho_Thal_19);
std_Thal_19 = std(reho_Thal_19);
SEM_Thal_19 = (std_Thal_19/sqrt(nrows));

infile_Thal_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/Thal/allsubs-Thal-as-ns-vs-ReHo_27-compare.txt';
reho_Thal_27= readmatrix(infile_Thal_27);
reho_Thal_27(:,1) = [];

mean_Thal_27 = mean(reho_Thal_27);
[nrows, ncols] = size(reho_Thal_27);
std_Thal_27 = std(reho_Thal_27);
SEM_Thal_27 = (std_Thal_27/sqrt(nrows));


% Medial Geniculate Body 
infile_MGB_7 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/MGB/allsubs-MGB-as-ns-vs-ReHo_7-compare.txt';
reho_MGB_7= readmatrix(infile_MGB_7);
reho_MGB_7(:,1) = [];

mean_MGB_7 = mean(reho_MGB_7);
[nrows, ncols] = size(reho_MGB_7);
std_MGB_7 = std(reho_MGB_7);
SEM_MGB_7 = (std_MGB_7/sqrt(nrows));

infile_MGB_19 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/MGB/allsubs-MGB-as-ns-vs-ReHo_19-compare.txt';
reho_MGB_19= readmatrix(infile_MGB_19);
reho_MGB_19(:,1) = [];

mean_MGB_19 = mean(reho_MGB_19);
[nrows, ncols] = size(reho_MGB_19);
std_MGB_19 = std(reho_MGB_19);
SEM_MGB_19 = (std_MGB_19/sqrt(nrows));

infile_MGB_27 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ReHo/MGB/allsubs-MGB-as-ns-vs-ReHo_27-compare.txt';
reho_MGB_27= readmatrix(infile_MGB_27);
reho_MGB_27(:,1) = [];

mean_MGB_27 = mean(reho_MGB_27);
[nrows, ncols] = size(reho_MGB_27);
std_MGB_27 = std(reho_MGB_27);
SEM_MGB_27 = (std_MGB_27/sqrt(nrows));


% for ReHo 7
% Create the input data and error bar data 
y7 = [ mean_AC_7; mean_HG_7; mean_PT_7; mean_V1_7; mean_Thal_7; mean_MGB_7 ] ;
err7 = [ SEM_AC_7; SEM_HG_7; SEM_PT_7; SEM_V1_7; SEM_Thal_7; SEM_MGB_7 ] ;


b7 = bar(y7, 'grouped');
title('Mean ReHo (Neighbourhood = 7 Voxels)', 'FontSize', 20, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 15, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ReHo', 'FontSize', 15, 'FontWeight', 'bold')
b7(1).FaceColor = [0.4 0.698 1]
b7(2).FaceColor = [1 0.698 0.4]
b7(3).FaceColor = [1 0.4 0.698] 
hold on

% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(y7);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y7(:,i), err7(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12, 'Location', 'southoutside');

set(gcf,'position',[0 100 1000 800]);
saveas(b7, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-7-Single_Graph.m')
saveas(gcf, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-7-Single_Graph.jpg')


% for ReHo 19
% Create the input data and error bar data 
y19 = [ mean_AC_19; mean_HG_19; mean_PT_19; mean_V1_19; mean_Thal_19; mean_MGB_19 ] ;
err19 = [ SEM_AC_19; SEM_HG_19; SEM_PT_19; SEM_V1_19; SEM_Thal_19; SEM_MGB_19 ] ;


b19 = bar(y19, 'grouped');
title('Mean ReHo (Neighbourhood = 19 Voxels)', 'FontSize', 20, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 15, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ReHo', 'FontSize', 15, 'FontWeight', 'bold')
b19(1).FaceColor = [0.4 0.698 1]
b19(2).FaceColor = [1 0.698 0.4]
b19(3).FaceColor = [1 0.4 0.698] 
hold on

% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(y19);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y19(:,i), err19(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12, 'Location', 'southoutside');

set(gcf,'position',[0 100 1000 800]);
saveas(b19, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-19-Single_Graph.m')
saveas(gcf, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-19-Single_Graph.jpg')

% for ReHo 27
% Create the input data and error bar data 
y27 = [ mean_AC_27; mean_HG_27; mean_PT_27; mean_V1_27; mean_Thal_27; mean_MGB_27 ] ;
err27 = [ SEM_AC_27; SEM_HG_27; SEM_PT_27; SEM_V1_27; SEM_Thal_27; SEM_MGB_27 ] ;


b27 = bar(y27, 'grouped');
title('Mean ReHo (Neighbourhood = 27 Voxels)', 'FontSize', 20, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 15, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ReHo', 'FontSize', 15, 'FontWeight', 'bold')
b27(1).FaceColor = [0.4 0.698 1]
b27(2).FaceColor = [1 0.698 0.4]
b27(3).FaceColor = [1 0.4 0.698] 
hold on

% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(y27);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y27(:,i), err27(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12, 'Location', 'southoutside');

set(gcf,'position',[0 100 1000 800]);
saveas(b27, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-27-Single_Graph.m')
saveas(gcf, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/MeanReHo-27-Single_Graph.jpg')