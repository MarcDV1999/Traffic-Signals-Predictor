% Donada una imatge, retorna la caracteristica d'ahver trobat un cercle o
% no. Es a dir, retorna 1 si troba un cercle o 0 si no en troba
function circleF = getIfCircle(im)

    try 
        cercles = findCircles(im);
        circleF = 1;
    catch error
        circleF = 0;
    end
    
end

