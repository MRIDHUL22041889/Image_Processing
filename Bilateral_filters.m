clc,clearvars;

function out=bilateral(f,sigsg,sigbg)
    [frows,fcols]=size(f);
    
    size_gauss=floor(sigsg*2*pi);%finding gaussian matrix size
    if mod(size_gauss,2)==0
        size_gauss=size_gauss+1;
    end
    size_brig=floor(sigsg*2*pi);%finding brightness matrix size
    if mod(size_brig,2)==0
        size_brig=size_brig+1;
    end
    
    gauss=zeros(size_gauss,size_gauss);
    centerX = floor(size_gauss/ 2) + 1;
    centerY = floor(size_gauss/ 2) + 1;
    for i = 1:size_gauss
        for j = 1:size_gauss
            x = i - centerX;
            y = j - centerY;
            gauss(i, j) = 1 / (2 * pi * sigsg^2) * exp(-0.5 * (x^2 + y^2) / sigsg^2);
         end
    end
    gauss=gauss/sum(gauss(:));
    padsize=[floor(size_brig/2),floor(size_brig/2)];
    fp=padarray(f,padsize,0,'both');
    f=double(f);
    
    padsize=[(size_brig-size_gauss)/2, (size_brig-size_gauss)/2];
    gauss=padarray(gauss,padsize,0,'both');

    for i=1:frows
        for j=1:fcols
            neighbor=fp(i:i+size_brig-1,j:j+size_brig-1);
            center_value = f(i, j);
            
            brightness_gauss = zeros(size(neighbor));
            for m = 1:size_brig
                for n = 1:size_brig
                    intensity_diff = double(neighbor(m, n)) - double(center_value);
                    brightness_gauss(m, n) = exp(-0.5 * (intensity_diff^2) / sigbg^2);
                end
            end
            combined_weights = gauss .* brightness_gauss;
            combined_weights = combined_weights / sum(combined_weights(:));
            filtered_value = sum(sum(combined_weights .*double(neighbor)));
            out(i, j) = filtered_value;
        end
    end
    out=uint8(out);
end


f = imread('/MATLAB Drive/Image Processing/IMG_1819.JPG');
f = im2gray(f); 
sigsg = 2; 
sigbg = 50; 

out = bilateral(f, sigsg, sigbg);

subplot(1, 2, 1);
imshow(f);
title('Original Image');

subplot(1, 2, 2);
imshow(out);
title('Filtered Image');

            