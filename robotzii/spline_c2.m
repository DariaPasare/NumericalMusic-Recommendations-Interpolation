function coef = spline_c2(x, y)
    % Remember that the indexes in Matlab start from 1, not 0

    % si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
    % si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
    % si''(x) =                   2ci          + 6di(x - xi)

    n = length(x) - 1;
    unknowns = 4 * n;
    A = zeros(unknowns, unknowns);
    b = zeros(unknowns, 1);
    cnt = 1; % cu ajutorul lui ma mut prin matrice

    % TODO 1: si(xi) = yi, i = 0 : n - 1
    for i = 1:n
      A(i, (i-1)*4 + 1) = 1;  % ai
      b(i) = y(i);
      cnt += 1;
    endfor

    % TODO 2: s_n-1(xn) = yn
    A(cnt, (n-1)*4 + 1) = 1;
    A(cnt, (n-1)*4 + 2) = x(n+1) - x(n);
    A(cnt, (n-1)*4 + 3) = (x(n+1) - x(n))^2;
    A(cnt, (n-1)*4 + 4) = (x(n+1) - x(n))^3;
    b(cnt) = y(n+1);
    cnt += 1;

    % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
    for i = 1:n-1
      A(cnt, (i-1)*4 + 1) = 1; % coef lui ai
      A(cnt, (i-1)*4 + 2) = x(i+1) - x(i); % coef lui bi
      A(cnt, (i-1)*4 + 3) = (x(i+1) - x(i))^2; % coef lui ci
      A(cnt, (i-1)*4 + 4) = (x(i+1) - x(i))^3; % coef lui di

      A(cnt, i*4 + 1) = -1;
      b(cnt) = 0;
      cnt += 1;
    endfor

    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
    for i = 1:n-1
      A(cnt, (i-1)*4 + 2) = 1;
      A(cnt, (i-1)*4 + 3) = 2 * (x(i+1) - x(i));
      A(cnt, (i-1)*4 + 4) = 3 * (x(i+1) - x(i))^2;

      A(cnt, i*4 + 2) = -1;
      b(cnt) = 0;
      cnt += 1;
    endfor

    % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    for i = 1:n-1
      A(cnt, (i-1)*4 + 3) = 2;
      A(cnt, (i-1)*4 + 4) = 6 * (x(i+1) - x(i));

      A(cnt, i*4 + 3) = -2;
      b(cnt) = 0;
      cnt += 1;
    endfor

    % TODO 6: s0''(x0) = 0
    A(cnt, 3) = 2;
    b(cnt) = 0;
    cnt += 1;

    % TODO 7: s_n-1''(x_n) = 0
    A(cnt, (n-1)*4 + 3) = 2;
    A(cnt, (n-1)*4 + 4) = 6 * (x(n+1) - x(n));
    b(cnt) = 0;

    % Solve the system of equations
    coef = A \ b;
endfunction

