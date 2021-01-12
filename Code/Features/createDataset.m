function dataset = createDataset()

    [images, names] = saveMetaImages();

    header = ["A1", "B1", "A2", "B2", "A3", "B3", "Target"];
    dataset = [header];

    for i = 1:length(images)
        features = getImageFeatures(images{i}, names{i}, "Meta");
        dataset = [dataset ; features];
    end
    
end


