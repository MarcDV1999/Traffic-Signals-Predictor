function hoghFeatures = ourExtractHOGFeatures(im, min_r, min_c)
    im = imresize(im, [min_r, min_c]);
    hoghFeatures = extractHOGFeatures(im);
end

