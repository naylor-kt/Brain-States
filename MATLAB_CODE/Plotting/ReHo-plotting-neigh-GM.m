%%%% This is a workspace to create the ALFF plots in matlab 

% Auditory Cortex
infile_AC_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/AC/as-AC-grey-ReHo-neigh-compare.txt';
reho_AC_as= readmatrix(infile_AC_as);
reho_AC_as(:,1) = [];

mean_AC_as = mean(reho_AC_as);
[nrows, ncols] = size(reho_AC_as);
std_AC_as = std(reho_AC_as);
SEM_AC_as = (std_AC_as/sqrt(nrows));

infile_AC_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/AC/ns-AC-grey-ReHo-neigh-compare.txt';
reho_AC_ns= readmatrix(infile_AC_ns);
reho_AC_ns(:,1) = [];

mean_AC_ns = mean(reho_AC_ns);
[nrows, ncols] = size(reho_AC_ns);
std_AC_ns = std(reho_AC_ns);
SEM_AC_ns = (std_AC_ns/sqrt(nrows));

infile_AC_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/AC/vs-AC-grey-ReHo-neigh-compare.txt';
reho_AC_vs= readmatrix(infile_AC_vs);
reho_AC_vs(:,1) = [];

mean_AC_vs = mean(reho_AC_vs);
[nrows, ncols] = size(reho_AC_vs);
std_AC_vs = std(reho_AC_vs);
SEM_AC_vs = (std_AC_vs/sqrt(nrows));

% Planum Temporale
infile_PT_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/PT/as-PT-grey-ReHo-neigh-compare.txt';
reho_PT_as= readmatrix(infile_PT_as);
reho_PT_as(:,1) = [];

mean_PT_as = mean(reho_PT_as);
[nrows, ncols] = size(reho_PT_as);
std_PT_as = std(reho_PT_as);
SEM_PT_as = (std_PT_as/sqrt(nrows));

infile_PT_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/PT/ns-PT-grey-ReHo-neigh-compare.txt';
reho_PT_ns= readmatrix(infile_PT_ns);
reho_PT_ns(:,1) = [];

mean_PT_ns = mean(reho_PT_ns);
[nrows, ncols] = size(reho_PT_ns);
std_PT_ns = std(reho_PT_ns);
SEM_PT_ns = (std_PT_ns/sqrt(nrows));

infile_PT_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/PT/vs-PT-grey-ReHo-neigh-compare.txt';
reho_PT_vs= readmatrix(infile_PT_vs);
reho_PT_vs(:,1) = [];

mean_PT_vs = mean(reho_PT_vs);
[nrows, ncols] = size(reho_PT_vs);
std_PT_vs = std(reho_PT_vs);
SEM_PT_vs = (std_PT_vs/sqrt(nrows));

% HESCHL'S GYRUS
infile_HG_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/HG/as-HG-grey-ReHo-neigh-compare.txt';
reho_HG_as= readmatrix(infile_HG_as);
reho_HG_as(:,1) = [];

mean_HG_as = mean(reho_HG_as);
[nrows, ncols] = size(reho_HG_as);
std_HG_as = std(reho_HG_as);
SEM_HG_as = (std_HG_as/sqrt(nrows));

infile_HG_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/HG/ns-HG-grey-ReHo-neigh-compare.txt';
reho_HG_ns= readmatrix(infile_HG_ns);
reho_HG_ns(:,1) = [];

mean_HG_ns = mean(reho_HG_ns);
[nrows, ncols] = size(reho_HG_ns);
std_HG_ns = std(reho_HG_ns);
SEM_HG_ns = (std_HG_ns/sqrt(nrows));

infile_HG_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/HG/vs-HG-grey-ReHo-neigh-compare.txt';
reho_HG_vs= readmatrix(infile_HG_vs);
reho_HG_vs(:,1) = [];

mean_HG_vs = mean(reho_HG_vs);
[nrows, ncols] = size(reho_HG_vs);
std_HG_vs = std(reho_HG_vs);
SEM_HG_vs = (std_HG_vs/sqrt(nrows));

% PRIMARY VISUAL CORTEX
infile_V1_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/V1/as-V1-grey-ReHo-neigh-compare.txt';
reho_V1_as= readmatrix(infile_V1_as);
reho_V1_as(:,1) = [];

mean_V1_as = mean(reho_V1_as);
[nrows, ncols] = size(reho_V1_as);
std_V1_as = std(reho_V1_as);
SEM_V1_as = (std_V1_as/sqrt(nrows));

infile_V1_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/V1/ns-V1-grey-ReHo-neigh-compare.txt';
reho_V1_ns= readmatrix(infile_V1_ns);
reho_V1_ns(:,1) = [];

mean_V1_ns = mean(reho_V1_ns);
[nrows, ncols] = size(reho_V1_ns);
std_V1_ns = std(reho_V1_ns);
SEM_V1_ns = (std_V1_ns/sqrt(nrows));

infile_V1_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Grey_ROIs/V1/vs-V1-grey-ReHo-neigh-compare.txt';
reho_V1_vs= readmatrix(infile_V1_vs);
reho_V1_vs(:,1) = [];

mean_V1_vs = mean(reho_V1_vs);
[nrows, ncols] = size(reho_V1_vs);
std_V1_vs = std(reho_V1_vs);
SEM_V1_vs = (std_V1_vs/sqrt(nrows));

ReHofig = tiledlayout(4,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st tile
nexttile
b = bar(mean_AC_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Auditory Cortex- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_as, SEM_AC_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile 
nexttile 
b = bar(mean_AC_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Auditory Cortex- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_ns, SEM_AC_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile 
nexttile 
b = bar(mean_AC_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Auditory Cortex- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_vs, SEM_AC_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile 
nexttile
b = bar(mean_HG_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Heschls Gyrus- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_as, SEM_HG_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 5th Tile 
nexttile
b = bar(mean_HG_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Heschls Gyrus- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_ns, SEM_HG_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 6th Tile 
nexttile 
b = bar(mean_HG_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Heschls Gyrus- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_vs, SEM_HG_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 7th Tile 
nexttile 
b = bar(mean_PT_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Planum Temporale- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_as, SEM_PT_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 8th Tile 
nexttile 
b = bar(mean_PT_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Planum Temporale- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_ns, SEM_PT_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 9th Tile 
nexttile 
b = bar(mean_PT_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Planum Temporale- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_vs, SEM_PT_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 10th Tile 
nexttile 
b = bar(mean_V1_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Primary Visual Cortex- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_as, SEM_V1_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 11th Tile 
nexttile 
b = bar(mean_V1_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Primary Visual Cortex- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_ns, SEM_V1_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off
 
% 12th Tile
nexttile 
b = bar(mean_V1_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0 0.8]
b.CData(2, :) = [0 0.4 0]
b.CData(3, :) = [0 0.545 0.682]
title('Primary Visual Cortex- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_vs, SEM_V1_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ReHo in Neighbourhoods of Different Sizes in Grey Matter', 'FontSize', 30)

saveas(ReHofig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/Grey-ReHo-neigh-compare.m')