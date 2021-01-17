function class = predictTrafficSignal()
    % Mida de la imatge mes petita de les imatges Train
    min_r = 35;
    min_c = 35;
    
    model = "KNNRBCircle35";
    
    % Carreguem el millor model
    load(sprintf('%s.mat', model));
    
    
    % Deixem escollir una imatge al usuari
    [file,path] = uigetfile('*.png');
    if isequal(file,0)
       disp('No s''ha escollit cap imatge');
    else
       % Seleccionem l'imatge
       fname = fullfile(path, file);
       disp(['Imatge seleccionada: ', fname]);
       im = imread(fname);
       
       resizedImage = imresize(im, [min_r, min_c]);
       
       % Generem les caracteristiques de l'imatge triada
       [features, target] = getImageFeatures(filterImage(resizedImage), fname);
       
       % Prediim
       ypred = KNNRBCircle35.predictFcn(features);
       fprintf("Classe Predita\t -> %d\n", ypred);
       
       % Mostrem el Resultat
       answer = sprintf('../Images/Meta/%d.png', ypred);
       figure,
       subplot(1,2,1), imshow(im), title("Original");
       subplot(1,2,2), imshow(answer), title(sprintf("Predicted %d", ypred));
    end
end

