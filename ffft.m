clc;
clearvars;

f = imread('/MATLAB Drive/Image Processing/IMG_1813.JPG');
f = im2gray(f);
f = double(f);

F = fft2(f);
F_shift = fftshift(F);

[hrow, hcol] = size(f);
s = 100;
centerX = floor(hrow / 2) + 1;
centerY = floor(hcol / 2) + 1;

for i = 1:hrow
    for j = 1:hcol
        x = i - centerX;
        y = j - centerY;
        low_pass(i, j) = exp(-0.5 * (x^2 + y^2) / s^2);
    end
end

high_pass = 1 - low_pass;

F_low = F_shift .* low_pass;
F_high = F_shift .* high_pass;

low_pass_image = real(ifft2(ifftshift(F_low)));
high_pass_image = real(ifft2(ifftshift(F_high)));

figure;
subplot(2, 2, 1); imshow(f, []);
subplot(2, 2, 2); imshow(low_pass_image, []);
subplot(2, 2, 3); imshow(high_pass_image, []);