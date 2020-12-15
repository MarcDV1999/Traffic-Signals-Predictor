function imageSegmented = segmentacioGris(im)
    
    % Filtro Media (Vector de tamaño)
    H1 = fspecial('average', [2 2]);

    % Aplicamos el filtro a la imagen deseada
    im1 = imfilter(im, H1); 
    
    
    imgray = rgb2gray(im1);
    

    imageSegmented = imgray;
    imageSegmented = segmentImage3(imageSegmented);
    %imageSegmented = histeq(imgray);
    
    % Calculamos el umbral de forma automatica, no siempre va bien, 
    % a veces mejor calcularlo manualmente
    %umbral = graythresh(imgray);

    % Binarizamos la imagen
    % Ponemos la imagen a binarizar y un umbral

    % Umbral calculado automaticamente
    %imageSegmented = im2bw(imageSegmented, umbral);
    
    
    
    % Pasamos la imagen, el tipo de filtro, un umbral y una direccion(horiz, vert, both)
    %imageSegmented = edge(imgray, 'sobel');
    
end