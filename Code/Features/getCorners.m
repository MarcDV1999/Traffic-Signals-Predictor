% Calcula el descriptor de Harris. Detectem vertexs. Retornem el nombre de
% vertexos que te l'imatge
function cornerF = getCorners(im, numCorners)

    C = corner(rgb2gray(im), numCorners);
    cornerF = length(C);
       
end

