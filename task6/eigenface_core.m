function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  v = [];
  T = [];
  for i = 1 : 1
    image_path = strcat(database_path, '/', int2str(i), 'jpg');
    A = double(rgb2gray(imread(image_path)));
    v = reshape(A', [], i); T
    T(1 : i, :) = v; 
  endfor
  [n, r] = size(T);
  m = mean(T');
  A = T(1 : n , :) - m(:);
  [V S] = eigs(A' * A, length(A);
  Q = [];
  [o p] = size(S);
  p = 1;
  for i = 1 : o
    if S(i,i) >= 1
      Q = [Q, V(:, i)];
    endif
  endfor
  eigenface = A * V;
  pr_img = eigenfaces' * A;
end