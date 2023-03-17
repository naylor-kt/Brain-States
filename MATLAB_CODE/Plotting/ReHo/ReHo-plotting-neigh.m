%%%% This is a workspace to create the ALFF plots in matlab 

% Auditory Cortex
infile_AC_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/AC/as-AC-ReHo-neigh-compare.txt';
reho_AC_as= readmatrix(infile_AC_as);
reho_AC_as(:,1) = [];

mean_AC_as = mean(reho_AC_as);
[nrows, ncols] = size(reho_AC_as);
std_AC_as = std(reho_AC_as);
SEM_AC_as = (std_AC_as/sqrt(nrows));

infile_AC_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/AC/ns-AC-ReHo-neigh-compare.txt';
reho_AC_ns= readmatrix(infile_AC_ns);
reho_AC_ns(:,1) = [];

mean_AC_ns = mean(reho_AC_ns);
[nrows, ncols] = size(reho_AC_ns);
std_AC_ns = std(reho_AC_ns);
SEM_AC_ns = (std_AC_ns/sqrt(nrows));

infile_AC_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/AC/vs-AC-ReHo-neigh-compare.txt';
reho_AC_vs= readmatrix(infile_AC_vs);
reho_AC_vs(:,1) = [];

mean_AC_vs = mean(reho_AC_vs);
[nrows, ncols] = size(reho_AC_vs);
std_AC_vs = std(reho_AC_vs);
SEM_AC_vs = (std_AC_vs/sqrt(nrows));

% Planum Temporale
infile_PT_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/PT/as-PT-ReHo-neigh-compare.txt';
reho_PT_as= readmatrix(infile_PT_as);
reho_PT_as(:,1) = [];

mean_PT_as = mean(reho_PT_as);
[nrows, ncols] = size(reho_PT_as);
std_PT_as = std(reho_PT_as);
SEM_PT_as = (std_PT_as/sqrt(nrows));

infile_PT_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/PT/ns-PT-ReHo-neigh-compare.txt';
reho_PT_ns= readmatrix(infile_PT_ns);
reho_PT_ns(:,1) = [];

mean_PT_ns = mean(reho_PT_ns);
[nrows, ncols] = size(reho_PT_ns);
std_PT_ns = std(reho_PT_ns);
SEM_PT_ns = (std_PT_ns/sqrt(nrows));

infile_PT_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/PT/vs-PT-ReHo-neigh-compare.txt';
reho_PT_vs= readmatrix(infile_PT_vs);
reho_PT_vs(:,1) = [];

mean_PT_vs = mean(reho_PT_vs);
[nrows, ncols] = size(reho_PT_vs);
std_PT_vs = std(reho_PT_vs);
SEM_PT_vs = (std_PT_vs/sqrt(nrows));

% HESCHL'S GYRUS
infile_HG_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/HG/as-HG-ReHo-neigh-compare.txt';
reho_HG_as= readmatrix(infile_HG_as);
reho_HG_as(:,1) = [];

mean_HG_as = mean(reho_HG_as);
[nrows, ncols] = size(reho_HG_as);
std_HG_as = std(reho_HG_as);
SEM_HG_as = (std_HG_as/sqrt(nrows));

infile_HG_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/HG/ns-HG-ReHo-neigh-compare.txt';
reho_HG_ns= readmatrix(infile_HG_ns);
reho_HG_ns(:,1) = [];

mean_HG_ns = mean(reho_HG_ns);
[nrows, ncols] = size(reho_HG_ns);
std_HG_ns = std(reho_HG_ns);
SEM_HG_ns = (std_HG_ns/sqrt(nrows));

infile_HG_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/HG/vs-HG-ReHo-neigh-compare.txt';
reho_HG_vs= readmatrix(infile_HG_vs);
reho_HG_vs(:,1) = [];

mean_HG_vs = mean(reho_HG_vs);
[nrows, ncols] = size(reho_HG_vs);
std_HG_vs = std(reho_HG_vs);
SEM_HG_vs = (std_HG_vs/sqrt(nrows));

