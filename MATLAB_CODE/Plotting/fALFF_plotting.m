%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/AC/allsubs-AC-as-ns-vs-fALFF-compare.txt';
fALFF_AC = readmatrix(infile_AC);
fALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/HG/allsubs-HG-as-ns-vs-fALFF-compare.txt';
fALFF_HG = readmatrix(infile_HG);
fALFF_HG(:,1) = [];


infile_PT = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/PT/allsubs-PT-as-ns-vs-fALFF-compare.txt';
fALFF_PT = readmatrix(infile_PT);
fALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/V1/allsubs-V1-as-ns-vs-fALFF-compare.txt';
fALFF_V1 = readmatrix(infile_V1);
fALFF_V1(:,1) = [];


infile_Thal = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/Thal/allsubs-Thal-as-ns-vs-fALFF-compare.txt';
fALFF_Thal = readmatrix(infile_Thal);
fALFF_Thal(:,1) = [];


infile_MGB = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/MGB/allsubs-MGB-as-ns-vs-fALFF-compare.txt';
fALFF_MGB = readmatrix(infile_MGB);
fALFF_MGB(:,1) = [];


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

mean_Thal = mean(fALFF_Thal);
[nrows, ncols] = size(fALFF_Thal);
std_Thal = std(fALFF_Thal);
SEM_Thal = (std_Thal/sqrt(nrows));

mean_MGB = mean(fALFF_MGB);
[nrows, ncols] = size(fALFF_MGB);
std_MGB = std(fALFF_MGB);
SEM_MGB = (std_MGB/sqrt(nrows));

MeanfALFFfig = tiledlayout(2,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(mean_AC);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698] 
title('Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 2nd Tile 
nexttile
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698] 
title('Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 3rd Tile
nexttile
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698]  
title('Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 4th Tile
nexttile
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698] 
title('Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 5th Tile
nexttile
b = bar(mean_Thal);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698] 
title('Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_Thal, SEM_Thal, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

% 6th Tile
nexttile
b = bar(mean_MGB);
b.FaceColor ='flat'
b.CData(1, :) = [0.4 0.698 1]
b.CData(2, :) = [1 0.698 0.4]
b.CData(3, :) = [1 0.4 0.698] 
title('Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB, SEM_MGB, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

sgtitle('Mean fALFF in each Brain Region in Presence of Different Stimuli', 'FontSize', 15)

saveas(MeanfALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/fALFF/Mean_fALFF/MeanfALFF-allAreas-allConds.m')