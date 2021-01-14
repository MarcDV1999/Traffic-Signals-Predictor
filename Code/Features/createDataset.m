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
        
        
        
        features = getImageFeatures(images{i}, names{i}, "Train", min_r, min_c);
        %disp(size(features))
        dataset = [dataset ; features];
    end
        
    % Una vegada tenim el dataset, fem un shuffle
    dataset = dataset(randperm(size(dataset, 1)), :);
    
end


