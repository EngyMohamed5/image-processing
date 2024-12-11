function histogram = histogram(Image)

    % Convert to grayscale if the image is RGB
    if size(Image, 3) == 3
        Image = rgb2gray(Image);
    end
    
    % Initialize histogram array
    histogram = zeros(1, 256);

    % Count pixel intensities

    for i = 1:size(Image, 1)
        for j = 1:size(Image, 2)
            intensity = Image(i, j);
            histogram(intensity + 1) = histogram(intensity + 1) + 1;
        end
    end

end

