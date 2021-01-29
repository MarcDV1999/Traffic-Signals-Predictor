%clear all;
addpath('OtherFunctions');  
addpath('Segmentation');
addpath('Features');
addpath('Data');
addpath('Predict');
addpath('Images');



%% Creem Dataset i particions
%{
data = imageDatastore(fullfile("../Images"),'IncludeSubfolders',true,'FileExtensions','.png','LabelSource','foldernames');
random = shuffle(data);

[train,test] = splitEachLabel(random,0.8);
[xTrain , yTrain] = createDataset(train);
[xTest , yTest] = createDataset(test);

datasetRBCircles35 = [xTrain , yTrain];
%}

%% Guardem el model
%save KNNRBCircle35 KNNRBCircle35

%% Predim una imatge
predictTrafficSignal();


%% Predim particio Test
%ypred = predictTest(xTest, yTest);
