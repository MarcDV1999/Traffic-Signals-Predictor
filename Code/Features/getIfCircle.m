function circleF = getIfCircle(im)

    try 
        cercles = findCircles(im);
        circleF = 1;
    catch error
        circleF = 0;
    end
    
end

