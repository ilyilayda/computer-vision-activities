%% TASK 3 - Frequency-Domain Processing

task3Files = {'wp8.jpeg','wp9.jpeg'};

for i = 1:length(task3Files)
    fileName = task3Files{i};
    I = imread(fullfile(imgFolder, fileName));
    if size(I,3) == 3
        Ig = rgb2gray(I);
    else
        Ig = I;
    end

    Ig = im2double(Ig);

    [M, N] = size(Ig);
    F = fft2(Ig);
    Fshift = fftshift(F);

    magnitudeSpectrum = log(1 + abs(Fshift));

    % Merkez
    cx = floor(N/2);
    cy = floor(M/2);

    [X, Y] = meshgrid(1:N, 1:M);
    D = sqrt((X - cx).^2 + (Y - cy).^2);

    % Low-pass mask
    D0 = 50;
    H_low = double(D <= D0);

    % High-pass mask
    H_high = double(D > D0);

    % Low-pass result
    G_low = Fshift .* H_low;
    I_low = real(ifft2(ifftshift(G_low)));

    % High-pass result
    G_high = Fshift .* H_high;
    I_high = real(ifft2(ifftshift(G_high)));

    fig = figure('Visible','off');
    subplot(2,3,1); imshow(Ig,[]); title('Original');
    subplot(2,3,2); imshow(magnitudeSpectrum,[]); title('Magnitude Spectrum');
    subplot(2,3,3); imshow(H_low,[]); title('Low-pass Mask');
    subplot(2,3,4); imshow(I_low,[]); title('Low-pass Result');
    subplot(2,3,5); imshow(H_high,[]); title('High-pass Mask');
    subplot(2,3,6); imshow(I_high,[]); title('High-pass Result');

    saveas(fig, fullfile(resFolder, ['task3_' fileName '.png']));
    close(fig);
end