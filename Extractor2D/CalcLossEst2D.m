function [loss] = CalcLossEst2D(angle, lossMat, paramDot, params)
    angleRange = params.angleRange;
    angleSampleNum = params.angleSampleNum;
    angleStep = (angleRange(2) - angleRange(1)) / angleSampleNum;
    
    sincInterval = params.sincInterval;
    angleMin = round(angle / angleStep) - sincInterval;
    angleMax = round(angle / angleStep) + sincInterval;
    angleList = angleMin: angleMax;
    
    loss = 0;
    for angleListIdx = 1: length(angleList)
        angleUnwarp = angleList(angleListIdx);

        sincOutput = 1;

        angleSincInput = angle / angleStep - angleUnwarp;
        if paramDot == 0
            sincOutput = sincOutput * sincFun(angleSincInput);
        else
            sincOutput = sincOutput * sincDotFun(angleSincInput) / angleStep;
        end

        angleWarp = mod(angleUnwarp, 2 * angleSampleNum);
        if(angleWarp > angleSampleNum)
            angleWarp = 2 * angleSampleNum - angleWarp;
        end
        
        loss = loss + lossMat(angleWarp + 1) * sincOutput;
    end
end