%%% This is a workspace to create the plots to compare the different ways
%%% of calculating ALFF (ie mean ALFF VS ALFF of the mean time series)

% AUDITORY CORTEX 
infile_AC_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/AC/as-AC_ALFF_comparison.txt';
ALFF_AC_as = readmatrix(infile_AC_as);
ALFF_AC_as(:,1) = [];

mean_AC_as = mean(ALFF_AC_as);
[nrows, ncols] = size(ALFF_AC_as);
std_AC_as = std(ALFF_AC_as);
SEM_AC_as = (std_AC_as/sqrt(nrows));

infile_AC_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/AC/ns-AC_ALFF_comparison.txt';
ALFF_AC_ns = readmatrix(infile_AC_ns);
ALFF_AC_ns(:,1) = [];

mean_AC_ns = mean(ALFF_AC_ns);
[nrows, ncols] = size(ALFF_AC_ns);
std_AC_ns = std(ALFF_AC_ns);
SEM_AC_ns = (std_AC_ns/sqrt(nrows));

infile_AC_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/AC/vs-AC_ALFF_comparison.txt';
ALFF_AC_vs = readmatrix(infile_AC_vs);
ALFF_AC_vs(:,1) = [];

mean_AC_vs = mean(ALFF_AC_vs);
[nrows, ncols] = size(ALFF_AC_vs);
std_AC_vs = std(ALFF_AC_vs);
SEM_AC_vs = (std_AC_vs/sqrt(nrows));

% HESCHLS GYRUS 
infile_HG_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/HG/as-HG_ALFF_comparison.txt';
ALFF_HG_as = readmatrix(infile_HG_as);
ALFF_HG_as(:,1) = [];

mean_HG_as = mean(ALFF_HG_as);
[nrows, ncols] = size(ALFF_HG_as);
std_HG_as = std(ALFF_HG_as);
SEM_HG_as = (std_HG_as/sqrt(nrows));

infile_HG_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/HG/ns-HG_ALFF_comparison.txt';
ALFF_HG_ns = readmatrix(infile_HG_ns);
ALFF_HG_ns(:,1) = [];

mean_HG_ns = mean(ALFF_HG_ns);
[nrows, ncols] = size(ALFF_HG_ns);
std_HG_ns = std(ALFF_HG_ns);
SEM_HG_ns = (std_HG_ns/sqrt(nrows));

infile_HG_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/HG/vs-HG_ALFF_comparison.txt';
ALFF_HG_vs = readmatrix(infile_HG_vs);
ALFF_HG_vs(:,1) = [];

mean_HG_vs = mean(ALFF_HG_vs);
[nrows, ncols] = size(ALFF_HG_vs);
std_HG_vs = std(ALFF_HG_vs);
SEM_HG_vs = (std_HG_vs/sqrt(nrows));

% PLANUM TEMPORALE
infile_PT_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/PT/as-PT_ALFF_comparison.txt';
ALFF_PT_as = readmatrix(infile_PT_as);
ALFF_PT_as(:,1) = [];

mean_PT_as = mean(ALFF_PT_as);
[nrows, ncols] = size(ALFF_PT_as);
std_PT_as = std(ALFF_PT_as);
SEM_PT_as = (std_PT_as/sqrt(nrows));

infile_PT_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/PT/ns-PT_ALFF_comparison.txt';
ALFF_PT_ns = readmatrix(infile_PT_ns);
ALFF_PT_ns(:,1) = [];

mean_PT_ns = mean(ALFF_PT_ns);
[nrows, ncols] = size(ALFF_PT_ns);
std_PT_ns = std(ALFF_PT_ns);
SEM_PT_ns = (std_PT_ns/sqrt(nrows));

infile_PT_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/PT/vs-PT_ALFF_comparison.txt';
ALFF_PT_vs = readmatrix(infile_PT_vs);
ALFF_PT_vs(:,1) = [];

mean_PT_vs = mean(ALFF_PT_vs);
[nrows, ncols] = size(ALFF_PT_vs);
std_PT_vs = std(ALFF_PT_vs);
SEM_PT_vs = (std_PT_vs/sqrt(nrows));

% PRIMARY VISUAL CORTEX 
infile_V1_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/V1/as-V1_ALFF_comparison.txt';
ALFF_V1_as = readmatrix(infile_V1_as);
ALFF_V1_as(:,1) = [];

mean_V1_as = mean(ALFF_V1_as);
[nrows, ncols] = size(ALFF_V1_as);
std_V1_as = std(ALFF_V1_as);
SEM_V1_as = (std_V1_as/sqrt(nrows));

infile_V1_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/V1/ns-V1_ALFF_comparison.txt';
ALFF_V1_ns = readmatrix(infile_V1_ns);
ALFF_V1_ns(:,1) = [];

mean_V1_ns = mean(ALFF_V1_ns);
[nrows, ncols] = size(ALFF_V1_ns);
std_V1_ns = std(ALFF_V1_ns);
SEM_V1_ns = (std_V1_ns/sqrt(nrows));

infile_V1_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/V1/vs-V1_ALFF_comparison.txt';
ALFF_V1_vs = readmatrix(infile_V1_vs);
ALFF_V1_vs(:,1) = [];

