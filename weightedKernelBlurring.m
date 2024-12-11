function blurred_image = weightedKernelBlurring(image)
    % Pad the image with zeros on all sides
    padded_image = padarray(image, [1, 1], 0, 'both');

    % Get the dimensions of the padded image
    [rows, cols] = size(padded_image);

    % Weighted kernel (Gaussian-like 3x3 kernel)
    kernel = [1 2 1;
              2 4 2;
              1 2 1];
    
    % Normalize the kernel (divide by the sum of the kernel elements, which is 16)
    kernel = kernel / sum(kernel(:));
    
    % Initialize the output image with zeros
    blurred_image = zeros(rows-2, cols-2);

    % Loop through each pixel in the image
    for i = 1:rows-2
        for j = 1:cols-2
            % Extract the region around the pixel (3x3 block)
            region = double(padded_image(i:i+2, j:j+2));
            % Perform element-wise multiplication and sum it (convolution)
            blurred_image(i, j) = sum(sum(region .* kernel));
        end
    end
    
    % Convert the result back to uint8
    blurred_image = uint8(blurred_image);
    
    % Display the result
    figure, imshow(blurred_image);
end
