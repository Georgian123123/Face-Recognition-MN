function A_k = task1(image, k)
  %TODO
  image_matrix = double(imread(image));
  [m n] = size(image_matrix);
  U = S = V = A_k = [];
  [U S V] = svd(image_matrix);
  Uk = U(1 : m, 1 : k);
  Sk = S(1 : k, 1 : k);
  Vk = V(1 : n, 1 : k);
  A_k = Uk * Sk * Vk';
end