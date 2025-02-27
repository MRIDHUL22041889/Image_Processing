clc,clearvars
f=imread('IMG_1815.JPG');

if size(f, 3) == 3
    f = rgb2gray(f);
end

k=5;
[frow,fcol]=size(f);

padsize=[floor(k/2),floor(k/2)];
fp=padarray(f,padsize,'replicate','both');
fw=zeros(frow,fcol);
for i=1:frow
    for j=1:fcol
        neighbor=fp(i:i+k-1,j:j+k-1);
        fw(i,j)=median(neighbor(:));
    end
end
fw=uint8(fw);
figure;
subplot(1,2,1);imshow(f);
title('unfilterd image');

subplot(1,2,2);imshow(fw);
title('median filtered image');