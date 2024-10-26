function [B] = rgbToGray(I , method , channel)
   
    I = double(I);

    [w, h, ~] = size(I);
    B = zeros(w, h);
   
    if nargin < 3
        channel = '';  
    end
    
   
    for i = 1:w
        for j = 1:h
            switch method
                case 'average'
                   
                    B(i, j) = (I(i, j, 1) + I(i, j, 2) + I(i, j, 3)) / 3;
                
                case 'luminosity'
                   
                    B(i, j) = 0.21 * I(i, j, 1) + 0.72 * I(i, j, 2) + 0.07 * I(i, j, 3);
                
                case 'channel'
                    
                    switch channel
                        case 'red'
                            B(i, j) = I(i, j, 1);  
                        case 'green'
                            B(i, j) = I(i, j, 2);  
                        case 'blue'
                            B(i, j) = I(i, j, 3); 
                        otherwise
                            error('Invalid channel specified. Use "red", "green", or "blue".');
                    end
                
                otherwise
                    error('Invalid method specified.');
            end
        end
    end
    
    % Convert the result to uint8 for display
    B = uint8(B);
    figure, imshow(B);
end
