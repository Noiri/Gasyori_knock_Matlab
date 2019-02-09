clear
I = imread("imori.jpg");
[H, W, C] = size(I);
a = 5.0;
Nh = floor(H * a);
Nw = floor(W * a);

y = 1:Nh;
y = round(y./a);
y(y==0) = 1;
x = 1:Nw;
x = round(x./a);
x(x == 0) = 1;

J = I(y, x, :);

imshow(J);