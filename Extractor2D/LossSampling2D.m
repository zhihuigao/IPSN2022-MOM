function [lossMat, lossAngle] = LossSampling2D(wave, params)
    angleRange = params.angleRange;
    angleSampleNum = params.angleSampleNum;
    angleStep = (angleRange(2) - angleRange(1)) / angleSampleNum;
    
    lossMat = zeros(angleSampleNum + 1, 1);
    lossAngle = zeros(angleSampleNum + 1, 1);
    for angleIdx = 0: angleSampleNum
        angle = angleRange(1) + angleStep * angleIdx;
        lossAngle(angleIdx + 1) = angle;

        loss = calcLossPoint([0 0 angle], [0 0 0], wave, params);
        lossMat(angleIdx + 1) = loss;
    end
end