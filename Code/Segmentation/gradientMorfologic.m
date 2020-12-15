function grad = gradientMorfologic(im)
    ee=strel('disk',1);
    grad = imsubtract(imdilate(im,ee),imerode(im,ee));
end