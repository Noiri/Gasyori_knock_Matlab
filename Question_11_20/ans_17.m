clear
I = imread("imori.jpg");
I = im2double(I) * 255;
I = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
[H, W, C] = size(I);
n = 3;

K = [0 1 0; 1 -4 1; 0 1 0];

J = zero_padding(I, n);

for y = 1:H
    for x = 1:W
        I(y,x) = mean2(J(y:y+n-1, x:x+n-1) .* K);
        if I(y,x) < 0
            if floor(abs(I(y,x))) == 0
                I(y,x) = 0;
            else
                I(y,x) = 255 + I(y,x);
            end
        end        
    end
end
I = I/255;
I = im2uint8(I);
imshow(I);


function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end