function output_image = Ideal_Low_Pass_Filter(input_image)
    % Predefined cutoff frequency
    cutoff_frequency = 50;  % You can set this to any value or get it from GUI
    
    % Step 1: Obtain the size of the image
    [M, N] = size(input_image);
    
    % Step 2: Transform the image from spatial domain to frequency domain
    F = fft2(double(input_image));
    F_shifted = fftshift(F);
    
    % Create the Ideal Low Pass Filter (ILPF)
    [X, Y] = meshgrid(1:N, 1:M);
    D = sqrt((X - N/2).^2 + (Y - M/2).^2);
    H = double(D <= cutoff_frequency);  % Ideal Low Pass Filter
    
    % Step 3: Apply the filter
    F_filtered = F_shifted .* H;
    
    % Step 4: Inverse Fourier Transform to get the filtered image
    F_inverse_shifted = ifftshift(F_filtered);
    output_image = real(ifft2(F_inverse_shifted));
    output_image=mat2gray(output_image);
end
