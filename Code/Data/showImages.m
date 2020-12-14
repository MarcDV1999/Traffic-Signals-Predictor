function [] = showImages(images)
    figure;
    for i = 1:length(images)
        subplot(11, 12, i), imshow(images{i}), title(sprintf('%d-%d', ceil((i)/7) - 1, mod(i-1, 7)));
    end
