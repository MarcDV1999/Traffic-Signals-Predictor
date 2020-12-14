clear all;

im1 = imread('../Images/Meta/1.png');
%im = imread('../Images/Train1/9/00009_00000_00024.png');

%% Llegim les imatges i les guardem a un Cell Array
images = saveMetaImages();


%% Segmentem les imatges
figure;
for i = 1:length(images)
    segmentedImage = segmentacio(images{i});

    subplot(5, 9, i), imshow(segmentedImage);
end