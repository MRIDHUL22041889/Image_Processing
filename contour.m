clc; clearvars; close all;

I = imread('IMG_1833.JPG');
figure;
imshow(I);
title('Original Color Image');
I=imgaussfilt(I,2);
I_gray=im2gray(I);


[rows, cols] = size(I_gray);
mask = false(rows, cols);
mask(10:rows-30,30:cols-20) = true;


iterations = 500;
bw = activecontour(I_gray, mask, iterations, 'Chan-Vese');


figure;
imshow(I_gray);
hold on;
visboundaries(bw, 'Color', 'r');
title('Active Contour Result on Grayscale Image');

figure;
imshow(labeloverlay(I_gray, bw));
title('Segmentation');