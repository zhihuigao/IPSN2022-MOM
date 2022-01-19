function [angleY, angleZ] = multipleSource(waveTotal, sourceNum, params)
    angleY = zeros(1, sourceNum);
    angleZ = zeros(1, sourceNum);
    
    wave = waveTotal;
    for sourceIdx = 1: sourceNum
        [angleNowY, angleNowZ] = extractSource(wave, params);
        wave = removeSource(wave, [0 angleNowY angleNowZ], [0 0 0], params);
        
        angleY(sourceIdx) = angleNowY;
        angleZ(sourceIdx) = angleNowZ;
    end
end

