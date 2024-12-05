function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients

  y_interp = zeros(size(x_interp));
  n = length(x) - 1; % nr intervale
  idx = interp1(x, 1:length(x), x_interp, 'previous'); % ia indexul lui x <= x_interp

  for i = 1:length(x_interp)
    if idx(i) > n
        idx(i) = n;
    endif

    ai = coef((idx(i) - 1) * 4 + 1);
    bi = coef((idx(i) - 1) * 4 + 2);
    ci = coef((idx(i) - 1) * 4 + 3);
    di = coef((idx(i) - 1) * 4 + 4);

    dx = x_interp(i) - x(idx(i));
    y_interp(i) = ai + bi * dx + ci * dx^2 + di * dx^3;
  endfor
endfunction