% PRIMARY VISUAL CORTEX
infile_V1_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/V1/as-V1-ReHo-neigh-compare.txt';
reho_V1_as= readmatrix(infile_V1_as);
reho_V1_as(:,1) = [];

mean_V1_as = mean(reho_V1_as);
[nrows, ncols] = size(reho_V1_as);
std_V1_as = std(reho_V1_as);
SEM_V1_as = (std_V1_as/sqrt(nrows));

infile_V1_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/V1/ns-V1-ReHo-neigh-compare.txt';
reho_V1_ns= readmatrix(infile_V1_ns);
reho_V1_ns(:,1) = [];

mean_V1_ns = mean(reho_V1_ns);
[nrows, ncols] = size(reho_V1_ns);
std_V1_ns = std(reho_V1_ns);
SEM_V1_ns = (std_V1_ns/sqrt(nrows));

infile_V1_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/V1/vs-V1-ReHo-neigh-compare.txt';
reho_V1_vs= readmatrix(infile_V1_vs);
reho_V1_vs(:,1) = [];

mean_V1_vs = mean(reho_V1_vs);
[nrows, ncols] = size(reho_V1_vs);
std_V1_vs = std(reho_V1_vs);
SEM_V1_vs = (std_V1_vs/sqrt(nrows));

% THALAMUS
infile_Thal_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Thal/as-Thal-ReHo-neigh-compare.txt';
reho_Thal_as= readmatrix(infile_Thal_as);
reho_Thal_as(:,1) = [];

mean_Thal_as = mean(reho_Thal_as);
[nrows, ncols] = size(reho_Thal_as);
std_Thal_as = std(reho_Thal_as);
SEM_Thal_as = (std_Thal_as/sqrt(nrows));

infile_Thal_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Thal/ns-Thal-ReHo-neigh-compare.txt';
reho_Thal_ns= readmatrix(infile_Thal_ns);
reho_Thal_ns(:,1) = [];

mean_Thal_ns = mean(reho_Thal_ns);
[nrows, ncols] = size(reho_Thal_ns);
std_Thal_ns = std(reho_Thal_ns);
SEM_Thal_ns = (std_Thal_ns/sqrt(nrows));

infile_Thal_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/Thal/vs-Thal-ReHo-neigh-compare.txt';
reho_Thal_vs= readmatrix(infile_Thal_vs);
reho_Thal_vs(:,1) = [];

mean_Thal_vs = mean(reho_Thal_vs);
[nrows, ncols] = size(reho_Thal_vs);
std_Thal_vs = std(reho_Thal_vs);
SEM_Thal_vs = (std_Thal_vs/sqrt(nrows));

% Medial Geniculate Body
infile_MGB_as = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/MGB/as-MGB-ReHo-neigh-compare.txt';
reho_MGB_as= readmatrix(infile_MGB_as);
reho_MGB_as(:,1) = [];

mean_MGB_as = mean(reho_MGB_as);
[nrows, ncols] = size(reho_MGB_as);
std_MGB_as = std(reho_MGB_as);
SEM_MGB_as = (std_MGB_as/sqrt(nrows));

infile_MGB_ns = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/MGB/ns-MGB-ReHo-neigh-compare.txt';
reho_MGB_ns= readmatrix(infile_MGB_ns);
reho_MGB_ns(:,1) = [];

mean_MGB_ns = mean(reho_MGB_ns);
[nrows, ncols] = size(reho_MGB_ns);
std_MGB_ns = std(reho_MGB_ns);
SEM_MGB_ns = (std_MGB_ns/sqrt(nrows));

infile_MGB_vs = '/Users/mszkcn/BrainStates_Test/Analysis/ReHo/Compare/Neighbourhood/MGB/vs-MGB-ReHo-neigh-compare.txt';
reho_MGB_vs= readmatrix(infile_MGB_vs);
reho_MGB_vs(:,1) = [];

mean_MGB_vs = mean(reho_MGB_vs);
[nrows, ncols] = size(reho_MGB_vs);
std_MGB_vs = std(reho_MGB_vs);
SEM_MGB_vs = (std_MGB_vs/sqrt(nrows));


