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
pause(10)
% sound(filteredaudio1, Fs);
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
% pause(10)
% sound(filteredaudio1, Fs);
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
%sound(audio2, Fs);

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
% pause(10)
%sound(filteredaudio2, Fs)
% input2 after pre lpf frequency domain
filteredaudio_freq = fftshift(fft(filteredaudio2 ));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 2');
% sound(filteredaudio2, Fs);
% pause(10)
 %modulation input2
 x=audio2;
 Fc=14000;
 n=(0:length(audio2)-1);
 y2 = (x).* cos(2*3.14*Fc* transpose(t));

 % input 2 after modulation frequency domain
 audio_freq = fftshift(fft(y2));
 amplitude = abs(audio_freq);
 phase = angle(audio_freq);
 f = (-N/2:N/2-1)*(100000/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 2');


%sideband filtering of input1 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, y2);
pause(10)
%sound(filteredaudio1, Fs);
% after sideband filtering of input1 after modulation
filteredaudio_freq = fftshift(fft(filteredaudio2));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
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
disp(Fs)
pause(5)
% sound(audio3, Fs);
t = (0:length(audio3)-1)/Fs;
figure;
plot(t, audio3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform 3');
%input3 frequency domain
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
%premodulation lpf input3
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, audio3);
pause(10)

% input3 after pre lpf frequency domain
filteredaudio_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 3');
sound(filteredaudio3, Fs);
pause(10)
  %modulation input3
 x=audio3;
 Fc=23000;
 n=(0:length(audio3)-1);
 y3 = (x).* cos(2*3.14*Fc* transpose(t));

 % input 1 after modulation frequency domain
 audio_freq = fftshift(fft(y3));
 amplitude = abs(audio_freq);
 phase = angle(audio_freq);
 f = (-N/2:N/2-1)*(100000/N);
 figure;
 plot(f, amplitude);
 xlabel('Frequency (Hz)');
 ylabel('Amplitude');
 title('Amplitude Spectrum 3');
 ylim([0, 200]);


%sideband filtering of input3 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, y3);
pause(10)
%sound(filteredaudio1, Fs);
% after sideband filtering of input1 after modulation
filteredaudio_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 3');

filteredaudio1 = resample(filteredaudio1,length(filteredaudio3),length(filteredaudio1));
filteredaudio2 = resample(filteredaudio2,length(filteredaudio3),length(filteredaudio2));

res=filteredaudio1+filteredaudio2+filteredaudio3;
audio_freq = (fft(res));
amplitude = abs(audio_freq);
phase = angle(audio_freq);
f = Fs*(-length(res)/2:length(res)/2-1)/length(res);
figure;
plot(f*10, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum ');
ylim([0, 200]);


lpf = designfilt('highpassfir', 'FilterOrder', 50, 'CutoffFrequency',17500, 'SampleRate', Fs);
res1 = filter(lpf, res);
audio_freq = (fft(res1));
amplitude = abs(audio_freq);
phase = angle(audio_freq);
f = Fs*(-length(res1)/2:length(res1)/2-1)/length(res1);
figure;
plot(f*10, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('res1 ');
ylim([0, 200]);

% ress=(res).* cos(2*3.14*Fc* transpose(t));
