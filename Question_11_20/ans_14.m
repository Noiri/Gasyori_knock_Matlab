clear
I = imread("imori.jpg");
I = 0.2126 * I(:,:,1) + 0.7152 * I(:,:,2) + 0.0722 * I(:,:,3);
n = 3;
Kv = [0 -1 0; 0 1 0; 0 0 0];
Kh = [0 0 0; -1 1 0; 0 0 0];
J = zero_padding(I, Kv);
[H, W, C] = size(I);


imshow(I);

%vertical
Iv = im2double(I);
for y = 1:H
    for x = 1:W     
          Iv(y, x) = mean2(J(y:y+n-1, x:x+n-1) .* Kv);
    end
end
%imshow(Iv);

%horizontal
Ih = im2double(I);
for y = 1:H
    for x = 1:W
        Ih(y, x) = mean2(J(y:y+n-1, x:x+n-1) .* Kh);
    end
end
%imshow(Ih);
%imwrite(Ih, "I_h.jpg");


%display image
%imshow(cat(2, Iv, Ih));


function J = zero_padding(I, K)
[h, w, c] = size(I);
sz_k = size(K);
pad = floor(sz_k(1)/2);
J = zeros(h+pad*2, w+pad*2, c);
for y = 1:h
    for x = 1:w
        J(1+pad:h+pad, 1+pad:w+pad, :) = I;
    end
end
end