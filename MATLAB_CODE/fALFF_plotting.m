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
figure()
fALFFfig = subplot(2, 3, 1, 'align')
b = bar(fALFF_AC); 
title('Mean fALFF for each subject in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])
hold on 

subplot(2, 3, 2, 'align')
bar(fALFF_HG) 
title('Mean fALFF for each subject in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

subplot(2, 3, 3, 'align')
bar(fALFF_PT) 
title('Mean fALFF for each subject in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

subplot(2, 3, 4, 'align')
bar(fALFF_V1) 
title('Mean fALFF for each subject in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

subplot(2, 3, 5, 'align')
bar(fALFF_Thal) 
title('Mean fALFF for each subject in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

subplot(2, 3, 6, 'align')
bar(fALFF_MGB) 
title('Mean fALFF for each subject in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Subjects', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
ylim([0 0.7])

% add a bit space to the figure
fig = gcf;
fig.Position(3) = fig.Position(3) + 800;
% add legend
Lgnd = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 20);
Lgnd.Position(1) = 0;
Lgnd.Position(2) = 0.5;
hold off

saveas(fALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/MeanfALFF-individSUBS-allAreas-allConds.m')


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

figure()
MeanfALFFfig = subplot(2, 3, 1, 'align')
b = bar(mean_AC);
b.FaceColor ='flat'
b.CData(1, :) = [0 0.4470 0.7410]
b.CData(2, :) = [0.8500 0.3250 0.0980]
b.CData(3, :) = [0.9290 0.6940 0.1250] 
title('Mean fALFF in the Auditory Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
title('Mean fALFF in the Heschls Gyrus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
title('Mean fALFF in the Planum Temporale', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
title('Mean fALFF in the Primary Visual Cortex', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
title('Mean fALFF in the Thalamus', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
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
title('Mean fALFF in the Medial Geniculate Body', 'FontSize', 13, 'FontWeight', 'bold')
xlabel('Conditions', 'FontSize', 12, 'FontWeight', 'bold')
xticklabels({'as', 'ns', 'vs'})
ylabel('Mean fALFF', 'FontSize', 12, 'FontWeight', 'bold')
hold on 
er = errorbar(mean_MGB, SEM_MGB, 'LineWidth', 1)
er.Color = [0 0 0];                            
er.LineStyle = 'none';
hold off

saveas(MeanfALFFfig, '/Users/mszkcn/BrainStates_Test/Analysis/Compare_Conditions/fALFF/MeanfALFF-allAreas-allConds.m')