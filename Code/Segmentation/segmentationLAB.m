function segmentedImage = segmentationLAB(im)
    %% Kmeans simple LAB
    % https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html
    
    nClusters = 3;
    H1 = fspecial("average", [2 2]);
    im_filtered = imfilter(im, H1); 
    [cluster_color, cluster_ratio, cluster_labels] = image2palette(nClusters, im_filtered, fname);
%figure, imshow(seg), title("B");
end