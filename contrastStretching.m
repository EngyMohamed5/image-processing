function stretchedImage = contrastStretching(Image, newMin, newMax)
   
    Image = double(Image);
    
    minIntensity = min(Image(:));
    maxIntensity = max(Image(:));
    
   
    stretchedImage = ((Image - minIntensity) * ((newMax - newMin) / (maxIntensity - minIntensity))) + newMin;
    
    stretchedImage = uint8(stretchedImage);
    
  
  
    %figure;
     %subplot(2, 2, 1); imshow(uint8(Image)); title('Original Image');
     %subplot(2, 2, 2); imhist(uint8(Image)); title('Original Histogram');
     %subplot(2, 2, 3); imshow(stretchedImage); title('Contrast Stretched Image');
     %subplot(2, 2, 4); imhist(stretchedImage); title('Contrast Stretched Histogram');
    
    
end
