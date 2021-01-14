function dataset = createDataset()

    [images, names] = saveTrainImages();
    dataset = [];
    
    [min_r, min_c, ~] = size(images{1});
    for i = 1:length(images)
        [rows, columns, ~] = size(images{i});
        if (rows*columns) < (min_r * min_c)
            min_r = rows;
            min_c = columns;
        end        
    end

    for i = 1:length(images)
        % Calcules els features de cada imatge i els afegim al dataset
        %im_filtered = filterImage(images{i}); % No s'utilitza ja que dona
        %resultats lleujerament pitjors
        
        % Prova active countorn
        mask = zeros(size(images{i}));
        [x,y] = size(images{i});
        x = int8(x*0.1);
        y = int8(y*0.1);
        mask(x:end-x,y:end-y) = 1;
        bw = activecontour(images{i},mask);
        maskedRgbImage = bsxfun(@times, images{i}, cast(bw, 'like', images{i}));
        features = getImageFeatures(maskedRgbImage, names{i}, "Train", min_r, min_c, mask);
        
        %features = getImageFeatures(images{i}, names{i}, "Train", min_r, min_c);
        disp(size(features))
        dataset = [dataset ; features];
    end
        
        

    
end


