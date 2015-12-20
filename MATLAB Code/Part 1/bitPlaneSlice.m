% BY: ABAD HAMEED
% ENGI4559: Digital Signals & Image Processcing
% PROF. R. Khoury
% DATE: December 07, 2015

function bitPlaneSlice(image)
    %read the picture
    origImage = imread(image);
    origImage = double(origImage);
    
    %initalize some variables
    %bit = 8;
    %bitplane = bit - plane;
    m = size(origImage,1);
    n = size(origImage,2);
    
    %plane0 = char(zeros(size(origImage)));
    plane0 = zeros(size(origImage));
    plane1 = zeros(size(origImage));
    plane2 = zeros(size(origImage));
    plane3 = zeros(size(origImage));
    plane4 = zeros(size(origImage));
    plane5 = zeros(size(origImage));
    plane6 = zeros(size(origImage));
    plane7 = zeros(size(origImage));
    
    for i=1:m
        for j=1:n
            %change decimal to binary
            plane = dec2bin(origImage(i,j),8);
            %Seperate the indiviual bits to each plane
            if(plane(1,8) == dec2bin(1))
                plane0(i,j) = 255;
            else
                plane0(i,j) = 0;
            end
            
            if(plane(1,7) == dec2bin(1))
                plane1(i,j) = 255;
            else
                plane1(i,j) = 0;
            end
            
            if(plane(1,6) == dec2bin(1))
                plane2(i,j) = 255;
            else
                plane2(i,j) = 0;
            end
            
            if(plane(1,5) == dec2bin(1))
                plane3(i,j) = 255;
            else
                plane3(i,j) = 0;
            end
            
            if(plane(1,4) == dec2bin(1))
                plane4(i,j) = 255;
            else
                plane4(i,j) = 0;
            end
            
            if(plane(1,3) == dec2bin(1))
                plane5(i,j) = 255;
            else
                plane5(i,j) = 0;
            end
            
            if(plane(1,2) == dec2bin(1))
                plane6(i,j) = 255;
            else
                plane6(i,j) = 0;
            end
            
            if(plane(1,1) == dec2bin(1))
                plane7(i,j) = 255;
            else
                plane7(i,j) = 0;
            end
        end
    end
    
    %display results
    figure;
    imagesc(uint8(plane0));
    colormap(gray);
    title('Bit Plane 0');
    
    figure;
    imagesc(uint8(plane1));
    colormap(gray);
    title('Bit Plane 1');
    
    figure;
    imagesc(uint8(plane2));
    colormap(gray);
    title('Bit Plane 2');
    
    figure;
    imagesc(uint8(plane3));
    colormap(gray);
    title('Bit Plane 3');
    
    figure;
    imagesc(uint8(plane4));
    colormap(gray);
    title('Bit Plane 4');
    
    figure;
    imagesc(uint8(plane5));
    colormap(gray);
    title('Bit Plane 5');
    
    figure;
    imagesc(uint8(plane6));
    colormap(gray);
    title('Bit Plane 6');
    
    figure;
    imagesc(uint8(plane7));
    colormap(gray);
    title('Bit Plane 7');    
end