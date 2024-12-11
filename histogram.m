function histogram = histogram(Image)
<<<<<<< HEAD
    histogram = zeros(1, 256);

=======
    % Convert to grayscale if the image is RGB
    if size(Image, 3) == 3
        Image = rgb2gray(Image);
    end
    
    % Initialize histogram array
    histogram = zeros(1, 256);

    % Count pixel intensities
>>>>>>> 4443b0ba3204e256ffd9370e316998525e98c184
    for i = 1:size(Image, 1)
        for j = 1:size(Image, 2)
            intensity = Image(i, j);
            histogram(intensity + 1) = histogram(intensity + 1) + 1;
        end
    end
<<<<<<< HEAD

    bar(0:255, histogram);
    title('Histogram of Grayscale Image');
    xlabel('Pixel Intensity');
    ylabel('Frequency');
end
=======
end
>>>>>>> 4443b0ba3204e256ffd9370e316998525e98c184
