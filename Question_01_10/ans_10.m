I = imread("imori_noise.jpg");
n = 3;
J = zero_padding(I,n);
[H, W, C] = size(I);
for y= 1:H
    for x = 1:W
        for z = 1:C
            r = J(y:y+n-1, x:x+n-1, z);
            I(y, x, z) = median(r(:));
        end
    end
end
imshow(I);

function J = zero_padding(I, n)
[h, w, c] = size(I);
J = zeros(h, w, c);
pad = floor(n/2)+1;
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end