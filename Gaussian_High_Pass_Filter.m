function output_image = Gaussian_High_Pass_Filter(input_image)
    % Convert image to grayscale if it's not already
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    % Step 1: Get the size of the image
    [M, N] = size(input_image);
    
    % Step 2: Transform the image to the frequency domain
    F = fft2(double(input_image));  % Fourier Transform
    F_shifted = fftshift(F);        % Shift zero frequency to the center
    
    % Step 3: Create the Gaussian High Pass Filter
    cutoff_frequency = min(M, N) * 0.1; % 10% of the image size as default
    [X, Y] = meshgrid(1:N, 1:M);
    D = sqrt((X - N/2).^2 + (Y - M/2).^2);  % Distance from the center
    H = 1 - exp(-(D.^2) / (2 * cutoff_frequency^2));  % Gaussian High Pass Filter equation
    
    % Step 4: Apply the filter
    F_filtered = F_shifted .* H;
    
    % Step 5: Transform the filtered image back to the spatial domain
    F_inverse_shifted = ifftshift(F_filtered);
    output_image = real(ifft2(F_inverse_shifted));
    
    % Step 6: Normalize the output image
    output_image = mat2gray(output_image); % Normalize to [0, 1]
    
    % Display results
    figure;
    subplot(1, 2, 1), imshow(input_image, []), title('Original Image');
    subplot(1, 2, 2), imshow(output_image, []), title('Gaussian High Pass Filtered Image');
end
