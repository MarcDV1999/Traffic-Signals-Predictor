function colorFeatures = getColorFeatures2(im, fname)
    load regioncoordinates;
    lab_fabric = rgb2lab(im);

    a = lab_fabric(:,:,2);
    b = lab_fabric(:,:,3);
    % Blanc o Negre, Vermell, Blau, Groc, Verd

    %plot_labels = {'k', 'r', 'b', 'y', 'g'};
    color_markers = [0.000  0.000;
                     67.24  52.59;
                     -2.72 -44.13;
                     -11.21 91.62;
                     -48.67 33.13
                       7.38 8.63];
    nColors = length(color_markers);

    color_labels = 0:nColors-1;
    a = double(a);
    b = double(b);
    distance = zeros([size(a), nColors]);
    for count = 1:nColors
      distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                          (b - color_markers(count,2)).^2 ).^0.5;
    end

    [~,label] = min(distance,[],3);
    label = color_labels(label);
    colorFeatures = zeros(nColors,0);
    for count = 1:nColors
      colorFeatures(count) = numel(label(label == count-1))/numel(label);
    end

end

