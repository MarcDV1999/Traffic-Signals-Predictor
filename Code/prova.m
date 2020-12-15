clear all;
addpath('OtherFunctions');  
addpath('Segmentation');


nClusters = 4;
seg = image2palette(nClusters, '../Images/Train1/1/00001_00000_00014.png' );

