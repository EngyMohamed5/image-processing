<<<<<<< HEAD
function [binaryImage] = grayToBinary(grayImage,threshold)
    [width, height] = size(grayImage);
    binaryImage = zeros(height, width);

  
    for i = 1:height
        for j = 1:width
            
            if grayImage(i, j) >= threshold
                binaryImage(i, j) = 255; 
=======
function [binaryImage] = grayToBinary(grayImage, threshold)
    
    if size(grayImage, 3) == 3
        grayImage = rgb2gray(grayImage);
    end

    [height, width] = size(grayImage); 
    
    
    binaryImage = zeros(height, width);

    
    for i = 1:height
        for j = 1:width
            if grayImage(i, j) >= threshold
                binaryImage(i, j) = 255;
            else
                binaryImage(i, j) = 0;
>>>>>>> 4443b0ba3204e256ffd9370e316998525e98c184
            end
        end
    end

<<<<<<< HEAD
%figure , imshow(binaryImage);
end
=======
    % Display the binary image (optional)
    % figure, imshow(binaryImage);
end
>>>>>>> 4443b0ba3204e256ffd9370e316998525e98c184
