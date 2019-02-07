clear
I = imread("imori.jpg");
n = 3;
K = eye(n)/n;
[H, W, C] = size(I);
J = zero_padding(I, n);
for y = 1:H
    for x = 1:W
        for z = 1:C
            r = J(y:y+n-1, x:x+n-1, z) .* K;
            I(y, x, z) = sum(r(:));
        end
    end
end
imshow(I);

function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(pad*2+h, pad*2+w, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end