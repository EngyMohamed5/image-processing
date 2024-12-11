function [binaryImage] = grayToBinary(grayImage,threshold)
    [width, height] = size(grayImage);
    binaryImage = zeros(height, width);

  
    for i = 1:height
        for j = 1:width
            
            if grayImage(i, j) >= threshold
                binaryImage(i, j) = 255; 
            end
        end
    end

%figure , imshow(binaryImage);
end