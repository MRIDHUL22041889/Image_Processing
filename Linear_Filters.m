
clc;
clearvars;

f = imread('IMG_1812.JPG');

s = 4;
h = ones(floor(2*pi*s), floor(2*pi*s));

[frow, fcol, fchannel] = size(f); 
[hrow, hcol] = size(h);

centerX = floor(hrow / 2) + 1;
centerY = floor(hcol / 2) + 1;

for i = 1:hrow
    for j = 1:hcol
        x = i - centerX;
        y = j - centerY;
        h(i, j) = 1 / (2 * pi * s^2) * exp(-0.5 * (x^2 + y^2) / s^2);
    end
end

h = h / sum(h(:));

padrow = floor(hrow / 2);
padcol = floor(hcol / 2);
padsize = [padrow, padcol];


fn = zeros(size(f), 'double'); 

for c=1:fchannel
    fn_channel = padarray(double(f(:, :, c)), padsize, 'replicate', 'both');
    fn_channel = conv2(fn_channel, h, 'same');
    fn(:, :, c) = fn_channel(padrow + 1:end - padrow, padcol + 1:end - padcol);
end

fn = uint8(min(max(fn, 0), 255));
 
figure;
subplot(1, 2, 1);
imshow(f);
title('Original Image');

subplot(1, 2, 2);
imshow(fn);
title('Gaussian Filtered Image');
