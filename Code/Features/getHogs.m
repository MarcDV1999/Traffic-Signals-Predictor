% Calcula el descriptor de Hogs
function hoghFeatures = getHogs(im)
    %im = imresize(im, [min_r, min_c]);
    hoghFeatures = extractHOGFeatures(im);
end

