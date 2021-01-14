clear all;
%% Llegim les imatges i les guardem a un Cell Array
images = saveTrainImages();



%% Segmentem les imatges
%figure;
for i = 1:length(images)
    segmentedImage = segmentImageNew2(images{i});
    
    imwrite(segmentedImage, sprintf("/home/gerard/Documents/UPC/VC/Traffic-signals/Images/imatge%d.png", i));
    %subplot(11, 12, i), imshow(grad), title(sprintf('%d-%d', ceil((i)/7) - 1, mod(i-1, 7)));
end


