% Funcio que retorna el vector de caracteristiques d'una imatge
function features = getImageFeatures(im, fname, type, min_r, min_c, bw)
    
    % Depenent de on volguem treure les imatges hem de treure el target
    % d'un lloc o de un altre
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
    hoghFeatures = getHogs(im, min_r, min_c);
    colorF = getColorFeatures(im, min_r, min_c);
    %circleF = getIfCircle(im);
    %ratio = getImAreaRatio(im);  
    %cornerF = getCorners(im, 30);
    
    
    % Juntem totes les caracteristiques
    if type == "Predict"
        features = [hoghFeatures, colorF];
    else
        features = [hoghFeatures, colorF, target];
    end
    
    
end