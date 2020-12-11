clear all;

im1 = imread('../Images/Meta/1.png');
%im = imread('../Images/Train1/9/00009_00000_00024.png');

%% Llegim les imatges i les guardem a un Cell Array
images = cell(1,42);
for i = 1:1:length(images)
    str_im = sprintf('../Images/Meta/%d.png', i);
    images{i} = imread(str_im);
end



%% Modifiquem les imatges
figure;
for i = 1:length(images)
    
    im1gray = rgb2gray(images{i});

    % Calculamos el umbral de forma automatica, no siempre va bien, 
    % a veces mejor calcularlo manualmente
    umbral = graythresh(im1gray);

    % Umbral calculado automaticamente
    imbw = im2bw(im1gray, umbral);

    % Como aun quedan restos... Rellenamos los agujeros de blanco 
    imbin = imfill(imbw, 'holes');

    %features = [hue; 1];

    subplot(5, 9, i), imshow(imbin);
end