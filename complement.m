function complement_image = complement(Image)
    
    if size(Image, 3) == 3
        Image = rgb2gray(Image);
    end
   
    complement_image = 255 - Image;
    
end