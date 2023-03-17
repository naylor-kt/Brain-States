%%% This is a workspace to create the plots to compare the different ways
%%% of calculating ALFF (ie mean ALFF VS ALFF of the mean time series)

% AUDITORY CORTEX 
infile_AC_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/AC/as-AC-fALFF-comparison.txt';
fALFF_AC_as = readmatrix(infile_AC_as);
fALFF_AC_as(:,1) = [];

mean_AC_as = mean(fALFF_AC_as);
[nrows, ncols] = size(fALFF_AC_as);
std_AC_as = std(fALFF_AC_as);
SEM_AC_as = (std_AC_as/sqrt(nrows));

infile_AC_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/AC/ns-AC-fALFF-comparison.txt';
fALFF_AC_ns = readmatrix(infile_AC_ns);
fALFF_AC_ns(:,1) = [];

mean_AC_ns = mean(fALFF_AC_ns);
[nrows, ncols] = size(fALFF_AC_ns);
std_AC_ns = std(fALFF_AC_ns);
SEM_AC_ns = (std_AC_ns/sqrt(nrows));

infile_AC_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/AC/vs-AC-fALFF-comparison.txt';
fALFF_AC_vs = readmatrix(infile_AC_vs);
fALFF_AC_vs(:,1) = [];

mean_AC_vs = mean(fALFF_AC_vs);
[nrows, ncols] = size(fALFF_AC_vs);
std_AC_vs = std(fALFF_AC_vs);
SEM_AC_vs = (std_AC_vs/sqrt(nrows));

% HESCHLS GYRUS 
infile_HG_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/HG/as-HG-fALFF-comparison.txt';
fALFF_HG_as = readmatrix(infile_HG_as);
fALFF_HG_as(:,1) = [];

mean_HG_as = mean(fALFF_HG_as);
[nrows, ncols] = size(fALFF_HG_as);
std_HG_as = std(fALFF_HG_as);
SEM_HG_as = (std_HG_as/sqrt(nrows));

infile_HG_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/HG/ns-HG-fALFF-comparison.txt';
fALFF_HG_ns = readmatrix(infile_HG_ns);
fALFF_HG_ns(:,1) = [];

mean_HG_ns = mean(fALFF_HG_ns);
[nrows, ncols] = size(fALFF_HG_ns);
std_HG_ns = std(fALFF_HG_ns);
SEM_HG_ns = (std_HG_ns/sqrt(nrows));

infile_HG_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/HG/vs-HG-fALFF-comparison.txt';
fALFF_HG_vs = readmatrix(infile_HG_vs);
fALFF_HG_vs(:,1) = [];

mean_HG_vs = mean(fALFF_HG_vs);
[nrows, ncols] = size(fALFF_HG_vs);
std_HG_vs = std(fALFF_HG_vs);
SEM_HG_vs = (std_HG_vs/sqrt(nrows));

% PLANUM TEMPORALE
infile_PT_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/PT/as-PT-fALFF-comparison.txt';
fALFF_PT_as = readmatrix(infile_PT_as);
fALFF_PT_as(:,1) = [];

mean_PT_as = mean(fALFF_PT_as);
[nrows, ncols] = size(fALFF_PT_as);
std_PT_as = std(fALFF_PT_as);
SEM_PT_as = (std_PT_as/sqrt(nrows));

infile_PT_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/PT/ns-PT-fALFF-comparison.txt';
fALFF_PT_ns = readmatrix(infile_PT_ns);
fALFF_PT_ns(:,1) = [];

mean_PT_ns = mean(fALFF_PT_ns);
[nrows, ncols] = size(fALFF_PT_ns);
std_PT_ns = std(fALFF_PT_ns);
SEM_PT_ns = (std_PT_ns/sqrt(nrows));

infile_PT_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/PT/vs-PT-fALFF-comparison.txt';
fALFF_PT_vs = readmatrix(infile_PT_vs);
fALFF_PT_vs(:,1) = [];

