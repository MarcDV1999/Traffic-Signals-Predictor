% Retornem el el descriptor de color. En aquest cas retornem els
% histogrames RGB de la Imatge
function colorF = getColorFeatures(im)
    
    %im_resized = imresize(im, [min_r, min_c]);
    % Creem un vector que per cada color tindrem 2 caracteristiques
    
    %red = histogram(im(:,:,1)).Values;
    %green = histogram(im(:,:,2)).Values;
    %blue = histogram(im(:,:,3)).Values;
    
    red =imhist(im(:,:,1), 10);
    red = reshape(red, 1, []);
    
    %green =imhist(im(:,:,2), 10);
    %green = reshape(green, 1, []);
    
    blue =imhist(im(:,:,3), 10);
    blue = reshape(blue, 1, []);
    
    colorF = [red, blue];

end

