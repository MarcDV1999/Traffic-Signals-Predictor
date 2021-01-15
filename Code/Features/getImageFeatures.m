function features = getImageFeatures(im, fname, type, min_r, min_c, bw)
    
    if type == "Meta"
        folder = split(fname,"/");
        target = folder{4};
        target = split(target,".");
        target = str2num(target{1});
    
    elseif type == "Train"
        folder = split(fname,"/");
        target = str2num(folder{4});
    end
    
    
    %% Calcul de caracteristiques
    % Calculem totes les caracteristiques
    %circleF = getIfCircle(im);
    hoghFeatures = getHogs(im, min_r, min_c);
    colorF = getColorFeatures(im, min_r, min_c);
    %ratio = getImAreaRatio(im);  
    %cornerF = getCorners(im, 30);
    %colorF = getColorFeatures(im, fname);
    
    
    % Juntem totes les caracteristiques
    if type == "Predict"
        features = [hoghFeatures, colorF];
    else
        features = [hoghFeatures, colorF, target];
    end
    
    
end