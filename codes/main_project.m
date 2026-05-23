clc;
clear;
close all;

% Klasörler
imgFolder = 'images';
resFolder = 'results';

if ~exist(resFolder, 'dir')
    mkdir(resFolder);
end

% Görüntü listesi
imageFiles = {'wp1.jpeg','wp2.jpeg','wp3.jpeg','wp4.jpeg','wp5.jpeg','wp6.jpeg','wp7.jpeg'};

% Yardımcı anonim fonksiyon
toGray = @(I) (size(I,3)==3) * rgb2gray(I) + (size(I,3)==1) * I;

