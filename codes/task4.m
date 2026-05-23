%% TASK 4 - Edge Detection

task4Files = {'wp10.jpeg','wp11.jpeg','wp12.jpeg'};

for i = 1:length(task4Files)
    fileName = task4Files{i};
    I = imread(fullfile(imgFolder, fileName));
    if size(I,3) == 3
        Ig = rgb2gray(I);
    else
        Ig = I;
    end

    E_sobel = edge(Ig, 'sobel');
    E_prewitt = edge(Ig, 'prewitt');
    E_log = edge(Ig, 'log');

    fig = figure('Visible','off');
    subplot(2,2,1); imshow(Ig); title('Original');
    subplot(2,2,2); imshow(E_sobel); title('Sobel');
    subplot(2,2,3); imshow(E_prewitt); title('Prewitt');
    subplot(2,2,4); imshow(E_log); title('LoG');

    saveas(fig, fullfile(resFolder, ['task4_' fileName '.png']));
    close(fig);
end