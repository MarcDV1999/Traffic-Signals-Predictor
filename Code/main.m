%clear all;
addpath('OtherFunctions');  
addpath('Segmentation');
addpath('Features');
addpath('Data');
addpath('Predict');

%% Carreguem Imatges d'exemple
fname = '../Images/Train1/1/00001_00006_00024.png';
fname2 = '../Images/Train1/1/00001_00008_00024.png';
fname3 = '../Images/Train1/12/00012_00000_00000.png';
im = imread(fname);
im2 = imread(fname2);
im3 = imread(fname3);




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
%predictTrafficSignal();


%% Predim particio Test
%ypred = predictTest(xTest, yTest);
