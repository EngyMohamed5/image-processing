function stretchedImage = contrastStretching(Image, newMin, newMax)
   
    Image = double(Image);
    
    minIntensity = min(Image(:));
    maxIntensity = max(Image(:));
    
   
    stretchedImage = ((Image - minIntensity) * ((newMax - newMin) / (maxIntensity - minIntensity))) + newMin;
    
    stretchedImage = uint8(stretchedImage);
    
  
    subplot(1, 2, 1);
    imshow(uint8(Image));
    title('Original Grayscale Image');
    
    subplot(1, 2, 2);
    imshow(stretchedImage);
    title(['Contrast Stretched Image (', num2str(newMin), '-', num2str(newMax), ')']);
end
