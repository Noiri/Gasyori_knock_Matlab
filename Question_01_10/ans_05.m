clear
I = imread("imori.jpg");
J = im2double(I);

Max_v = max(J, [], 3);
Min_v = min(J, [], 3);
S = Max_v - Min_v;
V = Max_v;

R = J(:,:,1);
G = J(:,:,2);
B = J(:,:,3);

H = zeros(size(Max_v), 'like', Max_v);

H(Max_v == Min_v) = 0;
ind = (Min_v == B);
H = H + (ind) .* (60 + 60 .* (G - R) ./ S);
ind = (Min_v == R);
H = H + (ind) .* (180 + 60 .* (B - G) ./ S);
ind = (Min_v == G);
H = H + (ind) .* (300 + 60 .* (R - B) ./ S);


H = rem((H + 180), 360);

C = S;
H_ = H / 60;
X = C .* (1 - abs(rem(H_, 2) - 1));

Z = zeros(size(H), 'like', H);

vals = {{Z, X, C}, {Z, C, X}, {X,C,Z}, {C,X,Z}, {C,Z,X}, {X,Z,C}};

R = Z; G = Z; B = Z;
for i=1: 6
    ind = (i-1 <= H_) .* (H_ < i);
    R = R + ind .* (Min_v + vals{i}{1});
    G = G + ind .* (Min_v + vals{i}{2});
    B = B + ind .* (Min_v + vals{i}{3});
end

I = cat(3, R, G, B);
I(Max_v == Min_v) = 0;
I = im2uint8(I);

imshow(I);