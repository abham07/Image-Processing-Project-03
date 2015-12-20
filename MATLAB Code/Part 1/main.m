% BY: ABAD HAMEED
% ENGI4559: Digital Signals & Image Processcing
% PROF. R. Khoury
% DATE: December 07, 2015

%%%% PART 1: Bit Plane Slicing %%%%

%bitPlaneSlice('lenna.png');
%bitPlaneSlice2('lenna.png');

newImage0 = imread('lenna.png');
newImage0 = double(newImage0);
newImage1 = imread('bitplane6.png');
%newImage1 = double(newImage1);
newImage2 = imread('bitplane7.png');
newImage3 = imread('4to7.png');
newImage3 = double(newImage3);

error = newImage0-newImage3;
%newImage = and(newImage1, newImage2);
%newImage = newImage0 - newImage1;
figure;
imshow(uint8(newImage0));
title('Original');
figure;
imshow(uint8(newImage3));
title('Combine4to7');
figure;
imshow(error);
title('Error Pixels (Original vs Combine4to7)');
figure;
imshow(uint8(error));
title('Error Pixels (Original vs Combine4to7)');