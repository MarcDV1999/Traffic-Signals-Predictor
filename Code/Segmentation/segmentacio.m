function imageSegmented = segmentacio(originalImage)
    im1gray = rgb2gray(originalImage);

    % Calculamos el umbral de forma automatica, no siempre va bien, 
    % a veces mejor calcularlo manualmente
    umbral = graythresh(im1gray);

    % Umbral calculado automaticamente
    imbw = im2bw(im1gray, umbral);

    % Como aun quedan restos... Rellenamos los agujeros de blanco 
    imbin = imfill(imbw, 'holes');
    
    imageSegmented = imbin
end