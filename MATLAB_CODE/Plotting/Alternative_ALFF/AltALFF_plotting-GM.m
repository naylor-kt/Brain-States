%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/ALFF/Grey_Matter_ROIs/AC/allsubs-AC-grey-as-ns-vs-MTS-ALFF-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];

infile_HG = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/ALFF/Grey_Matter_ROIs/HG/allsubs-HG-grey-as-ns-vs-MTS-ALFF-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];

infile_PT = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/ALFF/Grey_Matter_ROIs/PT/allsubs-PT-grey-as-ns-vs-MTS-ALFF-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/ALFF/Grey_Matter_ROIs/V1/allsubs-V1-grey-as-ns-vs-MTS-ALFF-compare.txt';
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
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]   
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('ALFF of the Mean Time Series', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.9])
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
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]    
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('ALFF of the Mean Time Series', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.9])
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
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]   
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('ALFF of the Mean Time Series', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.9])
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
b.CData(1, :) = [0 0.4 0.8]
b.CData(2, :) = [0.8 0.4 0]
b.CData(3, :) = [0.8 0 0.4]   
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('ALFF of the Mean Time Series', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.9])
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
annotation('textbox', [.5 .3 .1 .2], 'String', 'D', 'EdgeColor', 'none', 'FontSize', 20)
hold off

sgtitle('ALFF of the Mean Time Series in the Grey Matter of each Brain Region in Presence of Different Stimuli', 'FontSize', 15)
set(gcf,'position',[0 100 1000 800]);

saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Graphs/ALFF/ALFF_of_Mean/Grey-ALFF-MTS-allAreas-allConds.m')
saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Graphs/ALFF/ALFF_of_Mean/Grey-ALFF-MTS-allAreas-allConds.png')

