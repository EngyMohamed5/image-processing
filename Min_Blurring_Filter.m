function output_image = Min_Blurring_Filter(input_image)
    % input_image: The grayscale input image
    window_size = 3;  % Set filter size to 3x3
    
    % Get the size of the input image
    [M, N] = size(input_image);
    
    % Pad the image to handle borders
    padded_image = padarray(input_image, [floor(window_size/2), floor(window_size/2)], 'replicate');
    
    % Initialize output image
    output_image = zeros(M, N);
    
    % Perform Min filter operation
    for i = 1:M
        for j = 1:N
            % Extract the local window
            window = padded_image(i:i+window_size-1, j:j+window_size-1);
            % Apply the Min filter
            output_image(i,j) = min(window(:));
        end
    end
    
    % Display the output image
    output_image = uint8(output_image);
end
