%%%% This is a workspace to create the ALFF plots in matlab 

infile_AC = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/AC/allsubs-AC-as-ns-vs-ALFF-compare.txt';
ALFF_AC = readmatrix(infile_AC);
ALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/HG/allsubs-HG-as-ns-vs-ALFF-compare.txt';
ALFF_HG = readmatrix(infile_HG);
ALFF_HG(:,1) = [];


infile_PT = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/PT/allsubs-PT-as-ns-vs-ALFF-compare.txt';
ALFF_PT = readmatrix(infile_PT);
ALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/V1/allsubs-V1-as-ns-vs-ALFF-compare.txt';
ALFF_V1 = readmatrix(infile_V1);
ALFF_V1(:,1) = [];


infile_Thal = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/Thal/allsubs-Thal-as-ns-vs-ALFF-compare.txt';
ALFF_Thal = readmatrix(infile_Thal);
ALFF_Thal(:,1) = [];


infile_MGB = '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/MGB/allsubs-MGB-as-ns-vs-ALFF-compare.txt';
ALFF_MGB = readmatrix(infile_MGB);
ALFF_MGB(:,1) = [];

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


%%%%% Shows the mean ALFF for each subject individually 
ALFFfig = tiledlayout(2,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(ALFF_AC); 
title('Mean ALFF for each subject in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])
hold on 

% 2nd tile
nexttile
bar(ALFF_HG)
title('Mean ALFF for each subject in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

% 3rd Tile
nexttile
bar(ALFF_PT)
title('Mean ALFF for each subject in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

% 4th Tile
nexttile
bar(ALFF_V1)
title('Mean ALFF for each subject in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

% 5th Tile
nexttile
bar(ALFF_Thal) 
title('Mean ALFF for each subject in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

% 6th Tile 
nexttile
bar(ALFF_MGB)
title('Mean ALFF for each subject in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])


lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12);
lg.Layout.Tile = 'South';

sgtitle('Mean ALFF for individual subjects in each Brain Region in Presence of Different Stimuli', 'FontSize', 15)

saveas(ALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/ALFF/MeanALFF-individSUBS-allAreas-allConds.m')



%%%%% Shows the mean ALFF for each subject individually 
fALFFfig = tiledlayout(2,3, 'TileIndexing', 'rowmajor','TileSpacing','Loose');

% 1st Tile
nexttile
b = bar(fALFF_AC);
title('Mean fALFF for each subject in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 

% 2nd Tile
nexttile
bar(fALFF_HG)
title('Mean fALFF for each subject in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

% 3rd Tile 
nexttile
bar(fALFF_PT)
title('Mean fALFF for each subject in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

% 4th Tile 
nexttile
bar(fALFF_V1)
title('Mean fALFF for each subject in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

% 5th tile
nexttile
bar(fALFF_Thal)
title('Mean fALFF for each subject in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

% 6th Tile
nexttile
bar(fALFF_MGB)
title('Mean fALFF for each subject in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold off

lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12);
lg.Layout.Tile = 'South';

sgtitle('Mean fALFF for individual subjects in each Brain Region in Presence of Different Stimuli', 'FontSize', 15)

saveas(fALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Graphs/fALFF/MeanfALFF-individSUBS-allAreas-allConds.m')

