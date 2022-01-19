function [angleY, angleZ] = extractSource(wave, params)
    iterNum = params.iterNum;
    learnRateY = params.learnRateY;
    learnRateZ = params.learnRateZ;

    [lossMat, lossAngle] = lossSampling(wave, params);
    lossMatMin = min(min(lossMat(1: end - 1, 1: end - 1)));
    [minIdxY, minIdxZ] = find(lossMat(1: end - 1, 1: end - 1) == lossMatMin);
    angleY = lossAngle(minIdxY, minIdxZ, 1);
    angleZ = lossAngle(minIdxY, minIdxZ, 2);
    
    for iterIdx = 1: iterNum
        deltaY = calcLossEst([angleY angleZ], lossMat, [1 0], params);
        deltaZ = calcLossEst([angleY angleZ], lossMat, [0 1], params);
        angleY = angleY - learnRateY(iterIdx) * deltaY;
        angleZ = angleZ - learnRateZ(iterIdx) * deltaZ;
    end
end