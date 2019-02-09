clear
I = imread("imori.jpg");
[H, W, C] = size(I);

a = 3;
Nh = floor(H * a);
Nw = floor(W * a);

y = (1:Nh)./a;
y(y==0) = 1;

x = (1:Nw)./a;
x(x == 0) = 1;

ix = floor(x);
ix(ix == 0) = 1;
iy = floor(y);
iy(iy == 0) = 1;

%画素との距離
dx = repmat((x - ix), Nh, 1, 3);
dy = repmat((y - iy)', 1, Nw, 3);

%はみ出した要素を元に戻す。
iy_p1 = iy+1;
iy_p1(iy_p1 > W) = W;
ix_p1 = ix + 1;
ix_p1(ix_p1 > H) = H;

%バイリニア補間
I = im2double(I);
J = (1-dx).*(1-dy).*I(iy,ix,:) + dx.*(1-dy).*I(iy,ix_p1,:) + (1-dx).*dy.*I(iy_p1, ix, :) + dx.*dy.*I(iy_p1, ix_p1, :);
J = im2uint8(J);
J(J>255) = 255;
imshow(J);