function features = getImageFeatures(im, fname, type, min_r, min_c, bw)
    
    if type == "Meta"
        folder = split(fname,"/");
        target = folder{4};
        target = split(target,".");
        target = str2num(target{1});
    end
    
    if type == "Train"
        folder = split(fname,"/");
        target = str2num(folder{4});
    end
    
    
    l = rgb2lab(im);
    
    
    try 
        cercles = findCircles(im);
        cercleFeature = 1;
    catch error
        cercleFeature = 0;
    end
    hoghFeatures = ourExtractHOGFeatures(im, min_r, min_c);
    colorF = getColorFeatures(im, fname);
    ratio = getImAreaRatio(im);    
    features = [colorF, hoghFeatures, cercleFeature, ratio, target];
    
end