function class = predictTrafficSignal()
    % Mida de la imatge mes petita de les imatges Train
    min_r = 25;
    min_c = 25;
    
    % Carreguem el millor model
    load('KNN.mat');
    
    
    % Deixem escollir una imatge al usuari
    [file,path] = uigetfile('*.png');
    if isequal(file,0)
       disp('No s''ha escollit cap imatge');
    else
       % Seleccionem l'imatge
       fullpath = fullfile(path, file);
       disp(['Imatge seleccionada: ', fullpath]);
       im = imread(fullpath);
       
       % Generem les caracteristiques de l'imatge triada
       features = getImageFeatures(filterImage(im), fullpath, "Predict", min_r, min_c);
       
       % Prediim
       ypred = KNN.predictFcn(features);
       
       % Mostrem el Resultat
       answer = sprintf('../Images/Meta/%d.png', ypred);
       figure,
       subplot(1,2,1), imshow(im), title("Original");
       subplot(1,2,2), imshow(answer), title(sprintf("Predicted %d", ypred));
    end
end

