function filteredImage = filterImage(im)
    H1 = fspecial("average", [2 2]);
    filteredImage = imfilter(im, H1); 
    
end

