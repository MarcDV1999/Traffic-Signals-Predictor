function segmentedImage = segmentationLAB(im)
    %% Kmeans simple LAB
    % https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html

    im_lab = rgb2lab(im);
    ab = im_lab(:,:,2:3);
    ab = im2single(ab);
    nColors = 4;
    % repeat the clustering 3 times to avoid local minima
    [pixel_labels, centroids] = imsegkmeans(ab,nColors,'NumAttempts',3);
    segmentedImage = label2rgb(pixel_labels, 'gray', 'c');
end