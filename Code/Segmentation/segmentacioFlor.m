function resultat = segmentacioFlor(im) 

% Llegim l'imatge i ens quedem amb les seves files i columnes
[f, c, nc] = size(im);
figure, imshow(im);

% Demanem dibuixar un rectangle a l'imatge, per aixi aplicar la màscara més
% tard
rect = getrect;

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

% Creem una mascara amb el rectangle introduit abans. Per això creem un
% roi.Rectangle object i apliquem la funcio createMask()
h = images.roi.Rectangle(gca,'Position', rect,'StripeColor','r');
MASK = createMask(h);

%figure, imshow(MASK);


% Construim un vector H que indicara si un representant de color o classe
% cau dins del rectangle o no.
H = [C, MASK(:)];


% A continuació, comptem per a cada representant de color quants píxels han
% caigut a fora i quants a dins. Guardem els resultats en dos arrays Hist0
% i Hist1. 

Hist0 = zeros(k,1);
Hist1 = zeros(k,1);
[row_h, col_h] = size(H);


for i = 1:row_h
    clase = H(i,1);
    
    if( H(i,2) == 1)
        Hist1(clase) = Hist1(clase) + 1;
    else
        Hist0(clase) = Hist0(clase) + 1;
    end
    
end


% Decidim si un representant de color pertany a la figura que es vol 
% segmentar comparant les seves aparicions dins i fora del rectangle. 
% Guardem la decisió en un vector anomenat RES. 
RES = Hist1 > Hist0;



% Decidim per a cada  píxel de la matriu H si forma part de la figura 
% o no utilitzant la informació que conté RES. Guardem el resultat 
% en un vector M i el mostrem per pantalla

M = zeros(f, c);

M = reshape(M, [], 1);

for i = 1:row_h
    clase = H(i,1);
    if (RES(clase) == 1) 
        M(i) = 1;
    end
end


M = reshape(M, f, c);


% Omplim els forats blancs
M = imfill(M, 'holes');

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
