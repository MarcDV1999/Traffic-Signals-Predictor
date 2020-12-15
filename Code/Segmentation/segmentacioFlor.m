function resultat = segmentacioFlor(im) 

% Llegim l'imatge i ens quedem amb les seves files i columnes
[f, c, nc] = size(im);
%figure, imshow(im);

% Demanem dibuixar un rectangle a l'imatge, per aixi aplicar la màscara més
% tard
rect = getRect;

% Transformem l'imatge a HSV
hsv = rgb2hsv(im);

% Creem un vector on guardem la taula del Kmeans
vect = reshape(hsv, f*c, 3);

H = vect(:,1);
S = vect(:,2);
V = vect(:,3);

O = [H S V];

% Apliquem el algorisme Kmeans amb la taula O i amb una k de 20
k = 3;
C = kmeans(O, k, 'MaxIter',1000);

% Per a poder veure el resultat, apliquem un reshape i convertim l'imatge
% etiquetada a rgb
IC = reshape(C, f, c);
rgb = label2rgb(IC);
% Mostrem l'imatge original amb el perimetre
figure, imshowpair(im, rgb,'montage');



% Omplim els forats blancs
M = imfill(IC, 'holes');

% Eliminem les petites estructures petites blanques
st1 = strel('disk', 3);
M = imopen(M, st1);


% Mostrem l'imatge resultant
%figure, imshow(M);


% Agafem només el perimetre de l'imatge resultant
perimetre = bwperim(M,8);


% Mostrem l'imatge original amb el perimetre
%figure, imshowpair(im,perimetre,'montage');

% Fusionem l'imatge original amb el perimetre
resultat = imfuse(im,perimetre, 'blend');
%figure, imshow(resultat);

end
