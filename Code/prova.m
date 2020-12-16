clear all;
addpath('OtherFunctions');  
addpath('Segmentation');

%% Load Image
fname = '../Images/Train1/2/00002_00004_00014.png';
im = imread(fname);


%% image2palette()
nClusters = 3;
H1 = fspecial("average", [3 3]);
im_filtered = imfilter(im, H1); 
%seg = image2palette(nClusters, im_filtered, fname);



%% Kmeans simple RGB
% https://www.mathworks.com/help/images/ref/imsegkmeans.html

L = imsegkmeans(im,nClusters);
B = labeloverlay(im,L);
%figure, imshow(B), title("B");



%% Kmeans simple LAB
% https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html
segmentedImage = segmentationLAB(im);
segmentedImageFiltered = segmentationLAB(im_filtered);
figure, subplot(2,2,1), imshow(im), title("original");
subplot(2,2,2), imshow(segmentedImage), title("segmented Image");
subplot(2,2,3), imshow(im_filtered), title("Image Filtered");
subplot(2,2,4), imshow(segmentedImageFiltered), title("segmented Image Filtered");