function outputImage = histogramEqualization(inputImage)
    
    if size(inputImage, 3) == 3
        inputImage = rgb2gray(inputImage);
    end
    
    [counts, binLocations] = imhist(inputImage);
    
  
    numPixels = numel(inputImage);
    normalizedCounts = counts / numPixels;
    
    % Compute the cumulative distribution function (CDF)
    cdf = cumsum(normalizedCounts);
    
    % Scale the CDF to fit the intensity range [0, 255]
    cdfScaled = round(cdf * 255);
    
    % Map the intensity values based on the CDF
    outputImage = cdfScaled(inputImage + 1);
     
    outputImage = uint8(outputImage);
   
    figure;
    subplot(2, 2, 1); imshow(inputImage); title('Original Image');
    subplot(2, 2, 2); imhist(inputImage); title('Original Histogram');
    subplot(2, 2, 3); imshow(outputImage); title('Equalized Image');
    subplot(2, 2, 4); imhist(outputImage); title('Equalized Histogram');
end
