function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
  n = length(x_interp);
  y_interp = zeros(n);

  for i = 1:n
    sum = 0;
    m = length(coef);
    for j = 1:m
      sum = sum + (x_interp(i)^(j-1)) * coef(j);
    endfor
    y_interp(i) = sum;
  endfor

endfunction
