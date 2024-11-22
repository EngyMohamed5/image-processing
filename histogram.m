function histogram = histogram(Image)
    histogram = zeros(1, 256);

    for i = 1:size(Image, 1)
        for j = 1:size(Image, 2)
            intensity = Image(i, j);
            histogram(intensity + 1) = histogram(intensity + 1) + 1;
        end
    end

    bar(0:255, histogram);
    title('Histogram of Grayscale Image');
    xlabel('Pixel Intensity');
    ylabel('Frequency');
end