function [loss] = calcLossPoint(angle, angleDot, wave, params)
    [micNum, waveLen] = size(wave);
    
    delta = getDelta(angle, angleDot, params);

    waveDelta = zeros(micNum, waveLen);
    for micIdx = 1: micNum
        for waveIdx = 1: waveLen
            waveDelta(micIdx, waveIdx) = getContSample(wave(micIdx, :), waveIdx + delta(micIdx));
        end
    end

    waveDeltaPower = sqrt(sum(waveDelta.^2, 2));
    waveAvg = mean(waveDelta, 1);
    waveAvgPower = sqrt(sum(waveAvg.^2));
    loss = 0;
    for micIdx = 1: micNum
        loss = loss - ...
            dot(waveDelta(micIdx, :), waveAvg) / waveDeltaPower(micIdx) / waveAvgPower;
    end
    loss = loss / micNum;
end