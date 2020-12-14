addpath('OtherFunctions')  

%nCluster = 3; 
%imagefullpath = '../Images/Train1/14/00014_00001_00005.png';
%[a, b, c] = image2palette( nCluster, imagefullpath );

im = imread('../Images/Train1/14/00014_00001_00005.png');
hogs = hog_feature_vector(im);