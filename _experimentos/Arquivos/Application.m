function [x,fval,exitflag,output,population,score] = Application()

tic

nvars = 68;
%EliteCount_Data = 5; %Quantidade de pais para reprodu��o
MaxGenerations_Data = 200; %Quantidade de gera��es - Variar ao longo dos experimentos
PopulationSize_Data = 50; % Tamanho da popula��o
FunctionTolerance_Data = 0;

[x,fval,exitflag,output,population,score] = GA(nvars,PopulationSize_Data,MaxGenerations_Data,FunctionTolerance_Data);

save result

toc