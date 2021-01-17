% Funcio que retorna el vector de caracteristiques d'una imatge
function [features, target] = getImageFeatures(im, fname)
    
    % Depenent de on volguem treure les imatges hem de treure el target
    % d'un lloc o de un altre
    
    k = strfind(fname,'Meta');
    
    if isempty(k)
        folder = split(fname,"/");
        target = str2num(folder{end-1});
    
    else
        folder = split(fname,"/");
        target = folder{end};
        target = split(target,".");
        target = str2num(target{1});
    
    end
    
    
    %% Calcul de caracteristiques
    % Calculem totes les caracteristiques
    hoghFeatures = getHogs(im);
    colorF = getColorFeatures(im);
    circleF = getIfCircle(im);
    %ratio = getImAreaRatio(im);  
    %cornerF = getCorners(im, 30);
    
    
    % Juntem totes les caracteristiques
    features = [hoghFeatures, colorF, circleF];
    features = reshape(features, 1, []);
    
    
    
end