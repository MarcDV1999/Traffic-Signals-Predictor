% Script per a provar les funcions de segmentacio per a les imatges de
% Train. Crida a la segmentacio que toqui per totes les imatges i les
% guarde a la carpeta Images
%% Llegim les imatges i les guardem a un Cell Array
images = saveTrainImages();



%% Segmentem les imatges
%figure;
for i = 1:length(images)
    %segmentedImage = segmentImageNew2(images{i});
    segmentedImage = findCircles(images{i});
    %imwrite(segmentedImage, sprintf("/home/gerard/Documents/UPC/VC/Traffic-signals/Images/imatge%d.png", i));
    imwrite(segmentedImage, sprintf("Images/imatge%d.png", i));
    %subplot(11, 12, i), imshow(grad), title(sprintf('%d-%d', ceil((i)/7) - 1, mod(i-1, 7)));
end


