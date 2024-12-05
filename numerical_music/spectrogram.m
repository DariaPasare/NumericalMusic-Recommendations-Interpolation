function [S, f, t] = spectrogram(signal, fs, window_size)
  nr_windows = floor(length(signal) / window_size);
  S = zeros(window_size, nr_windows);
  f = zeros(window_size, 1);
  t = zeros(nr_windows, 1);
  hann_window = hanning(window_size);

  % spectograma
  for i = 1:nr_windows
    start_idx = (i-1) * window_size + 1;
    end_idx = start_idx + window_size - 1;

    window = signal(start_idx:end_idx);
    window_segment = window .* hann_window;

    window_fft = fft(window_segment, 2 * window_size);
    S(:, i) = abs(window_fft(1:window_size));
  endfor

  % vectorul de frecventa
  for i = 1:window_size
    f(i) = (i - 1) * (fs / (2 * window_size));
  endfor

  % vectorul de timp
  for i = 1:nr_windows
    t(i) = (i - 1) * (window_size / fs);
  endfor

endfunction

