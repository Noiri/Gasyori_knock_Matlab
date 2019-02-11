clear
I = imread("imori.jpg");
[H, W, C] = size(I);

I(H+1, W+1, :) = 0;

cent_y = uint8(H/2);
cent_x = uint8(W/2);

Theta = -30;

a = cosd(Theta);
b = -sind(Theta);
c = sind(Theta);
d = cosd(Theta);
tx = 0;
ty = 0;

ny = repmat((1:H)', 1, W);
nx = repmat(1:W, H, 1);


%{
############################################################################
注意1：double型のまま処理するのがポイント
      丸め込むと一度切れた部分が消失する。
%}
adbc = a*d - c*b;
x = (-b .* (ny - ty) + d .* (nx - tx)) ./ adbc;
y = (a .* (ny - ty) -c .* (nx - tx)) ./ adbc;

dcx = (max(x(:)) + min(x(:)))/2 - W/2;
dcy = (max(y(:)) + min(y(:)))/2 - H/2;


x = x - dcx;
y = y - dcy;

%###########################################################################

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