clc, clearvars, close all;

f = im2gray(imread("IMG_1840.JPG"));
BW = edge(f, 'canny');
rotI=f;
figure;
subplot(1, 2, 1);
imshow(f);
title("Original Image");
subplot(1, 2, 2);
imshow(BW);
title("Edge Map");

[H, T, R] = hough(BW);
P = houghpeaks(H, 5);

%{
figure;
imshow(imadjust(rescale(H)), 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
xlabel("\theta");
ylabel("R");
axis on;
axis normal;
hold on;
plot(T(P(:,2)), R(P(:,1)), 's', 'color', 'blue');
title('Hough Transform');
hold off;
%}
lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7);

figure, imshow(rotI), hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'red');
    
end
hold off;  