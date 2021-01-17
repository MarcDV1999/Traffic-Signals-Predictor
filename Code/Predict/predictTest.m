function ypred = predictTest(xTest, yTest)
    % Mida de la imatge mes petita de les imatges Train
    
    model = "KNNRBCircle35";
    
    % Carreguem el millor model
    load(sprintf('%s.mat', model));
    
       
    % Prediim
    ypred = KNNRBCircle35.predictFcn(xTest);
       
    confusionMatrix = confusionmat(yTest,ypred);
    confusionchart(confusionMatrix);
    
end

