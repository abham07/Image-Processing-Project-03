% BY: ABAD HAMEED
% ENGI4559: Digital Signals & Image Processcing
% PROF. R. Khoury
% DATE: December 07, 2015

function bitPlaneSlice2(image)
    %read the picture
    origImage = imread(image);
    origImage = double(origImage);
    
    %initalize some variables
    %bit = 8;
    %bitplane = bit - plane;
    m = size(origImage,1);
    n = size(origImage,2);
    
    compressed = zeros(size(origImage));
    
    for i=1:m
        for j=1:n
            %change decimal to binary
            combine = dec2bin(origImage(i,j),8);
            %combine2 = cat(2, plane7, plane6, plane5, plane4, ...
                    %plane3, plane2, plane1, plane0);
            combine2 = cat(2, combine(1,1),combine(1,2),combine(1,3),combine(1,4),...
                '0','0','0','0');
                %combine(1,5),combine(1,6),combine(1,7),combine(1,8));
            
            combine = bin2dec(combine2);
            
            compressed(i,j) = combine;
        end
    end
    
    figure;
    imagesc(uint8(compressed));
    colormap(gray);
    title('Combined Bit-Planes 4 to 7');
    imwrite(uint8(compressed),'4to7.png');
    
    diffImage = origImage - compressed;
    figure;
    imagesc(uint8(diffImage));
    colormap(gray);
    title('Original - Combined');
end