mean_PT_vs = mean(fALFF_PT_vs);
[nrows, ncols] = size(fALFF_PT_vs);
std_PT_vs = std(fALFF_PT_vs);
SEM_PT_vs = (std_PT_vs/sqrt(nrows));

% PRIMARY VISUAL CORTEX 
infile_V1_as = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/V1/as-V1-fALFF-comparison.txt';
fALFF_V1_as = readmatrix(infile_V1_as);
fALFF_V1_as(:,1) = [];

mean_V1_as = mean(fALFF_V1_as);
[nrows, ncols] = size(fALFF_V1_as);
std_V1_as = std(fALFF_V1_as);
SEM_V1_as = (std_V1_as/sqrt(nrows));

infile_V1_ns = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/V1/ns-V1-fALFF-comparison.txt';
fALFF_V1_ns = readmatrix(infile_V1_ns);
fALFF_V1_ns(:,1) = [];

mean_V1_ns = mean(fALFF_V1_ns);
[nrows, ncols] = size(fALFF_V1_ns);
std_V1_ns = std(fALFF_V1_ns);
SEM_V1_ns = (std_V1_ns/sqrt(nrows));

infile_V1_vs = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Comparison/Grey_Matter_ROIs/V1/vs-V1-fALFF-comparison.txt';
fALFF_V1_vs = readmatrix(infile_V1_vs);
fALFF_V1_vs(:,1) = [];

mean_V1_vs = mean(fALFF_V1_vs);
[nrows, ncols] = size(fALFF_V1_vs);
std_V1_vs = std(fALFF_V1_vs);
SEM_V1_vs = (std_V1_vs/sqrt(nrows));

% Create the input data and error bar data 
yas = [ mean_AC_as; mean_HG_as; mean_PT_as; mean_V1_as ] ;
yns = [ mean_AC_ns; mean_HG_ns; mean_PT_ns; mean_V1_ns ] ;
yvs = [ mean_AC_vs; mean_HG_vs; mean_PT_vs; mean_V1_vs ] ;

erras = [ SEM_AC_as; SEM_HG_as; SEM_PT_as; SEM_V1_as ] ;
errns = [ SEM_AC_ns; SEM_HG_ns; SEM_PT_ns; SEM_V1_ns ] ;
errvs = [ SEM_AC_vs; SEM_HG_vs; SEM_PT_vs; SEM_V1_vs ] ;



cfALFFfig = tiledlayout(1,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st tile
nexttile
b = bar(yas, 'grouped');
title('Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1'})
ylabel('fALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [0.6350 0.0780 0.1840]
b(2).FaceColor = [0.682 0.682 0];
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
annotation('textbox', [.03 .75 .1 .2], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 2nd tile
nexttile
b = bar(yns, 'grouped');
title('No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1'})
ylabel('fALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [0.6350 0.0780 0.1840]
b(2).FaceColor = [0.682 0.682 0];
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
annotation('textbox', [.35 .75 .1 .2], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 3rd tile
nexttile
b = bar(yvs, 'grouped');
title('Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1'})
ylabel('fALFF', 'FontSize', 10, 'FontWeight', 'bold')
b(1).FaceColor = [0.6350 0.0780 0.1840]
b(2).FaceColor = [0.682 0.682 0];
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
annotation('textbox', [.65 .75 .1 .2], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 20)
hold off

lg = legend('show', {'Mean fALFF', 'fALFF of the Mean Time Series'}, 'FontSize', 12);
lg.Layout.Tile = 'South'

sgtitle('Comparing Mean fALFF and fALFF of the Mean Time Series in the Grey Matter', 'FontSize', 20)
set(gcf,'position',[0 100 1000 800]);
saveas(cfALFFfig, '/Users/mszkcn/BrainStates_Test/Graphs/fALFF/Grey-ComparefALFFtypes-allAreas-allConds.m')
saveas(cfALFFfig, '/Users/mszkcn/BrainStates_Test/Graphs/fALFF/Grey-ComparefALFFtypes-allAreas-allConds.png')
