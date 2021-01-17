% Donat un conjunt de imatges, calcula quina es la mida minima
function [min_r,min_c] = minSize(images)
    % Calculem quina es l'imatge amb mida mes petita del dataset
    [min_r, min_c, ~] = size(images{1});
    for i = 1:length(images)
        im = images{i};
        [rows, columns, ~] = size(im);
        if (rows*columns) < (min_r * min_c)
            min_r = rows;
            min_c = columns;
        end        
    end
end

