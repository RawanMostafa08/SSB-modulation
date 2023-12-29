% recObj = audiorecorder
% disp("Begin speaking.")
% recordblocking(recObj,10);
% audioData = getaudiodata(recObj);
% fileName = 'input3.wav';
% audiowrite(fileName, audioData, recObj.SampleRate);
% play(recObj);
% 
% disp("End of recording.")
% play(recObj);

[audio1, Fs] = audioread('input1.wav');
disp(Fs)
pause(5)
sound(audio1, Fs);
t = (0:length(audio1)-1)/Fs;
figure;
plot(t, audio1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal Waveform');

N = length(audio1);
f = (-N/2:N/2-1)*(Fs/N);
audio_freq = fftshift(fft(audio1));
amplitude = abs(audio_freq);
phase = angle(audio_freq); 
figure;
subplot(2, 1, 1);
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Before filter');

cutoffFreq = 3000;
filterOrder = 15;
designSpecs = fdesign.lowpass('N,F3dB', filterOrder, cutoffFreq, Fs);
lowpassFilter = design(designSpecs, 'butter');
filteredaudio = filter(lowpassFilter, audio1);
pause(10)
sound(filteredaudio, Fs);

filteredaudio_freq = fftshift(fft(filteredaudio));
amplitude = abs(filteredaudio_freq);
phase = angle(filteredaudio_freq);
subplot(2, 1, 2);
plot(f, amplitude);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('After filter');
