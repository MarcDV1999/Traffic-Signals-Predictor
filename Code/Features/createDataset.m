function dataset = createDataset()

    % Importem les imatges
    [images, names] = saveTrainImages();
 
    [min_r,min_c] = minSize(images);
    
    
    
    %% Generem el vector de caracteristiques
    features = getImageFeatures(filterImage(images{1}), names{1}, "Train", min_r, min_c);
    dataset = ones(size(images,2), size(features,2));
    dataset(1, :) = features(:);
     
    % Calcules els features de cada imatge i els afegim al dataset
    for i = 2:length(images)
        features = getImageFeatures(filterImage(images{i}), names{i}, "Train", min_r, min_c);
        
        % Mostrem quantes features queden per generarse
        if (mod(i,30) == 0) 
            fprintf("Processat:%d%\n", length(images)-i);
        end

        dataset(i, :) = features(:);
    end
        
    % Una vegada tenim el dataset, fem un shuffle
    dataset = dataset(randperm(size(dataset, 1)), :);
    
end


