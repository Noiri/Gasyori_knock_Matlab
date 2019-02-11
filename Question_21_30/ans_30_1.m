clear
I = imread("imori.jpg");

[H, W, C] = size(I);

%はみ出した要素が参照するための座標を追加
I(H+1, W+1, :) = 0;

Theta = -30;

a = cosd(Theta);
b = -sind(Theta);
c = sind(Theta);
d = cosd(Theta);
tx = 0;
ty = 0;

ny = repmat((1:H)', 1, W);
nx = repmat(1:W, H, 1);

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
