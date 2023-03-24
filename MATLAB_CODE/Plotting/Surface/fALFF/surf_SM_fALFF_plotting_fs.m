%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/AC/allsubs-as-ns-vs-surf_fALFF-SM-AC-lh-fs-compare.txt';
fALFF_AC = readmatrix(infile_AC);
fALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/HG/allsubs-as-ns-vs-surf_fALFF-SM-HG-lh-fs-compare.txt';
fALFF_HG = readmatrix(infile_HG);
fALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/PT/allsubs-as-ns-vs-surf_fALFF-SM-PT-lh-fs-compare.txt';
fALFF_PT = readmatrix(infile_PT);
fALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/V1/allsubs-as-ns-vs-surf_fALFF-SM-V1-lh-fs-compare.txt';
fALFF_V1 = readmatrix(infile_V1);
fALFF_V1(:,1) = [];

%%%%%%%%%%%% Shows the mean ALFF across subjects and standard error of the
%%%%%%%%%%%% mean 

mean_AC = mean(fALFF_AC);
[nrows, ncols] = size(fALFF_AC);
std_AC = std(fALFF_AC);
SEM_AC = (std_AC/sqrt(nrows));

mean_HG = mean(fALFF_HG);
[nrows, ncols] = size(fALFF_HG);
std_HG = std(fALFF_HG);
SEM_HG = (std_HG/sqrt(nrows));

mean_PT = mean(fALFF_PT);
[nrows, ncols] = size(fALFF_PT);
std_PT = std(fALFF_PT);
SEM_PT = (std_PT/sqrt(nrows));

mean_V1 = mean(fALFF_V1);
[nrows, ncols] = size(fALFF_V1);
std_V1 = std(fALFF_V1);
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
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .3 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('Mean fALFF on the Cortical Surface (Smoothed) in each Brain Region (Left) in Presence of Different Stimuli', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/fALFF/MeanfALFF-surf-lh-SM-fs.m')
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/fALFF/MeanfALFF-surf-lh-SM-fs.png')


% Repeat for the Right Hemisphere

%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/AC/allsubs-as-ns-vs-surf_fALFF-SM-AC-rh-fs-compare.txt';
fALFF_AC = readmatrix(infile_AC);
fALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/HG/allsubs-as-ns-vs-surf_fALFF-SM-HG-rh-fs-compare.txt';
fALFF_HG = readmatrix(infile_HG);
fALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/PT/allsubs-as-ns-vs-surf_fALFF-SM-PT-rh-fs-compare.txt';
fALFF_PT = readmatrix(infile_PT);
fALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Surface/Analysis/Compare_Conditions/fALFF/Smoothed/V1/allsubs-as-ns-vs-surf_fALFF-SM-V1-rh-fs-compare.txt';
fALFF_V1 = readmatrix(infile_V1);
fALFF_V1(:,1) = [];

%%%%%%%%%%%% Shows the mean ALFF across subjects and standard error of the
%%%%%%%%%%%% mean 

mean_AC = mean(fALFF_AC);
[nrows, ncols] = size(fALFF_AC);
std_AC = std(fALFF_AC);
SEM_AC = (std_AC/sqrt(nrows));

mean_HG = mean(fALFF_HG);
[nrows, ncols] = size(fALFF_HG);
std_HG = std(fALFF_HG);
SEM_HG = (std_HG/sqrt(nrows));

mean_PT = mean(fALFF_PT);
[nrows, ncols] = size(fALFF_PT);
std_PT = std(fALFF_PT);
SEM_PT = (std_PT/sqrt(nrows));

mean_V1 = mean(fALFF_V1);
[nrows, ncols] = size(fALFF_V1);
std_V1 = std(fALFF_V1);
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
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0] 
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
b.CData(1, :) = [0 0 0.8]
b.CData(2, :) = [0.8 0.8 0]
b.CData(3, :) = [0.8 0 0]  
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
% ylim([0 2.5])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .3 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('Mean fALFF on the Cortical Surface (Smoothed) in each Brain Region (Right) in Presence of Different Stimuli', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/fALFF/MeanfALFF-surf-rh-SM-fs.m')
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Surface/Graphs/Smoothed/fALFF/MeanfALFF-surf-rh-SM-fs.png')


