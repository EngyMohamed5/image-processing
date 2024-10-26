function [I] = inverseLogCorrection(R, c)
    R = im2double(R);
    [w, h] = size(R);
    
    I = zeros(w, h);

    for i = 1:w
        for j = 1:h
            I(i, j) = exp(R(i, j) / c) - 1; 
        end
    end

    I = im2uint8(I);
    figure, imshow(I);
end
