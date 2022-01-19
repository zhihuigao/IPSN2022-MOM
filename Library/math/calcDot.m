function [sampleDotList] = calcDot(sampleList, sampleRate)
    [groupNum, sampleLen] = size(sampleList);
    
    sampleDotList = zeros(groupNum, sampleLen);
    for sampleIdx = 2: sampleLen - 1
        sampleDotList(:, sampleIdx) = ...
            (sampleList(:, sampleIdx + 1) - sampleList(:, sampleIdx - 1)) / 2 * sampleRate;
    end
    sampleDotList(:, 1) = (sampleList(:, 2) - sampleList(:, 1)) * sampleRate;
    sampleDotList(:, end) = (sampleList(:, end) - sampleList(:, end - 1)) * sampleRate;
end

