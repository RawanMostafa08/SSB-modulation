recObj = audiorecorder
disp("Begin speaking.");
recordblocking(recObj,10);
audioData = getaudiodata(recObj);
fileName = 'input1.wav';
audiowrite(fileName, audioData, recObj.SampleRate);
play(recObj);

disp("End of recording.");
play(recObj);
