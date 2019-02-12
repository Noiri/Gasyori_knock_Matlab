clear
I = imread("imori.jpg");
[H, W, C] = size(I);

I(H+1, W+1, :) = 0;

dx = 30;
dy = 0;

a = 1;
b = dx/H;
c = 0;
d = 1;
tx = 0;
ty = 0;

Nh = H + dy;
Nw = W + dx;

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


ind = sub2ind(size(I), y, x);

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);
J = cat(3, r(ind), g(ind), b(ind));
J = uint8(J);

imshow(J);