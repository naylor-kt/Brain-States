%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/AC/allsubs-as-ns-vs-surf_ALFF-AC-lh-fs-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/HG/allsubs-as-ns-vs-surf_ALFF-HG-lh-fs-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/PT/allsubs-as-ns-vs-surf_ALFF-PT-lh-fs-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/V1/allsubs-as-ns-vs-surf_ALFF-V1-lh-fs-compare.txt';
ALFF_V1 = readmatrix(infile_V1);
ALFF_V1(:,1) = [];

%%%%%%%%%%%% Shows the mean ALFF across subjects and standard error of the
%%%%%%%%%%%% mean 

mean_AC = mean(ALFF_AC);
[nrows, ncols] = size(ALFF_AC);
std_AC = std(ALFF_AC);
SEM_AC = (std_AC/sqrt(nrows));

mean_HG = mean(ALFF_HG);
[nrows, ncols] = size(ALFF_HG);
std_HG = std(ALFF_HG);
SEM_HG = (std_HG/sqrt(nrows));

mean_PT = mean(ALFF_PT);
[nrows, ncols] = size(ALFF_PT);
std_PT = std(ALFF_PT);
SEM_PT = (std_PT/sqrt(nrows));

mean_V1 = mean(ALFF_V1);
[nrows, ncols] = size(ALFF_V1);
std_V1 = std(ALFF_V1);
SEM_V1 = (std_V1/sqrt(nrows));

MeanALFFfig = tiledlayout(2,2, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0] 
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .75 .1 .2], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 2nd Tile
nexttile
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .75 .1 .2], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 3rd Tile
nexttile
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0]  
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .3 .1 .2], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 4th Tile
nexttile
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0]   
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .3 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('Mean ALFF on the Cortical Surface in each Brain Region (Left) in Presence of Different Stimuli', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/ALFF/MeanALFF-surf-lh-fs.m')
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/ALFF/MeanALFF-surf-lh-fs.png')



% Repeat for the right hemisphere
%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/AC/allsubs-as-ns-vs-surf_ALFF-AC-rh-fs-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/HG/allsubs-as-ns-vs-surf_ALFF-HG-rh-fs-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/PT/allsubs-as-ns-vs-surf_ALFF-PT-rh-fs-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/V1/allsubs-as-ns-vs-surf_ALFF-V1-rh-fs-compare.txt';
ALFF_V1 = readmatrix(infile_V1);
ALFF_V1(:,1) = [];

%%%%%%%%%%%% Shows the mean ALFF across subjects and standard error of the
%%%%%%%%%%%% mean 

mean_AC = mean(ALFF_AC);
[nrows, ncols] = size(ALFF_AC);
std_AC = std(ALFF_AC);
SEM_AC = (std_AC/sqrt(nrows));

mean_HG = mean(ALFF_HG);
[nrows, ncols] = size(ALFF_HG);
std_HG = std(ALFF_HG);
SEM_HG = (std_HG/sqrt(nrows));

mean_PT = mean(ALFF_PT);
[nrows, ncols] = size(ALFF_PT);
std_PT = std(ALFF_PT);
SEM_PT = (std_PT/sqrt(nrows));

mean_V1 = mean(ALFF_V1);
[nrows, ncols] = size(ALFF_V1);
std_V1 = std(ALFF_V1);
SEM_V1 = (std_V1/sqrt(nrows));

MeanALFFfig = tiledlayout(2,2, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0]  
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .75 .1 .2], 'String', 'A', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 2nd Tile
nexttile
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .75 .1 .2], 'String', 'B', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 3rd Tile
nexttile
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0] 
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.03 .3 .1 .2], 'String', 'C', 'EdgeColor', 'none', 'FontSize', 20)
hold off

% 4th Tile
nexttile
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 1]
b.CData(2, :) = [1 1 0]
b.CData(3, :) = [1 0 0]   
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .3 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('Mean ALFF on the Cortical Surface in each Brain Region (Right) in Presence of Different Stimuli', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/ALFF/MeanALFF-surf-rh-fs.m')
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/ALFF/MeanALFF-surf-rh-fs.png')



