%% Initialization

clear;
addpath(genpath('../Library/'));
params = getParams();

micUsed = params.micUsed;
fileName = '../data/ReSpeaker/example';
waveOrig = load([fileName '.mat']).wave(micUsed, :);
[~, waveLen] = size(waveOrig);

sampleRate = params.sampleRate;
readRate = params.readRate;
readNum = round(waveLen / sampleRate * readRate);
readSampleNum = params.readSampleNum;
sourceNum = params.sourceNum;

%% AoA Extraction

angleListY = zeros(readNum, sourceNum);
angleListZ = zeros(readNum, sourceNum);
for readIdx = 1: readNum
    waveNow = waveOrig(:, ...
        (readIdx - 1) * sampleRate / readRate + 1: (readIdx - 1) * sampleRate / readRate + readSampleNum);
    
    [angleNowY, angleNowZ] = multipleSource(waveNow, sourceNum, params);
    
    angleListY(readIdx, :) = angleNowY;
    angleListZ(readIdx, :) = angleNowZ;
end

save([fileName '_result.mat'], 'angleListY', 'angleListZ');

%% Visualization

angleListGtY = ones(readNum, 1) * [25 61];
angleListGtZ = ones(readNum, 1) * [291 101];

figure(1);
subplot(1, 2, 1);
plot((1: readNum) / readRate, angleListY, 'x', ...
    (1: readNum) / readRate, angleListGtY, 'linewidth', 2);
axis([0 readNum / readRate params.angleRangeY(1) params.angleRangeY(2)]);
legend('Est_1', 'Est_2', 'Gt_1', 'Gt_2');
title('Angle Y');
xlabel('Time (s)');
ylabel('AoA (Deg)');

subplot(1, 2, 2);
plot((1: readNum) / readRate, angleListZ, 'x', ...
    (1: readNum) / readRate, angleListGtZ, 'linewidth', 2);
axis([0 readNum / readRate params.angleRangeZ(1) params.angleRangeZ(2)]);
legend('Est_1', 'Est_2', 'Gt_1', 'Gt_2');
title('Angle Z');
xlabel('Time (s)');
ylabel('AoA (Deg)');