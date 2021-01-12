function colorFeatures = getColorFeatures(im, fname)
    nClusters = 3;
    H1 = fspecial("average", [2 2]);
    im_filtered = imfilter(im, H1); 
    [cluster_color, cluster_ratio, cluster_labels] = image2palette(nClusters, im_filtered, fname, false);
    %cluster_color(1,2)
   
    % Creem un vector que per cada color tindrem 2 caracteristiques
    colorFeatures = cluster_color(:,[2:nClusters]);
    colorFeatures = reshape(colorFeatures, 1, []);
        
end

