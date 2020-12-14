function images = saveTrainImages()
images = cell(1,18*7);
count = 0;
pos = 0;
    for i = 1:1:length(images)
        if pos < 10
            str_im = sprintf('../Images/Train1/%d/0000%d_0000%d_00000.png', pos, pos, count);
            images{i} = imread(str_im);
        else
            str_im = sprintf('../Images/Train1/%d/000%d_0000%d_00000.png', pos, pos, count);
            images{i} = imread(str_im);
        end

        if count == 6
            pos = pos + 1;
            count = 0;
        else
            count = count + 1;
        end
    end
end