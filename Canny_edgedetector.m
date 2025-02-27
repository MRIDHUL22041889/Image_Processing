clc, clearvars;

% Step 1: Read the image and convert to grayscale
f = imread("IMG_1826.JPG");
f = im2gray(f);  % Ensure grayscale input

% Step 2: Define the parameters for Gaussian kernel
n = 1;
k = floor(2*pi*n);
if mod(k, 2) == 0
    k = k + 1;
end

% Create Gaussian filter
gaus = zeros(k, k);
center_x = floor(k/2) + 1;
center_y = floor(k/2) + 1;

for i = 1:k
    for j = 1:k
        x = center_x - i;
        y = center_y - j;
        gaus(i, j) = 1/(2*pi*n) * exp(-(x.^2 + y.^2) / (2*n^2));
    end
end
gaus = gaus / sum(gaus(:));
f_gauss = conv2(f, gaus, 'same');

% Step 3: Compute gradients using Sobel operator
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = transpose(sobel_x);

df_dx = conv2(f_gauss, sobel_x, 'same');
df_dy = conv2(f_gauss, sobel_y, 'same');

% Step 4: Compute gradient magnitude
mag = sqrt(df_dx.^2 + df_dy.^2);

% Step 5: Compute 1D Laplacian (based on gradient magnitude and direction)
laplacian_mag = zeros(size(mag));
theta = atan2(df_dy, df_dx);
theta = mod(rad2deg(theta), 180);

[m, n] = size(mag);
for i = 2:m-1
    for j = 2:n-1
        angle = theta(i, j);
        if ((angle >= 0 && angle < 22.5) || (angle >= 157.5 && angle <= 180))  
            values = [mag(i, j-1), mag(i, j), mag(i, j+1)];
        elseif (angle >= 22.5 && angle < 67.5)  
            values = [mag(i-1, j+1), mag(i, j), mag(i+1, j-1)];
        elseif (angle >= 67.5 && angle < 112.5)  
            values = [mag(i-1, j), mag(i, j), mag(i+1, j)];
        else  
            values = [mag(i-1, j-1), mag(i, j), mag(i+1, j+1)];
        end
        laplacian_mag(i, j) = values(2) * 2 - values(1) - values(3);
    end
end

image=edge(laplacian_mag,'zerocross');
image=uint8(image);
figure;
subplot(1, 2, 1);
imshow(laplacian_mag, []);
title('1D Laplacian Magnitude');

subplot(1, 2, 2);
imshow(image, []);
title('Zero-Crossing Detection on 1D Laplacian');

edges = edge(f, 'Canny');

% Display Canny edge detection result
figure;
imshow(edges);
title('Edges Detected (Canny)');