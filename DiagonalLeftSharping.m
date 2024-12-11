function edge_image = DiagonalLeftSharping(image)
    % Pad the image with zeros on all sides
    padded_image = padarray(image, [1, 1], 0, 'both');

    % Get the dimensions of the padded image
    [rows, cols] = size(padded_image);

   
   kernel =   [ 1  0  0;  0  1  0;  0  0 -1];

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
end