ReHofig = tiledlayout(6,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st tile
nexttile
b = bar(mean_AC_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Auditory Cortex- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_as, SEM_AC_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .75 .1 .2], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 2nd Tile 
nexttile 
b = bar(mean_AC_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Auditory Cortex- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_ns, SEM_AC_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 .75 .1 .2], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 3rd Tile 
nexttile 
b = bar(mean_AC_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Auditory Cortex- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC_vs, SEM_AC_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 .75 .1 .2], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 4th Tile 
nexttile
b = bar(mean_HG_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Heschls Gyrus- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_as, SEM_HG_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .6 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 5th Tile 
nexttile
b = bar(mean_HG_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Heschls Gyrus- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_ns, SEM_HG_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 .6 .1 .2], 'String', 'E', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 6th Tile 
nexttile 
b = bar(mean_HG_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Heschls Gyrus- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG_vs, SEM_HG_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 .6 .1 .2], 'String', 'F', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 7th Tile 
nexttile 
b = bar(mean_PT_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Planum Temporale- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_as, SEM_PT_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .45 .1 .2], 'String', 'G', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 8th Tile 
nexttile 
b = bar(mean_PT_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Planum Temporale- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_ns, SEM_PT_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 .45 .1 .2], 'String', 'H', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 9th Tile 
nexttile 
b = bar(mean_PT_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Planum Temporale- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT_vs, SEM_PT_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 .45 .1 .2], 'String', 'I', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 10th Tile 
nexttile 
b = bar(mean_V1_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Primary Visual Cortex- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_as, SEM_V1_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .3 .1 .2], 'String', 'J', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 11th Tile 
nexttile 
b = bar(mean_V1_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Primary Visual Cortex- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_ns, SEM_V1_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 .3 .1 .2], 'String', 'K', 'EdgeColor', 'none', 'FontSize', 20)
hold off
 
% 12th Tile
nexttile 
b = bar(mean_V1_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Primary Visual Cortex- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1_vs, SEM_V1_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 .3 .1 .2], 'String', 'L', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 13th tile 
nexttile
b = bar(mean_Thal_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Thalamus- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_Thal_as, SEM_Thal_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .15 .1 .2], 'String', 'M', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 14th tile 
nexttile
b = bar(mean_Thal_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Thalamus- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_Thal_ns, SEM_Thal_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 .15 .1 .2], 'String', 'N', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 15th Tile 
nexttile 
b = bar(mean_Thal_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Thalamus- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_Thal_vs, SEM_Thal_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 .15 .1 .2], 'String', 'O', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 16th Tile
nexttile
b = bar(mean_MGB_as);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Medial Geniculate Body- Auditory Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB_as, SEM_MGB_as, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 0 .1 .2], 'String', 'P', 'EdgeColor', 'none', 'FontSize', 20)
hold off

%17th Tile 
nexttile
b = bar(mean_MGB_ns);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Medial Geniculate Body- No Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB_ns, SEM_MGB_ns, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.35 0 .1 .2], 'String', 'Q', 'EdgeColor', 'none', 'FontSize', 20)
hold off

%18th Tile
nexttile
b = bar(mean_MGB_vs);
b.FaceColor ='flat'
b.CData(1, :) = [0.698 0.4 1]
b.CData(2, :) = [0.4660 0.6740 0.1880]
b.CData(3, :) = [0.3010 0.7450 0.9330]
title('Medial Geniculate Body- Visual Stimulus', 'FontSize', 10, 'FontWeight', 'bold')
xlabel('Neighbourhood Size', 'FontSize', 10, 'FontWeight', 'bold')
xticklabels({'7', '19', '27'})
ylabel('Mean ReHo', 'FontSize', 10, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB_vs, SEM_MGB_vs, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.65 0 .1 .2], 'String', 'R', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('Mean ReHo in Neighbourhoods of Different Sizes', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);
saveas(ReHofig, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/ReHo-neigh-compare.m')
saveas(ReHofig, '/Users/mszkcn/BrainStates_Test/Graphs/ReHo/ReHo-neigh-compare.png')