mean_V1_vs = mean(ALFF_V1_vs);
[nrows, ncols] = size(ALFF_V1_vs);
std_V1_vs = std(ALFF_V1_vs);
SEM_V1_vs = (std_V1_vs/sqrt(nrows));

% THALAMUS
infile_Thal_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Thal/as-Thal_ALFF_comparison.txt';
ALFF_Thal_as = readmatrix(infile_Thal_as);
ALFF_Thal_as(:,1) = [];

mean_Thal_as = mean(ALFF_Thal_as);
[nrows, ncols] = size(ALFF_Thal_as);
std_Thal_as = std(ALFF_Thal_as);
SEM_Thal_as = (std_Thal_as/sqrt(nrows));

infile_Thal_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Thal/ns-Thal_ALFF_comparison.txt';
ALFF_Thal_ns = readmatrix(infile_Thal_ns);
ALFF_Thal_ns(:,1) = [];

mean_Thal_ns = mean(ALFF_Thal_ns);
[nrows, ncols] = size(ALFF_Thal_ns);
std_Thal_ns = std(ALFF_Thal_ns);
SEM_Thal_ns = (std_Thal_ns/sqrt(nrows));

infile_Thal_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Thal/vs-Thal_ALFF_comparison.txt';
ALFF_Thal_vs = readmatrix(infile_Thal_vs);
ALFF_Thal_vs(:,1) = [];

mean_Thal_vs = mean(ALFF_Thal_vs);
[nrows, ncols] = size(ALFF_Thal_vs);
std_Thal_vs = std(ALFF_Thal_vs);
SEM_Thal_vs = (std_Thal_vs/sqrt(nrows));

% MEDIAL GENICULATE BODY
infile_MGB_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/MGB/as-MGB_ALFF_comparison.txt';
ALFF_MGB_as = readmatrix(infile_MGB_as);
ALFF_MGB_as(:,1) = [];

mean_MGB_as = mean(ALFF_MGB_as);
[nrows, ncols] = size(ALFF_MGB_as);
std_MGB_as = std(ALFF_MGB_as);
SEM_MGB_as = (std_MGB_as/sqrt(nrows));

infile_MGB_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/MGB/ns-MGB_ALFF_comparison.txt';
ALFF_MGB_ns = readmatrix(infile_MGB_ns);
ALFF_MGB_ns(:,1) = [];

mean_MGB_ns = mean(ALFF_MGB_ns);
[nrows, ncols] = size(ALFF_MGB_ns);
std_MGB_ns = std(ALFF_MGB_ns);
SEM_MGB_ns = (std_MGB_ns/sqrt(nrows));

infile_MGB_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/MGB/vs-MGB_ALFF_comparison.txt';
ALFF_MGB_vs = readmatrix(infile_MGB_vs);
ALFF_MGB_vs(:,1) = [];

mean_MGB_vs = mean(ALFF_MGB_vs);
[nrows, ncols] = size(ALFF_MGB_vs);
std_MGB_vs = std(ALFF_MGB_vs);
SEM_MGB_vs = (std_MGB_vs/sqrt(nrows));

% Create the input data and error bar data 
yas = [ mean_AC_as; mean_HG_as; mean_PT_as; mean_V1_as; mean_Thal_as; mean_MGB_as ] ;
yns = [ mean_AC_ns; mean_HG_ns; mean_PT_ns; mean_V1_ns; mean_Thal_ns; mean_MGB_ns ] ;
yvs = [ mean_AC_vs; mean_HG_vs; mean_PT_vs; mean_V1_vs; mean_Thal_vs; mean_MGB_vs ] ;

erras = [ SEM_AC_as SEM_HG_as SEM_PT_as SEM_V1_as SEM_Thal_as SEM_MGB_as ] ;
errns = [ SEM_AC_ns SEM_HG_ns SEM_PT_ns SEM_V1_ns SEM_Thal_ns SEM_MGB_ns ] ;
errvs = [ SEM_AC_vs SEM_HG_vs SEM_PT_vs SEM_V1_vs SEM_Thal_vs SEM_MGB_vs ] ;



cALFFfig = tiledlayout(1,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st tile
nexttile
b = bar(yas, 'grouped');
title('Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [1 0 0]
b(2).FaceColor = [1 1 0.2];
hold on
% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(yas);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, yas(:,i), erras(:,i), 'k', 'linestyle', 'none');
end
hold off

% 2nd tile
nexttile
b = bar(yns, 'grouped');
title('No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [1 0 0]
b(2).FaceColor = [1 1 0.2];
hold on
% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(yns);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, yns(:,i), errns(:,i), 'k', 'linestyle', 'none');
end
hold off

% 3rd tile
nexttile
b = bar(yvs, 'grouped');
title('Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('ALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [1 0 0]
b(2).FaceColor = [1 1 0.2];
hold on
% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(yvs);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, yvs(:,i), errvs(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'Mean ALFF', 'ALFF of the Mean Time Series'}, 'FontSize', 12);
lg.Layout.Tile = 'South'

sgtitle('Comparing Mean ALFF and ALFF of the Mean Time Series', 'FontSize', 20)

saveas(cALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/ALFF/CompareALFFtypes-allAreas-allConds.m')
