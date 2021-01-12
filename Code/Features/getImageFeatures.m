function features = getImageFeatures(im, fname, type)
    
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
    
    
    colorF = getColorFeatures(im, fname);
    features = [colorF, target];
    
end