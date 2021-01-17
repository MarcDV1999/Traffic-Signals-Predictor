% Funcio que guarda en un Cell totes les imatges de Train. A més a més
% també guardem un altre cell amb els noms de fitxers. (Necessari per image2palette)
function [train, test] = saveTrainImages()
    interval = 10;
    size = floor(39209/interval);
    images = cell(size,2);
    count = 1;
    index = 1;
    
    
    for i = 0:42
            if i <= 17
                folder = sprintf('../Images/Train1/%d/', i);
            else
                folder = sprintf('../Images/Train2/%d/', i);
            end

            filesAndFolders = dir(folder);
            for j = 1:numel(filesAndFolders)
                if ~filesAndFolders(j).isdir && filesAndFolders(j).name ~= ".DS_Store"
                    %disp(filesAndFolders(j).name) % disp displays the value of the input variable
                    if mod(count, interval) == 0 
                        fullname = sprintf("%s%s", folder, filesAndFolders(j).name);
                        images{index, 1} = imread(fullname);
                        images{index, 2} = fullname;
                        %names{index} = fullname;
                        
                        index = index + 1;
                    end
                    count = count + 1;
                end
            end
    end
    
    test = cell(floor(size*0.2),2);
    train = cell(floor(size*0.8), 2);

    
    
    for i=1:length(test)
        test{i, 1} = images{i};
        test{i, 2} = images{i, 2};
    end
    for i=1:length(train)
        train{i, 1} = images{length(test)+i, 1};
        train{i, 2} = images{length(test)+i+1, 2};
    end
        
        
end