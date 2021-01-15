% Funcio que guarda en un Cell totes les imatges de Meta. A més a més
% també guardem un altre cell amb els noms de fitxers. (Necessari per image2palette)
function [images, names] = saveMetaImages()
    images = cell(1,42);
    names = cell(1, length(images));
    for i = 1:1:length(images)
        str_im = sprintf('../Images/Meta/%d.png', i);
        names{i} = str_im;
        images{i} = imread(str_im);
    end
end