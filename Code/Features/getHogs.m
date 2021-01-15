function hoghFeatures = getHogs(im, min_r, min_c)
    im = imresize(im, [min_r, min_c]);
    hoghFeatures = extractHOGFeatures(im);
end

