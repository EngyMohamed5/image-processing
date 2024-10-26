function [R] = GammaCorrection(image, Gamma_num)
  R = im2double(image);
  [w, h] = size(R);

  for i = 1:w
      for j = 1:h
          R(i, j) = R(i, j) .^ Gamma_num;
      end
  end

  R = im2uint8(R);
  figure, imshow(R);
end