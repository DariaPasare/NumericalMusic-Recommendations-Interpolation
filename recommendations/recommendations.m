function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  preprocessed_matrix = preprocess(mat, min_reviews);
  [U, S, V] = svds(preprocessed_matrix, num_features); % V va contine doar num_features valori singulare
  lin_V = size(V, 1);
  similarities = zeros(1, lin_V);
  liked = V(liked_theme,:); %vectorul care contine info despre liked theme
  for i = 1:lin_V
    similarities(i) = cosine_similarity(V(i, :)', liked');
  endfor
  [~, indices] = sort(similarities, 'descend'); % vectorul de similaritati sortat
  recoms = indices(1, 2:(1 + num_recoms));
end
