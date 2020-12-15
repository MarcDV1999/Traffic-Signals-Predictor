addpath('OtherFunctions');  
addpath('Segmentation');
%nCluster = 3; 
%imagefullpath = '../Images/Train1/14/00014_00001_00005.png';
%[a, b, c] = image2palette( nCluster, imagefullpath );

im = imread('../Images/Train1/10/00010_00000_00011.png');
%hogs = hog_feature_vector(im);

L = segmentacioFlor(im);
figure, imshow(L);

