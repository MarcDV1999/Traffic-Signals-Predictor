function colorF = getColorFeatures(im, min_r, min_c)
    
    im_resized = imresize(im, [min_r, min_c]);
    % Creem un vector que per cada color tindrem 2 caracteristiques
    
    red = histogram(im_resized(:,:,1),10).Values;
    green = histogram(im_resized(:,:,2), 10).Values;
    blue = histogram(im_resized(:,:,3), 10).Values;
    colorF = [red, green, blue];

end

