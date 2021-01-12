function dataset = createDataset()

    [images, names] = saveTrainImages();
    dataset = [];
    
    try
        for i = 1:length(images)
            % Calcules els features de cada imatge i els afegim al dataset
            features = getImageFeatures(images{i}, names{i}, "Train");
            dataset = [dataset ; features];
        end
        
        
    catch error
    end
    
end


