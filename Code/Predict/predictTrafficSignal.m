function class = predictTrafficSignal()
    % Mida de la imatge mes petita de les imatges Train
    min_r = 25;
    min_c = 25;
    
    % Carreguem el model
    load('KNN.mat');
    
    
    [file,path] = uigetfile('*.png');
    if isequal(file,0)
       disp('No s''ha escollit cap imatge');
    else
       % Seleccionem
       fullpath = fullfile(path, file);
       disp(['Imatge seleccionada: ', fullpath]);
       im = imread(fullpath);
       features = getImageFeatures(filterImage(im), fullpath, "Predict", min_r, min_c);
       
       % Prediim
       ypred = KNN.predictFcn(features);
       
       % Print
       answer = sprintf('../Images/Meta/%d.png', ypred);
       figure,
       subplot(1,2,1), imshow(im), title("Original");
       subplot(1,2,2), imshow(answer), title(sprintf("Predicted %d", ypred));
    end
end

