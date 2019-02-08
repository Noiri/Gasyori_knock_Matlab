clear
I = imread("imori_dark.jpg");
I = double(I);

m = mean(I(:));
s = std(I(:));

M = 128;
S = 52;
I = transform_hist(M, S, I);

mean(I(:))
var(I(:))

I = uint8(I);

figure
imshow(I);
figure
imhist(I);

function I = transform_hist(M, S, I)
mue = mean(I(:));
sigma = std(I(:));
I = S/sigma .* (I - mue) + M;
end
