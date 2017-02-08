function [x,fval,exitflag,output,population,score] = GA(nvars,PopulationSize_Data,MaxGenerations_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationType', 'bitstring');
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'MutationFcn', {  @mutationuniform [] });
options = optimoptions(options,'Display', 'iter');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotdistance });
options = optimoptions(options,'UseVectorized', false);
options = optimoptions(options,'UseParallel', true);
[x,fval,exitflag,output,population,score] = ...
ga(@ClassificationSVMGA,nvars,[],[],[],[],[],[],[],[],options);
