function images = saveMetaImages()
    images = cell(1,42);
    for i = 1:1:length(images)
        str_im = sprintf('../../Images/Meta/%d.png', i);
        images{i} = imread(str_im);
    end
end