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

%%%%% Shows the mean ALFF for each subject individually 
figure()
ALFFfig = subplot(2, 3, 1, 'align')
b = bar(ALFF_AC); 
title('Mean ALFF for each subject in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])
hold on 

subplot(2, 3, 2, 'align')
bar(ALFF_HG) 
title('Mean ALFF for each subject in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

subplot(2, 3, 3, 'align')
bar(ALFF_PT) 
title('Mean ALFF for each subject in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

subplot(2, 3, 4, 'align')
bar(ALFF_V1) 
title('Mean ALFF for each subject in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

subplot(2, 3, 5, 'align')
bar(ALFF_Thal) 
title('Mean ALFF for each subject in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

subplot(2, 3, 6, 'align')
bar(ALFF_MGB) 
title('Mean ALFF for each subject in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 5.5])

% add a bit space to the figure
fig = gcf;
fig.Position(3) = fig.Position(3) + 800;
% add legend
Lgnd = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 20);
Lgnd.Position(1) = 0;
Lgnd.Position(2) = 0.5;
hold off

saveas(ALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/MeanALFF-individSUBS-allAreas-allConds.m')


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

mean_Thal = mean(ALFF_Thal);
[nrows, ncols] = size(ALFF_Thal);
std_Thal = std(ALFF_Thal);
SEM_Thal = (std_Thal/sqrt(nrows));

mean_MGB = mean(ALFF_MGB);
[nrows, ncols] = size(ALFF_MGB);
std_MGB = std(ALFF_MGB);
SEM_MGB = (std_MGB/sqrt(nrows));

figure()
MeanALFFfig = subplot(2, 3, 1, 'align')
b = bar(mean_AC);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_AC, SEM_AC, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

subplot(2, 3, 2, 'align')
b = bar(mean_HG);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_HG, SEM_HG, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

subplot(2, 3, 3, 'align')
b = bar(mean_PT);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_PT, SEM_PT, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

subplot(2, 3, 4, 'align')
b = bar(mean_V1);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_V1, SEM_V1, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

subplot(2, 3, 5, 'align')
b = bar(mean_Thal);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_Thal, SEM_Thal, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

subplot(2, 3, 6, 'align')
b = bar(mean_MGB);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean ALFF in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean ALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB, SEM_MGB, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

saveas(MeanALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/ALFF/MeanALFF-allAreas-allConds.m')


