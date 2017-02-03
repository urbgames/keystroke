function [x,fval,exitflag,output,population,score] = GA(nvars,PopulationSize_Data,EliteCount_Data,MaxGenerations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationType', 'bitstring');
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'EliteCount', EliteCount_Data);
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'CrossoverFcn', @crossoversinglepoint);
options = optimoptions(options,'MutationFcn', {  @mutationuniform [] });
options = optimoptions(options,'SelectionFcn', {  @selectionGA });
options = optimoptions(options,'FitnessScalingFcn', {  @fitscalingprop });
options = optimoptions(options,'Display', 'iter');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotdistance });
[x,fval,exitflag,output,population,score] = ...
ga(@classificationSVM,nvars,[],[],[],[],[],[],[],[],options);
