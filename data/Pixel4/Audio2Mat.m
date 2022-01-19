clear;

fileName = 'example';
[waveOrig, sampleRate] = audioread([fileName '.wav']);
waveOrig = waveOrig';
[~, waveLen] = size(waveOrig);
disp(waveLen / sampleRate);

timeLen = floor(waveLen / sampleRate);
offset = round(sampleRate * (waveLen / sampleRate - timeLen) / 2);
wave = waveOrig(:, offset + 1: offset + timeLen * sampleRate);
[micNum, waveLen] = size(wave);

save([fileName '.mat'], 'wave');