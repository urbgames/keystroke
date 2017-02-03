function [validationAccuracy] = classificationSVMTeste()
tic
load baseMobile

data = baseMobile;

% CREATE PREDICTORS
predictors = data;

% DEFINE CLASS INDEX
classIndex = 69;

% REMOVE COLUMN CLASSINDEX
predictors(:,classIndex) = [];

% GET LABELS TABLE
predictorNames = predictors.Properties.VariableNames;

predictors = table2array(varfun(@double, predictors));
response = data.user_id;

% DEFINE CLASS NAMES
classNames = unique(response)';

% Train a classifier
template = templateSVM('KernelFunction', 'linear', 'PolynomialOrder', [], 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
trainedClassifier = fitcecoc(predictors, response, 'Learners', template, 'Coding', 'onevsone', 'PredictorNames', predictorNames, 'ResponseName', 'user_id', 'ClassNames', classNames);

% Perform cross-validation
partitionedModel = crossval(trainedClassifier, 'KFold', 10);

% Compute validation accuracy
validationAccuracy = kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');

toc