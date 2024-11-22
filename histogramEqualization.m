function equalizedImage = histogramEqualization(grayImage)
    equalizedImage = histeq(grayImage);

    subplot(2, 2, 1);
    imshow(uint8(grayImage));
    title('Original Grayscale Image');

    subplot(2, 2, 2);
    imhist(uint8(grayImage));
    title('Histogram of Original Image');

    subplot(2, 2, 3);
    imshow(equalizedImage);
    title('Equalized Image');

    subplot(2, 2, 4);
    imhist(equalizedImage);
    title('Histogram of Equalized Image');
end