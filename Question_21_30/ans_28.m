clear
I = imread("imori.jpg");
[H, W, C] = size(I);

tx = -30;
ty = 30;

x = (1:W) + tx;
y = (1:H) + ty;

x(x<1) = W+1;
x(x>W+1) = W+1;

y(y<1) = H+1;
y(y>H+1) = H+1;

J = zeros(H+1, W+1, 3);

J(y, x, :) = I;
J = uint8(J);
J = J(1:H, 1:W, :);
imshow(J);