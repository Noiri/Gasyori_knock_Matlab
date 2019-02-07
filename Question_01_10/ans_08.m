I = imread("imori.jpg");
n = 8;
sz = size(I);
H = sz(1);
W = sz(2);
C = sz(3);

Nh = H/n;
Nw = W/n;

for y = 1:Nh
    for x = 1:Nw
        for z = 1:C
            box = I(n*(y-1)+1:n*y, n*(x-1)+1:n*x, z);
            I(n*(y-1)+1:n*y, n*(x-1)+1:n*x, z) = max(box(:));
        end
    end
end

imshow(I);