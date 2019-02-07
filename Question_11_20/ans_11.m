clear
I = imread("imori.jpg");
[H, W, C] = size(I);
n = 3;
J = zero_padding(I, n);

for y = 1:H
    for x = 1:W
        for z = 1:C         
            I(y, x, z) = mean2(J((y:y+n-1), x:x+n-1, z));
        end
    end
end
imshow(I);


function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end