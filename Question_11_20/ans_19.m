clear
I = imread("imori_noise.jpg");
I = im2double(I) * 255.0;

I = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
[H, W, C] = size(I);
s = 3;
n = 5;
K = LoG(n,s);
J = zero_padding(I, n);

for y = 1:H
    for x = 1:W        
        r = J(y:y+n-1, x:x+n-1) .* K;
        I(y,x) = sum(r(:));
    end
end
I = I/255;
I = im2uint8(I);
imshow(I);

function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2, c);
J(1+pad:h+pad, 1+pad:w+pad) = I;
end

function K = LoG(n,s)
K = zeros(n);
shift = floor(n/2)+1;
for y = 1:n
    for x = 1:n
        xx = (x - shift)^2;
        yy = (y - shift)^2;
        K(y,x) = (xx + yy - s^2) * exp(-(xx + yy) / (2*s^2));        
    end
end
K = K/(2 * pi * s^6);
K = K / sum(K(:));
end