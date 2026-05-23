%% TASK 2 - Spatial Filtering

task2Files = {'wp4.jpeg','wp5.jpeg','wp6.jpeg'};

for i = 1:length(task2Files)
    fileName = task2Files{i};
    I = imread(fullfile(imgFolder, fileName));
    
    if size(I,3) == 3
        Ig = rgb2gray(I);
    else
        Ig = I;
    end

    % ----------------------------
    % Mean filter: two kernel sizes
    % ----------------------------
    h_mean_3 = fspecial('average', [3 3]);
    h_mean_7 = fspecial('average', [7 7]);
    
    I_mean_3 = imfilter(Ig, h_mean_3, 'replicate');
    I_mean_7 = imfilter(Ig, h_mean_7, 'replicate');

    % ----------------------------
    % Gaussian filter: two scales
    % ----------------------------
    I_gauss_1 = imgaussfilt(Ig, 1);     % smaller smoothing
    I_gauss_25 = imgaussfilt(Ig, 2.5);  % stronger smoothing

    % ----------------------------
    % Median filter: two kernel sizes
    % ----------------------------
    I_median_3 = medfilt2(Ig, [3 3]);
    I_median_7 = medfilt2(Ig, [7 7]);

    % ----------------------------
    % Visualization
    % ----------------------------
    figure;
    subplot(3,3,1); imshow(Ig); title('Original');

    subplot(3,3,2); imshow(I_mean_3); title('Mean 3x3');
    subplot(3,3,3); imshow(I_mean_7); title('Mean 7x7');

    subplot(3,3,5); imshow(I_gauss_1); title('Gaussian \sigma=1');
    subplot(3,3,6); imshow(I_gauss_25); title('Gaussian \sigma=2.5');

    subplot(3,3,8); imshow(I_median_3); title('Median 3x3');
    subplot(3,3,9); imshow(I_median_7); title('Median 7x7');

    sgtitle(['Task 2 - Spatial Filtering - ' fileName]);

    saveas(gcf, fullfile(resFolder, ['task2_' fileName '.png']));
end