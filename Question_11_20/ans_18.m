clear
I = imread("imori.jpg");
I = double(I);
I = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
[H, W, C] = size(I);

n = 3;
%K = [-2 -1 0; -1 1 1; 0 1 2];

%emboss-filter in pillow
%https://pythontic.com/image-processing/pillow/emboss-filter
K = [-1 0 0; 0 1 0; 0 0 0];

J = zero_padding(I, n);

for y = 1:H
    for x = 1:W
        r = J(y:y+n-1, x:x+n-1) .* K;
        I(y,x) = sum(r(:));
    end
end
%offset 128
I = uint8(I+128);
imshow(I);            

x = 1;
y = 1;
res = K .* J(x:x+n-1, y:y+n-1);
R = sum(res(:));


function J = zero_padding(I, n)
[h, w, ~] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2);
J(1+pad:h+pad, 1+pad:w+pad) = I;
end