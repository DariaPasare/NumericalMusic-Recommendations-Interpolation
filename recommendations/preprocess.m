function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  [lin, col] = size(mat);
  i = 1;

  while i <= lin
    cnt = 0;
    for j = 1:col
      if mat(i, j) > 0
        cnt = cnt + 1;
      endif
    endfor

    if cnt < min_reviews
      mat(i, :) = []; % sterg linia
      lin = lin - 1; % actualizez nr de linii
    else
      i = i + 1;
    endif

  endwhile

  reduced_mat = mat;

end

