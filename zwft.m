% input3
% reading input3
[audio3, Fs] = audioread('input3.wav');
%resample input3
audio3 = resample(audio3, 50000, Fs);
Fs=50000;
pause(5)
%sound(audio3, Fs);

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
% pause(10)
%sound(filteredaudio3, Fs)
% input3 after pre lpf frequency domain
filteredaudio3_freq = fftshift(fft(filteredaudio3 ));
amplitude = abs(filteredaudio3_freq);
phase = angle(filteredaudio3_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 3');
% sound(filteredaudio3, Fs);
% pause(10)
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
% pause(10)
%sound(filteredaudio3, Fs);
% after sideband filtering of input3 after modulation
filteredaudio3_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio3_freq);
phase = angle(filteredaudio3_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 3');