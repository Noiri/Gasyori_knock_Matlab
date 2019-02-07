clear
I = imread("imori.jpg");
I = to_Gray(I);

%image info
n = 3;
[H, W, C] = size(I);

%min-max filter
J = zero_padding(I, n);
for y = 1:H
    for x = 1:W
        r = J(y:y+n-1, x:x+n-1);
        Max_v = max(r(:));
        Min_v = min(r(:));
        I(y, x) = Max_v - Min_v;
    end
end
imwrite(I, "minmax.jpg");
imshow(I);


function G = to_Gray(I)
G = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
end

function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end
