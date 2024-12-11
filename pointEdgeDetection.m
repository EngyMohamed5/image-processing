function edge_image = pointEdgeDetection(image)
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
end
