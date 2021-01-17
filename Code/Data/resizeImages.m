function resized = resizeImages(images, min_r,min_c)
    resized = images;
    for i = 1:length(images)
        resized{i} = imresize(images{i}, [min_r, min_c]);
    end
end

