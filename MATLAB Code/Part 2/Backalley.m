function Backalley()
    close all;
    
    %Background image
    background = imread('backalley.jpg');
    %background = double(background);
    %X = size(background,2);
    %Y = size(background,1);

    %figure
    %colormap(gray)
    %imagesc(background)
    %axis equal
    %axis([1 X 1 Y])
    %title('Original Backalley')
    
    %figure;
    %imhist(background);
    %title('Original Backalley Histogram');
    %xlabel('Intensity Value');
    %ylabel('Number of Pixels');

    %loop for all images
    for i = 0:15
        % read the image at the path specified
        image = ['backalley\backalley' num2str(i) '.jpg'];
        disp(['Analyzing: ' image])
        backalley = imread(image);
        %backalley = double(backalley);

        %histname = ['Backalley ' num2str(i) ' Histogram'];
        %figure;
        %imhist(backalley);
        %title(histname);
        
        % find the histogram for original image then use it to equalize or
        % redistrubute the histogram for each img across the entire length
        origHist = imhist(background);
        eqImage = histeq(backalley,origHist);

        %eqhistname = ['Backalley ' num2str(i) ' Equalized Histogram'];
        %figure;
        %imhist(eqHist);
        %title(eqhistname);

        %eqname = ['Equalized Backalley ' num2str(i)];
        %figure;
        %imagesc(eqImage);
        %colormap(gray);
        %title(eqname);
        %eqfilename = ['backalley' num2str(i) '.jpg'];
        %imwrite(eqImage,eqfilename);

        % background subtraction being performed
        diffImage = double(background) - double(eqImage);
        %diffImage = abs(double(background) - double(eqImage));
        %figure;
        %imshow(diffImage);
        %title('Background Subtraction');
        %subfilename = ['subtracted image' num2str(i) '.jpg'];
        %imwrite(diffImage,subfilename);
        
        % threshold value applied to the background subtracted image
        % Note: it results in a logical image with 1 or 0 for each pixel
        thresholdValue = 50;
        criminalFound = diffImage > thresholdValue;
        %criminalFound = avgImage > thresholdValue;
        %tempname = ['Threshold Image' num2str(i) '.jpg'];
        %imwrite(criminalFound,tempname);
        
        % various filters that can be applied for noise reduction
        %avgImage = meanFilt(criminalFound, 3);
        avgImage = medFilt(criminalFound, 3);
        %avgImage = minFilt(criminalFound, 3);

        % this loop scans through each image pixel-by-pixel in search for a
        % white pixel. If one is detected, it outputs that image.
        T=true;
        for ii=1:size(avgImage,1)
            for jj=1:size(avgImage,2)
                % get pixel value
                pixel=avgImage(ii,jj);

                % check pixel value and assign new value
                if (pixel>0.5 && T)
                    imname = ['Criminal in Backalley ' num2str(i) '.jpg'];
                    figure;
                    imshow(avgImage);
                    title(imname);
                    %imwrite(avgImage, imname);
                    T=logical(0);
                end
            end
        end
        
        % Displays all images (if the for loops above were commented)
        %imname = ['Backalley ' num2str(i)];
        %figure;
        %imshow(avgImage);
        %axis equal;
        %axis([1 X 1 Y]);
        %title(imname);
    end
end
    