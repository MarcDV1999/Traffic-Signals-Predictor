function dataset = createDataset()

    [images, names] = saveTrainImages();
    dataset = [];
    

        for i = 1:length(images)
            % Calcules els features de cada imatge i els afegim al dataset
            im_filtered = filterImage(images{i});
            features = getImageFeatures(im_filtered, names{i}, "Train");
            disp(size(features))
            dataset = [dataset ; features];
        end
        
        

    
end


