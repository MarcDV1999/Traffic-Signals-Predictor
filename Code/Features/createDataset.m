function dataset = createDataset()

    [images, names] = saveTrainImages();
    dataset = [];
    

        for i = 1:length(images)
            % Calcules els features de cada imatge i els afegim al dataset
            features = getImageFeatures(images{i}, names{i}, "Train");
            disp(size(features))
            dataset = [dataset ; features];
        end
        
        

    
end


