clear all;
addpath('../Data');
%% Llegim les imatges i les guardem a un Cell Array
images = saveTrainImages();



%% Segmentem les imatges
figure;
for i = 1:length(images)
    H1 = fspecial('average', [2 2]);
    im = imfilter(images{i}, H1); 
    ee=strel('disk',1);
    grad = imsubtract(imdilate(im,ee),imerode(im,ee));
    
    imwrite(grad, sprintf("Images/imatge%d.png", i));
    %subplot(11, 12, i), imshow(grad), title(sprintf('%d-%d', ceil((i)/7) - 1, mod(i-1, 7)));
end


