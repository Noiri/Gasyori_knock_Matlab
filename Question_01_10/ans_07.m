I = imread("imori.jpg");
n = 8;
sz = size(I);
Nh = sz(1)/n;
Nw = sz(2)/n;
C = sz(3);

for y = 1 : Nh
    for x = 1 : Nw
        for z = 1 : C
            I(n * (y-1) + 1:n * y, n * (x-1) + 1:n * x, z) = mean2(I(n * (y-1)+1:n * y, n * (x-1)+1:n * x, z));
        end
    end
end

imshow(I);