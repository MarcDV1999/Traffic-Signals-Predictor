function colorFeatures = getColorFeatures(im, fname)
    nClusters = 3;
    H1 = fspecial("average", [2 2]);
    im_filtered = imfilter(im, H1); 
    [cluster_color, cluster_ratio, cluster_labels] = image2palette(nClusters, im_filtered, fname, false);
    
    
    % Creem un vector que per cada color tindrem 2 caracteristiques
    %colorFeatures = cluster_color(:,[2:nClusters]);
    colorFeatures =[];
    
    % Guardarem 2 columnes que representen el seguent:
    % Red   Blue
    % 43%   20%
    
    blue_p = 0;
    red_p = 0;
    yellow_p = 0;
        
    for i = 1:nClusters
        lab = cluster_color(i,:);
        mainColor = getMainColor(lab);
        if mainColor == 0
            blue_p = cluster_ratio(i);
        elseif mainColor == 1
            red_p = cluster_ratio(i);
        elseif mainColor == 2
            yellow_p = cluster_ratio(i);
        end
    end
    colorFeatures = [colorFeatures, blue_p, red_p, yellow_p];
        
end

