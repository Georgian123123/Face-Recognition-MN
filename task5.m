function task5()
  %TODO
  image_matrix = double(imread("./in/images/image1.gif"));
  [m n] = size(image_matrix);
  [U S V] = svd(image_matrix);
  figure(1)
  plot(diag(S));
  k = [1:19 20:20:99 100:30:min(m,n)];
  miu = [];
  sum = [];
  A = image_matrix;
  Z = A' / sqrt(m - 1);
  [U S V] = svd(Z);
  W = Y = [];
  s1 = s2 = 0;
  Sum1 = Sum2 = Sum3 = [];
  q = 1;
  sum = 0;
  for i = 1 : m
    for j = 1 : n
      sum += A(i, j);
    endfor
    miu(i) = sum / n ;
    sum = 0;
  endfor
  for i = 1 : m
    A(i, :) -= miu(i);
  endfor
   for j = 1 : min(m, n)
         s2 += S(j, j);
   endfor
   for i = k(1 : length(k))
       for j = 1 : i
         s1 += S(j, j);
       endfor
    Sum1(q) = s1 / s2;
   s1 = 0;
   W = V(:, 1 : i);
   Y = W' * A;
   A_k = (W * Y)(1 : m, :) + miu(:);
     for j = 1 : m
       for l = 1 : n
          s1 += (image_matrix(j, l) - A_k(j, l)) ^ 2;
       endfor
     endfor
   Sum2(q) = s1 / (m * n);
   Sum3(q) = (2 * i + 1) / n;
   q++;
   s1 = 0;
 endfor
     figure(2);  
    plot(k, Sum1);
    figure(3);
    plot(k, Sum2);
    figure(4);
    plot(k, Sum3);
end