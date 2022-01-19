function [lossMat, lossAngle] = lossSampling(wave, params)
    angleRangeY = params.angleRangeY;
    angleRangeZ = params.angleRangeZ;
    angleSampleNumY = params.angleSampleNumY;
    angleSampleNumZ = params.angleSampleNumZ;
    angleStepY = (angleRangeY(2) - angleRangeY(1)) / angleSampleNumY;
    angleStepZ = (angleRangeZ(2) - angleRangeZ(1)) / angleSampleNumZ;
    
    lossMat = zeros(angleSampleNumY + 1, angleSampleNumZ + 1);
    lossAngle = zeros(angleSampleNumY + 1, angleSampleNumZ + 1, 2);
    for angleIdxY = 0: angleSampleNumY
        for angleIdxZ = 0: angleSampleNumZ
            angleY = angleRangeY(1) + angleStepY * angleIdxY;
            angleZ = angleRangeZ(1) + angleStepZ * angleIdxZ;
            lossAngle(angleIdxY + 1, angleIdxZ + 1, :) = [angleY angleZ];
            
            loss = calcLossPoint([0 angleY angleZ], [0 0 0], wave, params);
            lossMat(angleIdxY + 1, angleIdxZ + 1) = sum(loss);
        end
    end
end