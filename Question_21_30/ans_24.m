clear
I = imread("imori_gamma.jpg");
I = im2double(I);
c = 1.0;
g = 2.2;

I = (1/c .* I) .^ (1/g);
I = im2uint8(I);

imshow(I);