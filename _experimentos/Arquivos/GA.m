function [x,fval,exitflag,output,population,score] = GA(nvars,PopulationSize_Data,MaxGenerations_Data,FunctionTolerance_Data)

options = optimoptions('ga');
options = optimoptions(options,'MigrationDirection', 'both');
options = optimoptions(options,'FunctionTolerance', FunctionTolerance_Data);
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
