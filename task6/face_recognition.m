function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  A = double(rgb2gray(imread(image_path)));
  T = []
  T = reshape(A, [], 1);
  A = T(1 : n , :) - m(:);
  PR = eigenfaces' * T;
  %determina cea mai mica distanta
  min_dist = 999999;
  for i = 1 : 10
    dist = abs(pr_img(i) - PR);
    if(min_dist < dist)
      min_dist = dist;
      output_img_index = i;
    endif
endfor
end