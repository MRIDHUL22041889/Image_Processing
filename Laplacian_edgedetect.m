clc;
clearvars;

% Step 1: Read the image and convert to grayscale
f = imread("IMG_1826.JPG");
f = im2gray(f);  % Ensure grayscale input

% Step 2: Define Laplacian kernel
Lap = [1 4 1; 4 -20 4; 1 4 1];

% Step 3: Apply convolution
Lap_f = conv2(double(f), Lap, 'same');  % Use 'same' to keep the output size consistent

% Step 4: Normalize Laplacian output for visualization
Lap_f_normalized = mat2gray(Lap_f);  % Normalize to [0,1]

% Step 5: Zero-crossing detection
[Laprow, Lapcol] = size(Lap_f);
image = zeros(Laprow, Lapcol);  % Preallocate


[Laprow,Lapcol]=size(Lap_f);
image=zeros(size(Lap_f));

Lap_f=uint8(Lap_f);

for i = 2:Laprow-1
        for j = 2:Lapcol-1
            % Get the 3x3 neighborhood
            neighborhood = double(Lap_f(i-1:i+1, j-1:j+1));
            
            % Check for sign change across 128
            hasPositive = any(neighborhood(:) > 128);
            hasNegative = any(neighborhood(:) < 128);
            
            % Mark as zero-crossing if both positive and negative exist
            if hasPositive && hasNegative
                image(i, j) = 255;  % Mark as edge
            end
        end
    end
image=uint8(image);
% Step 6: Display results
figure;
subplot(1, 2, 1);
imshow(Lap_f_normalized);
title('Laplacian Output');

subplot(1, 2, 2);
imshow(image, []);
title('Zero-Crossing Detection');