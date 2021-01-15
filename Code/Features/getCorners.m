function cornerF = getCorners(im, numCorners)

    %I = checkerboard(50,2,2);
    %imf = filterImage(im3);
    C = corner(rgb2gray(im), numCorners);
    cornerF = length(C);
        
    %imshow(rgb2gray(im));
    %hold on
    %plot(C(:,1),C(:,2),'r*');
end

