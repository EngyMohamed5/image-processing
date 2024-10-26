function [B] = brightness(I, operation, value)
    I = double(I);
    
    [w, h] = size(I);
    B = zeros(w, h);
    
    for i = 1:w
        for j = 1:h
            switch operation
                case 'add'
                    B(i, j) = I(i, j) + value;
                case 'subtract'
                    B(i, j) = I(i, j) - value;
                case 'multiply'
                    B(i, j) = I(i, j) * value;
                case 'divide'
                    if value == 0
                        error('Division by zero is not allowed.');
                    end
                    B(i, j) = I(i, j) / value;
                otherwise
                    error('Invalid operation specified.');
            end
            
            B(i, j) = max(min(B(i, j), 255), 0);
        end
    end
    
    B = uint8(B);
    figure, imshow(B);
end
