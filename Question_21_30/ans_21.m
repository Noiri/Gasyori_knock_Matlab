clear
I = imread("imori_dark.jpg");

I = transformation_curve(0, 255, I);

figure
title("transformed image");
imshow(I);

figure
title("transformed histogram");
imhist(I, 256);

function I = transformation_curve(a, b, I)
I = double(I);
Max_v = max(I(:));
Min_v = min(I(:));
I = (b - a)/(Max_v - Min_v) .* (I - Min_v) + a;
I = uint8(I);
end
