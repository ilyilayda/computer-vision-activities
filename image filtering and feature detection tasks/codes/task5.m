%% TASK 5 - Corner / Interest Point Detection

task5Files = {'wp13.jpeg','wp14.jpeg','wp15.jpeg'};

for i = 1:length(task5Files)
    fileName = task5Files{i};
    I = imread(fullfile(imgFolder, fileName));
    if size(I,3) == 3
        Ig = rgb2gray(I);
    else
        Ig = I;
    end

    harrisPoints = detectHarrisFeatures(Ig);
    shiPoints = detectMinEigenFeatures(Ig);

    fig = figure('Visible','off');
    subplot(1,2,1);
    imshow(Ig); hold on;
    plot(harrisPoints.selectStrongest(100));
    title('Harris Corners');

    subplot(1,2,2);
    imshow(Ig); hold on;
    plot(shiPoints.selectStrongest(100));
    title('Shi-Tomasi Corners');

    saveas(fig, fullfile(resFolder, ['task5_' fileName '.png']));
    close(fig);
end