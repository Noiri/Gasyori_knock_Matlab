I = imread("imori.jpg");
I(0<=I & I<63) = 32;
I(63<=I & I<127) = 96;
I(127<=I & I<191) = 160;
I(191<=I & I<256) = 224;
imshow(I);