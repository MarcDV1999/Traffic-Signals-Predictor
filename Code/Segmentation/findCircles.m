% Funcio generada amb la App Image Segmentar 
% Funcio que busca cercles en l'imatge
function [BW,maskedImage] = findCircles(RGB)
%segmentImage Segment image using auto-generated code from imageSegmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the imageSegmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Find circles

minR = 6;
maxR = min(size(RGB,1), size(RGB,1));
[centers,radii,~] = imfindcircles(RGB,[minR maxR],'Sensitivity',0.85);
BW = false(size(RGB,1),size(RGB,2));
[Xgrid,Ygrid] = meshgrid(1:size(BW,2),1:size(BW,1));
BW = BW | (hypot(Xgrid-centers(1,1),Ygrid-centers(1,2)) <= radii(1));

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

