I = imread("imori.jpg");
r = I(:, :, 1);
b = I(:, :, 3);
I(:, :, 1) = b;
I(:, :, 3) = r;
imshow(I);