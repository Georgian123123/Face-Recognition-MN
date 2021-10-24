function task2()
   %TODO
   image_matrix = double(imread('./in/images/image1.gif'));
   [m n] = size(image_matrix);
   U = S = V = A_k = [];
   [U S V] = svd(image_matrix);
   figure(1);
   plot(diag(S));
   k = [1:19 20:20:99 100:30:min(m,n)];
   s1 = s2 = 0;
   Sum1 = Sum2 = Sum3 = [];
   q = 1;
   for j = 1 : min(m, n)
         s2 += S(j, j);
   endfor
   for i = k(1 : length(k))
       for j = 1 : i
         s1 += S(j, j);
       endfor
    Sum1(q) = s1 / s2;
   s1 = 0;
   U_k = U(1 : m, 1 : i);
   S_k = S(1 : i, 1 : i);
   V_k = V(1 : n, 1 : i);
   A_k = U_k * S_k * V_k';
     for j = 1 : m
       for l = 1 : n
          s1 += (image_matrix(j, l) - A_k(j, l)) ^ 2;
       endfor
     endfor
   Sum2(q) = s1 / (m * n);
   Sum3(q) = (m * i + n * i + i) / (m * n);
   q++;
   s1 = 0;
 endfor
    figure(2);  
    plot(k, Sum1);
    figure(3);
    plot(k, Sum2);
    figure(4);
    plot(k, Sum3);
endfunction