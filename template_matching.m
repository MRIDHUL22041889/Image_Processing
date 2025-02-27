clc;
clearvars;
close all;

% Define correlation function
function out = correlation(f, t)
    % Flip the template for correlation
    t = rot90(t, 2); 

    % Check and normalize template
    if sum(t(:)) ~= 0
        t = t / sum(t(:));
    else
        error('Template has a sum of zero.');
    end

    % Check and normalize main image
    if sum(f(:)) ~= 0
        f = f / sum(f(:));
    else
        error('Main image has a sum of zero.');
    end

    % Perform convolution
    out = conv2(f, t, 'same');
end

% Load images
f = imread('/MATLAB Drive/Image Processing/IMG_1821.JPG');
t = imread('/MATLAB Drive/Image Processing/IMG_1822.JPG');

% Convert images to grayscale
f = double(im2gray(f));
t = double(im2gray(t));

% Perform correlation
out = correlation(f, t);

% Check output range
disp(['Range of out: ', num2str(min(out(:))), ' to ', num2str(max(out(:)))]);

% Rescale output for visualization
out = mat2gray(out);

% Display the result
figure;
subplot(2,2,1);imshow(out, []);
title('Correlation Output');