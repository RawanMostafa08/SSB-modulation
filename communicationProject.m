% input1
% reading input1
[audio1, Fs] = audioread('input1.wav');
%resample input1
audio1 = resample(audio1, 54000, Fs);
Fs=54000;
disp(Fs)
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
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 1');
%input1 low pass filter
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio1 = filter(lpf, audio1);
filteredaudio1_freq=fftshift(fft(filteredaudio1));
amplitude = abs(filteredaudio1_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 1');

%modulation input1
x=filteredaudio1;
Fc=5000;
y1 = (x).* cos(2*3.14*Fc* transpose(t));
audio1_freq = fftshift(fft(y1));
amplitude = abs(audio1_freq);
f = (-N/2:N/2-1)*(Fs/N);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum 1');

%sideband filtering of input1 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 500, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio1 = filter(lpf, y1);
filteredaudio1_freq = fftshift(fft(filteredaudio1));
amplitude = abs(filteredaudio1_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 1');


% input2
% reading input2
[audio2, Fs] = audioread('input2.wav');
%resample input2
audio2 = resample(audio2, 54000, Fs);
Fs=54000;
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
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 2');
%input2 low pass filter
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, audio2);
filteredaudio2_freq = fftshift(fft(filteredaudio2 ));
amplitude = abs(filteredaudio2_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter 2');
%modulation input2
x=filteredaudio2;
Fc=14000;
y2 = (x).* cos(2*3.14*Fc* transpose(t));
audio2_freq = fftshift(fft(y2));
amplitude = abs(audio2_freq);
f = (-N/2:N/2-1)*(Fs/N);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum 2');


%sideband filtering of input2 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 500, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio2 = filter(lpf, y2);
filteredaudio2_freq = fftshift(fft(filteredaudio2));
amplitude = abs(filteredaudio2_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 2');


% input3
% reading input3
[audio3, Fs] = audioread('input3.wav');
%resample input3
audio3 = resample(audio3, 54000, Fs);
Fs=54000;
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
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter 3');
%input3 low pass filter
lpf = designfilt('lowpassfir', 'FilterOrder', 50, 'CutoffFrequency',3000, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, audio3);
filteredaudio3_freq = fftshift(fft(filteredaudio3 ));
amplitude = abs(filteredaudio3_freq);
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
audio3_freq = fftshift(fft(y3));
amplitude = abs(audio3_freq);
f = (-N/2:N/2-1)*(Fs/N);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum 3');

%sideband filtering of input3 after modulation
lpf = designfilt('lowpassfir', 'FilterOrder', 500, 'CutoffFrequency',Fc, 'SampleRate', Fs);
filteredaudio3 = filter(lpf, y3);
filteredaudio3_freq = fftshift(fft(filteredaudio3));
amplitude = abs(filteredaudio3_freq);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After sidebandfilter 3');


%adding frequency signals to the same spectrum
res=filteredaudio1+filteredaudio2+filteredaudio3;
res_freq = fftshift(fft(res));
amplitude = abs(res_freq);
f = Fs*(-length(res)/2:length(res)/2-1)/length(res);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude of common Spectrum ');


%band pass filter for input1
bpf = designfilt('bandpassfir', 'FilterOrder', 50,'CutoffFrequency1',1000,'CutoffFrequency2', 9000, 'SampleRate', Fs);
res1 = filter(bpf, res);
output1 = fftshift(fft(res1));
amplitude = abs(output1);
f = Fs*(-length(res1)/2:length(res1)/2-1)/length(res1);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input1 before demodulation');

%demodulation input1
Fc=5000;
res1_demod=4*(res1).* cos(2*3.14*Fc* transpose(t));
%low pass filtering input1
lpf = designfilt('lowpassfir', 'FilterOrder', 6000, 'CutoffFrequency',4000, 'SampleRate', Fs);
res1_demod_filtered = filter(lpf, res1_demod);
output1_final = fftshift(fft(res1_demod_filtered));
amplitude = abs(output1_final);
f = Fs*(-length(output1_final)/2:length(output1_final)/2-1)/length(output1_final);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input1 final after demodulation');
% save output1
audiowrite("output1.wav",res1_demod_filtered,Fs);


%band pass filter for input2
bpf = designfilt('bandpassfir', 'FilterOrder', 50,'CutoffFrequency1',10000,'CutoffFrequency2', 18000, 'SampleRate', Fs);
res2 = filter(bpf, res);
output2 = fftshift(fft(res2));
amplitude = abs(output2);
f = Fs*(-length(res2)/2:length(res2)/2-1)/length(res2);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input2 before demodulation');

%demodulation input2
Fc=14000;
res2_demod=4*(res2).* cos(2*3.14*Fc* transpose(t));

%low pass filtering input2
lpf = designfilt('lowpassfir', 'FilterOrder', 6000, 'CutoffFrequency',4000, 'SampleRate', Fs);
res2_demod_filtered = filter(lpf, res2_demod);
output2_final = fftshift(fft(res2_demod_filtered));
amplitude = abs(output2_final);
f = Fs*(-length(output2_final)/2:length(output2_final)/2-1)/length(output2_final);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input2 final after demodulation');
% save output2
audiowrite("output2.wav",res2_demod_filtered,Fs);


%band pass filter for input3
bpf = designfilt('bandpassfir', 'FilterOrder', 50,'CutoffFrequency1',19000,'CutoffFrequency2', 26999, 'SampleRate', Fs);
res3 = filter(bpf, res);
output3 = fftshift(fft(res3));
amplitude = abs(output3);
f = Fs*(-length(res3)/2:length(res3)/2-1)/length(res3);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input3 before demodulation');

%demodulation input3
Fc=23000;
res3_demod=4*(res3).* cos(2*3.14*Fc* transpose(t));

%low pass filtering input3
lpf = designfilt('lowpassfir', 'FilterOrder', 6000, 'CutoffFrequency',4000, 'SampleRate', Fs);
res3_demod_filtered = filter(lpf, res3_demod);
output3_final = fftshift(fft(res3_demod_filtered));
amplitude = abs(output3_final);
f = Fs*(-length(output3_final)/2:length(output3_final)/2-1)/length(output3_final);
figure;
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('input3 final after demodulation');
% save output3
audiowrite("output3.wav",res3_demod_filtered,Fs);