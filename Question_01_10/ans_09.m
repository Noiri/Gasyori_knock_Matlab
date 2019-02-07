clear
I = imread("imori_noise.jpg");
s = 1.3;
K = Gaussian(3, s);

I = Conv(I, K);

imshow(I);

function K = Gaussian(n, s)
shift = floor(n/2)+1;
K = zeros(n);
for x = 1:n
    for y = 1:n
        K(y, x) = exp(-((x-shift)^2 + (y-shift)^2)/(2*s^2));        
    end
end
K = K/(s*sqrt(2*pi));
K = K/sum(K(:));
end

function I = Conv(I, K)
[h, w, c] = size(I);
sz_K = size(K);
pad = floor(sz_K(1)/2);
J = zeros(h+2, w+2, c);
J(1+pad:h+pad, 1+pad:w+pad, :) = I; 
for y = 1:h
    for x = 1:w
        for z = 1:c
            r = J(y:y+sz_K-1, x:x+sz_K-1, z) .* K;       
            I(y,x,z) = sum(r(:));
        end
    end
end
end