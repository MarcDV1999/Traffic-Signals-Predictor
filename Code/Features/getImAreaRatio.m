function ratio = getImAreaRatio(im)
    % Prova active countorn
    mask = zeros(size(im));
    [x,y] = size(im);
    x = int8(x*0.1);
    y = int8(y*0.1);
    mask(x:end-x,y:end-y) = 1;
    bw = activecontour(im,mask);
    bw = imfill(bw, 'holes');
    totalPixels = numel(bw);
    numWhitePixels = sum(bw(:));
    numBlackPixels = totalPixels - numWhitePixels;
    ratio = numWhitePixels  / numBlackPixels;
end

