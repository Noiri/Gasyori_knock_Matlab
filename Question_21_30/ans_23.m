clear
I = imread("imori.jpg");
[H, W, C] = size(I);

S = double(H * W * C);

out = I;

sum_h = 0.0;
z_max = 255.0;

J = I .* 0;

H = imhist(I);
for i = 1:255
    sum_h = sum(H(1:i));
    z_prime = z_max / S * sum_h;
    J(I==i) = z_prime;    
end

figure
imshow(J);

figure
imhist(J);