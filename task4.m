function [A_k S] = task4(image, k)
   %TODO
  image_matrix = double(imread(image));
 [m n] = size(image_matrix);
  miu = [];
  sum = 0;
  for i = 1 : m
    for j = 1 : n
      sum += image_matrix(i, j);
    endfor
    miu(i) = sum / n ;
    sum = 0;
  endfor
  for i = 1 : m
    image_matrix(i, :) -= miu(i);
  endfor
  A = image_matrix;
  Z = A * A' / (n - 1);
  [U S V] = svd(Z);
  W = Y = [];
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = (W * Y)(1 : m, :) + miu(:);
endfunction