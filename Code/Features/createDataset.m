% Funcio que crea el dataset 
function [features, target] = createDataset(train)

    % Llegim les imatges
    fprintf("Guardant totes les imatges\n\n");
    images = readall(train);
    names = train.Files;
    
    % Calculem quina es la mida minima
    fprintf("Redimensionant les imatges\n\n");
    [min_r,min_c] = minSize(images);
    min_r = 35;
    min_c = 35;
    resizedImages = resizeImages(images, min_r, min_c);
    
    [f, t] = getImageFeatures(filterImage(resizedImages{1}), names{1});
    data = ones(size(images,1), size(f,2) + 1);
    data(1, :) = [f, t];
    
    %% Generem el vector de caracteristiques     
    % Calcules els features de cada imatge i els afegim al dataset
    
    for i = 1:length(resizedImages)
        
        
        [f, t] = getImageFeatures(filterImage(resizedImages{i}), names{i});
        fprintf("Features de: %d - target %d \n", i, t);
        data(i, :) = [f, t];
    end
    
    % Una vegada tenim el dataset, fem un shuffle
    fprintf("Barrejant les mostres del dataset\n\n");
    all = data(randperm(size(data, 1)), :);
    
    features = all(:, [1:end-1]);
    target = all(:,[end]);
    fprintf("Dataset acabat\n\n");
end


