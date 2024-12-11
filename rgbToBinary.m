function [binaryImage] = rgbToBinary(rgbImage)
    grayImage = rgbImage(:,:,1) * 0.2989 + rgbImage(:,:,2) * 0.5870 + rgbImage(:,:,3) * 0.1140;
    threshold = 128; 
    binaryImage = grayImage >= threshold; 
    %figure, imshow(binaryImage);
end