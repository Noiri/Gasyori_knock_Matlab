I = imread("imori.jpg");
I = 0.2126*I(:,:,1) + 0.7152*I(:,:,2) + 0.0722*I(:,:,3);
Max_t = 0;
Max_sigma = 0;
A = numel(I);
for t=1: 255
    Lower = I(I<t);
    Upper = I(I>=t);
    w0 = numel(Lower)/A;
    w1 = numel(Upper)/A;
    
    M0 = mean(Lower);
    M1 = mean(Upper);
   
    St = w0 * w1 * (M0 - M1).^2;
    if St > Max_sigma
        Max_sigma = St;
        Max_t = t;
    end
end
I(I<Max_t) = 0;
I(I>=Max_t) = 255;
imshow(I);