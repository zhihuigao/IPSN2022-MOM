function [waveNew] = removeSource(waveOld, angle, angleDot, params)
    [micNum, waveLen] = size(waveOld);
    
    delta = getDelta(angle, angleDot, params);
    
    waveDelta = zeros(micNum, waveLen);
    for micIdx = 1: micNum
        for waveIdx = 1: waveLen
            waveDelta(micIdx, waveIdx) = getContSample(waveOld(micIdx, :), waveIdx + delta(micIdx));
        end
    end
    waveAvg = mean(waveDelta, 1);
    
    waveNew = zeros(micNum, waveLen);
    for micIdx = 1: micNum
        for waveIdx = 1: waveLen
            waveNew(micIdx, waveIdx) = waveOld(micIdx, waveIdx) - ...
                getContSample(waveAvg, waveIdx - delta(micIdx));
        end
    end
end

