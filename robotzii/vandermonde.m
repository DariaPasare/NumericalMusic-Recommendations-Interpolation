function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(x);
    V = zeros(n);

    for i = 1:n
      for j = 1:n
          V(i, j) = x(i)^(j-1); % matricea Vandermonde
      endfor
    endfor

    coef = V \ y';
endfunction

