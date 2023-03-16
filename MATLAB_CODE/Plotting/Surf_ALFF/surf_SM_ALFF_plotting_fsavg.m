%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/AC/allsubs-as-ns-vs-surf_ALFF-SM-AC-lh-fsavg-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/HG/allsubs-as-ns-vs-surf_ALFF-SM-HG-lh-fsavg-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/PT/allsubs-as-ns-vs-surf_ALFF-SM-PT-lh-fsavg-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/V1/allsubs-as-ns-vs-surf_ALFF-SM-V1-lh-fsavg-compare.txt';
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile
nexttile
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile
nexttile
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ALFF on the Cortical Surface (Smoothed) in each Brain Region (Left) in Presence of Different Stimuli', 'FontSize', 15)

saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/ALFF/MeanALFF-surf-lh-SM-fsavg.m')


% Repeat for the Right Hemisphere 

%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/AC/allsubs-as-ns-vs-surf_ALFF-SM-AC-rh-fsavg-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/HG/allsubs-as-ns-vs-surf_ALFF-SM-HG-rh-fsavg-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/PT/allsubs-as-ns-vs-surf_ALFF-SM-PT-rh-fsavg-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/ALFF/Smoothed/V1/allsubs-as-ns-vs-surf_ALFF-SM-V1-rh-fsavg-compare.txt';
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0] 
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile
nexttile
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile
nexttile
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean ALFF on the Cortical Surface (Smoothed) in each Brain Region (Right) in Presence of Different Stimuli', 'FontSize', 15)

saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/ALFF/MeanALFF-surf-rh-SM-fsavg.m')


