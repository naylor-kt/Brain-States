%%% This is a workspace to create the plots to compare the different ways
%%% of calculating ALFF (ie mean ALFF VS ALFF of the mean time series)

%%%% This is a workspace to create the ALFF plots in matlab 


infile_AC = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/AC/allsubs-AC-as-ns-vs-MTS-fALFF-compare.txt';
fALFF_AC = readmatrix(infile_AC);
fALFF_AC(:,1) = [];


infile_HG = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/HG/allsubs-HG-as-ns-vs-MTS-fALFF-compare.txt';
fALFF_HG = readmatrix(infile_HG);
fALFF_HG(:,1) = [];


infile_PT = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/PT/allsubs-PT-as-ns-vs-MTS-fALFF-compare.txt';
fALFF_PT = readmatrix(infile_PT);
fALFF_PT(:,1) = [];

infile_V1 = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/V1/allsubs-V1-as-ns-vs-MTS-fALFF-compare.txt';
fALFF_V1 = readmatrix(infile_V1);
fALFF_V1(:,1) = [];


infile_Thal = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/Thal/allsubs-Thal-as-ns-vs-MTS-fALFF-compare.txt';
fALFF_Thal = readmatrix(infile_Thal);
fALFF_Thal(:,1) = [];


infile_MGB = '/Users/mszkcn/BrainStates_Test/Alternative_Analysis/Compare_Conditions/fALFF/MGB/allsubs-MGB-as-ns-vs-MTS-fALFF-compare.txt';
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

% Create the input data and error bar data 
y = [ mean_AC; mean_HG; mean_PT; mean_V1; mean_Thal; mean_MGB ] ;
err = [ SEM_AC; SEM_HG; SEM_PT; SEM_V1; SEM_Thal; SEM_MGB ] ;


b = bar(y, 'grouped');
title('fALFF of the Mean Time Series', 'FontSize', 20, 'FontWeight', 'bold')
xlabel('Brain Region', 'FontSize', 15, 'FontWeight', 'bold')
xticklabels({'AC', 'HG', 'PT', 'V1', 'Thal', 'MGB'})
ylabel('fALFF', 'FontSize', 15, 'FontWeight', 'bold')
b(1).FaceColor = [0.4 0.698 1]
b(2).FaceColor = [1 0.698 0.4]
b(3).FaceColor = [1 0.4 0.698] 
hold on

% Find the number of groups and the number of bars in each group
[ngroups, nbars] = size(y);
% Calculate the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, y(:,i), err(:,i), 'k', 'linestyle', 'none');
end
hold off

lg = legend('show', {'Auditory Stimulus', 'No Stimulus', 'Visual Stimulus'}, 'FontSize', 12, 'Location', 'southoutside');
set(gcf,'position',[0 100 1000 800]);
saveas(b, '/Users/mszkcn/BrainStates_Test/Graphs/fALFF/fALFF_of_Mean/fALFF-MTS-Single_Graph.m')
saveas(gcf, '/Users/mszkcn/BrainStates_Test/Graphs/fALFF/fALFF_of_Mean/fALFF-MTS-Single_Graph.jpg')
