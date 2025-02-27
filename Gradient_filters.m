f=imread('IMG_1826.JPG');
f=im2gray(f);
sobel_x=[-1 0 1;-2 0 2;-1 0 1];
sobel_y=[1 2 1;0 0 0;-1 -2 -1];
di_dx=conv2(f,sobel_x);
di_dy=conv2(f,sobel_y);
mag=sqrt(di_dx.^2+di_dy.^2);
angle=atan2(di_dy,di_dx);
di_dx=uint8(di_dx);
di_dy=uint8(di_dy);
mag = uint8(mag);
angle=uint8(angle);


%Edge threshold
%threh=200;
%edge=mag>threh;




subplot(1,2,1);imshow(mag);
subplot(1,2,2);imshow(edge,[]);