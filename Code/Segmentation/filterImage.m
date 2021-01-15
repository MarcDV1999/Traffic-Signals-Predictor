% Funcio que filtra una imatge amb un filtre de mitjana
function filteredImage = filterImage(im)
    H1 = fspecial("average", [2 2]);
    filteredImage = imfilter(im, H1); 
    
end

