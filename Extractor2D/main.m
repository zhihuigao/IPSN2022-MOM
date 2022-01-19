%% Initialization

clear;
addpath(genpath('../Library/'));
params = getParams2D();

micUsed = params.micUsed;
fileName = '../data/Pixel4/example';
waveOrig = load([fileName '.mat']).wave(micUsed, :);
[~, waveLen] = size(waveOrig);

sampleRate = params.sampleRate;
readRate = params.readRate;
readNum = round(waveLen / sampleRate * readRate);
readSampleNum = params.readSampleNum;

%% AoA Extraction

angleList = zeros(readNum, 1);
for readIdx = 1: readNum
    waveNow = waveOrig(:, ...
        (readIdx - 1) * sampleRate / readRate + 1: (readIdx - 1) * sampleRate / readRate + readSampleNum);
    
    angleNow = ExtractSource2D(waveNow, params);
    
    angleList(readIdx, :) = angleNow;
end

save([fileName '_result.mat'], 'angleList');

%% Visualization

figure(1);
plot((1: readNum) / readRate, angleList);
axis([0 readNum / readRate 0 180]);
xlabel('Time (s)');
ylabel('Angle (Deg)');