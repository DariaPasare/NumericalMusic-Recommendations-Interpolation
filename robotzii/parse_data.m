function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    file = fopen (filename, 'r');
    % TODO 2: Read n, x, y from the file
    n = fscanf(file, '%d', 1);
    x = fscanf(file, '%d', n + 1);
    y = fscanf(file, '%d', n + 1);
    % TODO 3: Close the file
    fclose(file);

    x = x';
    y = y';

end

