clear all;
addpath('OtherFunctions');  
addpath('Segmentation');
addpath('Features');
addpath('OtherFunctions/FuzzyColor');

%% Load Image
fname = '../Images/Train1/1/00001_00006_00024.png';
fname2 = '../Images/Train1/1/00001_00008_00024.png';
fname3 = '../Images/Train1/12/00012_00000_00000.png';
im = imread(fname);
im2 = imread(fname2);
im3 = imread(fname3);
% Conseguim quin tipus de senyal es



%% Load Color Features

%f = getColorFeatures(im, fname);
%data = createDataset();
%[featureVector,hogVisualization] = extractHOGFeatures(im);
%disp(size(featureVector));
%x = histogram(featureVector, 9).Values;

%l = rgb2lab(im3);
%figure,
%x = histogram(l, 30).Values;



bin = segmentImage(im);
% Mask the image using bsxfun() function
maskedRgbImage = bsxfun(@times, im, cast(bin, 'like', im));

figure,
imshow(maskedRgbImage);
