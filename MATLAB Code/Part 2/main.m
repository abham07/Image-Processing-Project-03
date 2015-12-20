% BY: ABAD HAMEED
% ENGI4559: Digital Signals & Image Processcing
% PROF. R. Khoury
% DATE: December 07, 2015

%%%% PART 2: CCTV Image Processing %%%%

origImage = imread('backalley.jpg');
%image1 = imread('backalley\backalley3.jpg'); % 1 3 6 10 11 12
image1 = imread('backalley\backalley10.jpg'); % 1 3 6 10 11 12

%figure;
%imagesc(origImage);
%colormap(gray);
%title('Original Backalley');
%figure;
%imhist(origImage);
%title('Original Backalley Histogram');
%figure;
%imhist(image1);
%title('Weathered Backalley Histogram');

J = imhist(origImage);
K = histeq(image1,J);

%figure;
%imhist(K);
%title('Equalized Backalley Histogram');

%figure;
%imagesc(K);
%colormap(gray);
%title('Equalized Backalley');

%diffImage = K - origImage;
diffImage = double(origImage) - double(K);
%diffImage = abs(double(origImage)-double(K));
thresholdValue = 65; %72
filteredImage = diffImage > thresholdValue;

figure;
imagesc(filteredImage);
colormap(gray);
title('Action (Foreground Detection)');
