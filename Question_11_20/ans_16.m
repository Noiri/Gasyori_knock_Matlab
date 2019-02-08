clear
%I = imread("imori.jpg");
I = imread("~/Desktop/lenna.jpg");
%I = im2double(I) * 255;
I = double(I);
%I = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
[H, W, C] = size(I);
n = 3;

%vartical
K = [-1 -1 -1; 0 0 0; 1 1 1];

%horizonal
% K = [1 0 -1; 1 0 -1; 1 0 -1];

J = zero_padding(I, n);

for y = 1:H
    for x = 1:W
        r = J(y:y+n-1, x:x+n-1) .* K;
        I(y,x) = sum(r(:));
%         if I(y,x) < 0
%             if floor(abs(I(y,x))) == 0
%                 I(y,x) = 0;
%             else
%                 I(y,x) = 255 + I(y,x);
%             end
%         end        
    end
end
%I = I/255;
I = uint8(I);
imshow(I);




function J = zero_padding(I, n)
[h, w, c] = size(I);
pad = floor(n/2);
J = zeros(h+pad*2, w+pad*2, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I;
end