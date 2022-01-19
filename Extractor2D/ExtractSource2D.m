function [angle] = ExtractSource2D(wave, params)
    iterNum = params.iterNum;
    learnRate = params.learnRate;

    [lossMat, lossAngle] = LossSampling2D(wave, params);
    [~, minIdx] = min(lossMat(1: end - 1));
    angle = lossAngle(minIdx);
    
    for iterIdx = 1: iterNum
        delta = CalcLossEst2D(angle, lossMat, 1, params);
        angle = angle - learnRate(iterIdx) * delta;
    end
end