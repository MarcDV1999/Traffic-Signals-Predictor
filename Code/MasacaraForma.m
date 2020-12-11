clear all;

%im1 = imread('../Images/Meta/1.png');
%im = imread('../Images/Train1/9/00009_00000_00024.png');
%im = imread('../Images/Train1/9/00009_00000_00007.png');
im = imread('../Images/Train1/14/00014_00001_00005.png');

im1gray = rgb2gray(im);

% Calculamos el umbral de forma automatica, no siempre va bien, 
% a veces mejor calcularlo manualmente
umbral = graythresh(im1gray);

% Umbral calculado automaticamente
imbw = im2bw(im1gray, umbral);

% Apertura
imcl = imclose(imbw, strel('disk', 1));


% Como aun quedan restos... Rellenamos los agujeros de blanco 
imbin = imfill(imcl, 'holes');

% Eliminamos todos aquellos objetos que se encuentran en el borde de la imagen
imneta = imclearborder(imbin);

figure, imshow(imneta);