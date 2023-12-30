% input1
[audio1, Fs] = audioread('input1.wav');
disp(Fs)
pause(5)
%sound(audio1, Fs);
t = (0:length(audio1)-1)/Fs;
figure;
plot(t, audio1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 1');

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

lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio1 = filter(lpf, audio1);
pause(10)
sound(filteredaudio1, Fs);
filteredaudio_freq = fftshift(fft(filteredaudio1));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 1');


 %modulation
 x=audio1;
 Fc=3500;
 n=(0:length(audio1)-1);
 y = (x).* cos(2*3.14*Fc.*n'/Fs);
 
 %frequency domain
 audio_freq = fftshift(fft(y));
 amplitude = abs(audio_freq);
 phase = angle(audio_freq);
 f = (-N/2:N/2-1)*(100000/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 1');


% input2
[audio2, Fs] = audioread('input2.wav');
disp(Fs)
pause(5)
%sound(audio2, Fs);
t = (0:length(audio2)-1)/Fs;
figure;
plot(t, audio2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 2');

N = length(audio2);
f = (-N/2:N/2-1)*(Fs/N);
audio_freq = fftshift(fft(audio2));
amplitude = abs(audio_freq);
phase = angle(audio_freq); 
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 2');
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, audio2);
pause(10)
sound(filteredaudio2, Fs);
filteredaudio_freq = fftshift(fft(filteredaudio2 ));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 2');

 %modulation
 x=audio2;
 Fc=9700;
 n=(0:length(audio2)-1);
 y = (x).* cos(2*3.14*Fc.*n'/Fs);
 
 %frequency domain
 audio_freq = fftshift(fft(y));
 amplitude = abs(audio_freq);
 phase = angle(audio_freq);
 f = (-N/2:N/2-1)*(100000/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 2');

% input3
[audio3, Fs] = audioread('input3.wav');
disp(Fs)
pause(5)
% sound(audio3, Fs);
t = (0:length(audio3)-1)/Fs;
figure;
plot(t, audio3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 3');

N = length(audio3);
f = (-N/2:N/2-1)*(Fs/N);
audio_freq = fftshift(fft(audio3));
amplitude = abs(audio_freq);
phase = angle(audio_freq); 
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 3');
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, audio3);
pause(10)
sound(filteredaudio3, Fs);
filteredaudio_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 3');


 %modulation
 x=audio3;
 Fc=15900;
 n=(0:length(audio3)-1);
 y = (x).* cos(2*3.14*Fc.*n'/Fs);
 %frequency domain
 audio_freq = fftshift(fft(y));
 amplitude = abs(audio_freq);
 phase = angle(audio_freq);
 f = (-N/2:N/2-1)*(100000/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 3');
 % ylim([0, 200]);