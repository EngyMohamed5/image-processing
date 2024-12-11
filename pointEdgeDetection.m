function edge_image = pointEdgeDetection(image)
<<<<<<< HEAD
    % Check if the image is RGB, and convert to grayscale if necessary
    if size(image, 3) == 3
        image = rgb2gray(image);  % Convert RGB to grayscale if it's a color image
    end

    % Sobel kernels for edge detection
    sobel_vertical = [-1 0 1;
                      -2 0 2;
                      -1 0 1];

    sobel_horizontal = [-1 -2 -1;
                        0  0  0;
                        1  2  1];

    % Apply the Sobel operator to detect vertical edges
    vertical_edges = conv2(double(image), sobel_vertical, 'same');
    horizontal_edges = conv2(double(image), sobel_horizontal, 'same');

    % Combine both edge components to get the overall edge magnitude
    edge_image = sqrt(vertical_edges.^2 + horizontal_edges.^2);

    % Normalize the edge image to be in the range [0, 255]
    edge_image = uint8(255 * mat2gray(edge_image));  % Normalize the image

    % Display the result
    figure, imshow(edge_image);
=======
    % Pad the image with zeros on all sides
    padded_image = padarray(image, [1, 1], 0, 'both');

    % Get the dimensions of the padded image
    [rows, cols] = size(padded_image);

    % Sobel kernel for vertical edge detection
    kernel = [-1  -1  -1;
              -1  8  -1;
              -1  -1  -1];
    
    % Initialize the output image with zeros
    edge_image = zeros(rows-2, cols-2);

    % Loop through each pixel in the image
    for i = 1:rows-2
        for j = 1:cols-2
            % Extract the region around the pixel (3x3 block)
            region = double(padded_image(i:i+2, j:j+2));
            % Perform element-wise multiplication and sum it
            edge_image(i, j) = sum(sum(region .* kernel));
        end
    end
    
    % Convert the result back to uint8
    edge_image = uint8(edge_image);
     figure,imshow(edge_image);
>>>>>>> 4443b0ba3204e256ffd9370e316998525e98c184
end
