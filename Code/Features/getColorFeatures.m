function colorFeatures = getColorFeatures(im, fname)
    nClusters = 3;
    [cluster_color, cluster_ratio, ~] = image2palette(nClusters, im, fname, false);
    
    
    % Creem un vector que per cada color tindrem 2 caracteristiques
    %colorFeatures = cluster_color(:,[2:nClusters]);
    colorFeatures = reshape(cluster_color, 1, []);
    
    % Guardarem 2 columnes que representen el seguent:
    % Red       Blue        Yellow
    % 43%       20%         10%
    
    %{
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
    %}
    
    colorFeatures = [colorFeatures, cluster_ratio];
        
end

