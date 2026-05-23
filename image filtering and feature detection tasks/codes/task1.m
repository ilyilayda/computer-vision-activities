%% TASK 1 - Point Operations and Intensity Enhancement

clc;
clear;
close all;

imgFolder = 'images';
resFolder = 'results';

if ~exist(resFolder, 'dir')
    mkdir(resFolder);
end

task1Files = {'wp2.jpeg','wp3.jpeg','wp4.jpeg'};

for i = 1:length(task1Files)
    fileName = task1Files{i};
    I = imread(fullfile(imgFolder, fileName));
    
    if size(I,3) == 3
        Ig = rgb2gray(I);
    else
        Ig = I;
    end

    % Gamma correction
    gammaValue = 0.5;
    I_gamma = imadjust(Ig, [], [], gammaValue);

    % Histogram Equalization
    I_histeq = histeq(Ig);

    % CLAHE
    I_clahe = adapthisteq(Ig, 'ClipLimit', 0.02);

    % Figure ekranda görünsün
    figure;
    subplot(2,4,1); imshow(Ig); title('Original');
    subplot(2,4,2); imshow(I_gamma); title('Gamma');
    subplot(2,4,3); imshow(I_histeq); title('HistEq');
    subplot(2,4,4); imshow(I_clahe); title('CLAHE');

    subplot(2,4,5); imhist(Ig); title('Hist Original');
    subplot(2,4,6); imhist(I_gamma); title('Hist Gamma');
    subplot(2,4,7); imhist(I_histeq); title('HistEq Hist');
    subplot(2,4,8); imhist(I_clahe); title('CLAHE Hist');

    sgtitle(['TASK 1 Results - ' fileName]);

    % Kaydet
    saveas(gcf, fullfile(resFolder, ['task1_' fileName '.png']));
    
    disp([fileName ' processed and saved.']);
end