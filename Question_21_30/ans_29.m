clear
I = imread("imori.jpg");
[H, W, C] = size(I);

%はみ出した要素が参照するための座標を追加
I(H+1, W+1, :) = 0;

a = 1.3;
b = 0;
c = 0;
d = 0.8;
tx = 30;
ty = -30;

Nh = floor(H * d);
Nw = floor(W * a);

ny = repmat((1:Nh)', 1, Nw);
nx = repmat(1:Nw, Nh, 1);

adbc = a*d - c*b;
x = (-b .* (ny - ty) + d .* (nx - tx)) ./ adbc;
y = (a .* (ny - ty) -c .* (nx - tx)) ./ adbc;

y = uint8(y);
x = uint8(x);

y(y<1) = H+1;
y(y>H) = H+1;

x(x<1) = W+1;
x(x>W) = W+1;

iy = y(:, 1)';
ix = x(1, :);

J = I(iy, ix, :);
J = uint8(J);

imshow(J);
