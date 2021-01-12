clear all;
addpath('OtherFunctions');  
addpath('Segmentation');
addpath('Features');
addpath('OtherFunctions/FuzzyColor');

%% Load Image
fname = '../Images/Train1/1/00001_00006_00024.png';
fname2 = '../Images/Train1/1/00001_00008_00024.png';
im = imread(fname);
im2 = imread(fname2);
% Conseguim quin tipus de senyal es


%% image2palette()
%nClusters = 3;
%H1 = fspecial("average", [2 2]);
%im_filtered = imfilter(im, H1); 
%[cluster_color, cluster_ratio, cluster_labels] = image2palette(nClusters, im_filtered, fname);
%figure, imshow(seg), title("B");


%% Kmeans simple RGB
% https://www.mathworks.com/help/images/ref/imsegkmeans.html

%L = imsegkmeans(im,nClusters);
%B = labeloverlay(im,L);
%figure, imshow(B), title("B");



%% Kmeans simple LAB
% https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html
%segmentedImage = segmentationLAB(im);
%segmentedImageFiltered = segmentationLAB(im_filtered);

%figure, subplot(2,2,1), imshow(im), title("original");
%subplot(2,2,2), imshow(segmentedImage), title("segmented Image");
%subplot(2,2,3), imshow(im_filtered), title("Image Filtered");
%subplot(2,2,4), imshow(segmentedImageFiltered), title("segmented Image Filtered");

%% Load Color Features

%f = getColorFeatures(im, fname);
%data = createDataset();
[featureVector,hogVisualization] = extractHOGFeatures(im);
disp(size(featureVector));
x = histogram(featureVector, 9).Values;

%y = hist(featureVector, 9);

%[featureVector,hogVisualization] = extractHOGFeatures(im2);
%disp(size(featureVector));


%figure;
%imshow(im); 
%hold on;
%plot(hogVisualization);
