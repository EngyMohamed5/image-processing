function [R] = logCorrection(image,c)
  R = im2double(image);
  [w, h] = size(R);

  for i = 1:w
      for j = 1:h
          R(i, j) = c * log(1+R(i, j)); 
      end
  end

  R = im2uint8(R);
  figure, imshow(R);
end