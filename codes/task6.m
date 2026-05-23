%% TASK 6 - Planar Rectification with Projective Geometry

clc;
clear;
close all;

imgFolder = 'images';
resFolder = 'results';

if ~exist(resFolder, 'dir')
    mkdir(resFolder);
end

% Yeni görüntü
fileName = 'wp15.jpeg';
I = imread(fullfile(imgFolder, fileName));

% Orijinal görüntüyü göster
figure;
imshow(I);
title('Defterin 4 kosesini sec: sol ust, sag ust, sag alt, sol alt');

% Manuel 4 nokta secimi
[x, y] = ginput(4);
movingPoints = [x y];

% Hedef dikdortgen boyutu
width = 600;
height = 800;

fixedPoints = [1 1;
               width 1;
               width height;
               1 height];

% Projective transform
tform = fitgeotrans(movingPoints, fixedPoints, 'projective');

% Rectified result
J = imwarp(I, tform, 'OutputView', imref2d([height width]));

% Gorsel karsilastirma
figure;
subplot(1,2,1);
imshow(I);
title('Original Image');

subplot(1,2,2);
imshow(J);
title('Rectified Image');

% Kaydet
saveas(gcf, fullfile(resFolder, 'task6_wp15_rectification.png'));
imwrite(J, fullfile(resFolder, 'task6_wp15_rectified_only.png'));