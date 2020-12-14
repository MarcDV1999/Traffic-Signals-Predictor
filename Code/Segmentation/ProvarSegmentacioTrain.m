clear all;
addpath('../Data');
%% Llegim les imatges i les guardem a un Cell Array
images = saveTrainImages();



%% Segmentem les imatges
figure;
for i = 1:length(images)
    
    segmentedImage = findCircles(images{i});
    if isempty(segmentedImage)
        segmentedImage = images{i};
    end
    
    subplot(11, 12, i), imshow(segmentedImage), title(sprintf('%d-%d', ceil((i)/7) - 1, mod(i-1, 7)));
end


