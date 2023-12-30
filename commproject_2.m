% input1
% reading input1
[audio1, Fs] = audioread('input1.wav');
%resample input1
audio1 = resample(audio1, 50000, Fs);

Fs=50000;
disp(Fs)
pause(5)
% sound(audio1, Fs);
t = (0:length(audio1)-1)/Fs;
figure;
plot(t, audio1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 1');
%input1 frequency domain
N = length(audio1);
f = (-N/2:N/2-1)*(Fs/N);
audio_freq = fftshift(fft(audio1));
amplitude = abs(audio_freq);
phase = angle(audio_freq); 
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 1');
%premodulation lpf input1
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio1 = filter(lpf, audio1);
% input1 after pre lpf frequency domain
filteredaudio1_freq=fftshift(fft(filteredaudio1));
amplitude = abs(filteredaudio1_freq);
phase = angle(filteredaudio1_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 1');

 %modulation input1
 x=filteredaudio1;
 Fc=5000;
 n=(0:length(filteredaudio1)-1);
 y1 = (x).* cos(2*3.14*Fc* transpose(t));

 % input 1 after modulation frequency domain
 audio1_freq = fftshift(fft(y1));
 amplitude = abs(audio1_freq);
 phase = angle(audio1_freq);
 f = (-N/2:N/2-1)*(Fs/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 1');


%sideband filtering of input1 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio1 = filter(lpf, y1);
% after sideband filtering of input1 after modulation
filteredaudio1_freq = fftshift(fft(filteredaudio1));
amplitude = abs(filteredaudio1_freq);
phase = angle(filteredaudio1_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 1');


% input2
% reading input2
[audio2, Fs] = audioread('input2.wav');
%resample input1
audio2 = resample(audio2, 50000, Fs);
Fs=50000;
pause(5)
t = (0:length(audio2)-1)/Fs;
figure;
plot(t, audio2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 2');
%input2 frequency domain
N = length(audio2);
f = (-N/2:N/2-1)*(Fs/N);
audio2_freq = fftshift(fft(audio2));
amplitude = abs(audio2_freq);
phase = angle(audio2_freq); 
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 2');
%premodulation lpf input2
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, audio2);
% input2 after pre lpf frequency domain
filteredaudio2_freq = fftshift(fft(filteredaudio2 ));
amplitude = abs(filteredaudio2_freq);
phase = angle(filteredaudio2_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 2');
 %modulation input2
 x=filteredaudio2;
 Fc=14000;
 n=(0:length(filteredaudio2)-1);
 y2 = (x).* cos(2*3.14*Fc* transpose(t));

 % input 2 after modulation frequency domain
 audio2_freq = fftshift(fft(y2));
 amplitude = abs(audio2_freq);
 phase = angle(audio2_freq);
 f = (-N/2:N/2-1)*(Fs/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 2');


%sideband filtering of input2 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, y2);
% after sideband filtering of input2 after modulation
filteredaudio2_freq = fftshift(fft(filteredaudio2));
amplitude = abs(filteredaudio2_freq);
phase = angle(filteredaudio2_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 2');


% input3
% reading input3
[audio3, Fs] = audioread('input3.wav');
%resample input3
audio3 = resample(audio3, 50000, Fs);
Fs=50000;
pause(5)
t = (0:length(audio3)-1)/Fs;
figure;
plot(t, audio3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 3');
%input3 frequency domain
N = length(audio3);
f = (-N/2:N/2-1)*(Fs/N);
audio3_freq = fftshift(fft(audio3));
amplitude = abs(audio3_freq);
phase = angle(audio3_freq); 
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 3');
%premodulation lpf input3
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, audio3);
% input3 after pre lpf frequency domain
filteredaudio3_freq = fftshift(fft(filteredaudio3 ));
amplitude = abs(filteredaudio3_freq);
phase = angle(filteredaudio3_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 3');
 %modulation input3
 x=filteredaudio3;
 Fc=23000;
 n=(0:length(filteredaudio3)-1);
 y3 = (x).* cos(2*3.14*Fc* transpose(t));

 % input 3 after modulation frequency domain
 audio3_freq = fftshift(fft(y3));
 amplitude = abs(audio3_freq);
 phase = angle(audio3_freq);
 f = (-N/2:N/2-1)*(Fs/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 3');


%sideband filtering of input3 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, y3);
% after sideband filtering of input3 after modulation
filteredaudio3_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio3_freq);
phase = angle(filteredaudio3_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 3');


%adding frequency signals to the same spectrum
res=filteredaudio1_freq+filteredaudio2_freq+filteredaudio3_freq;
amplitude = abs(res);
phase = angle(res);
f = Fs*(-length(res)/2:length(res)/2-1)/length(res);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude of common Spectrum ');

