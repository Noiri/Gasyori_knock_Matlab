I = imread("imori.jpg");
G = 0.2126*I(:,:,1) + 0.7152*I(:,:,2) + 0.0722*I(:,:,3);
imshow(G);