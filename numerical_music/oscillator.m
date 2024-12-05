function x = oscillator(freq, fs, dur, A, D, S, R)
  step = 1 / fs;
  t = 0:step:(dur-step);
  n = length(t);

  sine_wave = sin(2 * pi * freq * t);
  nr_A = floor(A * fs);
  nr_D = floor(D * fs);
  nr_R = floor(R * fs);
  nr_S = max(0, n - nr_A - nr_D - nr_R);
  envA = linspace(0, 1, nr_A); %attack envelope
  envD = linspace(1, S, nr_D); %decay envelope
  envS = S * ones(1, nr_S); %sustain envelope
  envR = linspace(S, 0, nr_R); %release envelope
  envelope = [envA, envD, envS, envR]; %ADSR envelope
  m = length(envelope);
  if  m > n
    envelope = envelope(1:n);
  elseif m < n
    envelope = [envelope zeros(1, n - m)];
  endif

  x = sine_wave .* envelope; %Hadamard product
  x = x';
endfunction


