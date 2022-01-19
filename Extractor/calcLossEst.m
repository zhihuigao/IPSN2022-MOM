function [loss] = calcLossEst(angle, lossMat, paramDot, params)
    angleRangeY = params.angleRangeY;
    angleRangeZ = params.angleRangeZ;
    angleSampleNumY = params.angleSampleNumY;
    angleSampleNumZ = params.angleSampleNumZ;
    angleStepY = (angleRangeY(2) - angleRangeY(1)) / angleSampleNumY;
    angleStepZ = (angleRangeZ(2) - angleRangeZ(1)) / angleSampleNumZ;
    
    angleY = angle(1);
    angleZ = angle(2);
    sincInterval = params.sincInterval;
    angleMinY = round(angleY / angleStepY) - sincInterval;
    angleMaxY = round(angleY / angleStepY) + sincInterval;
    angleListY = angleMinY: angleMaxY;
    angleMinZ = round(angleZ / angleStepZ) - sincInterval;
    angleMaxZ = round(angleZ / angleStepZ) + sincInterval;
    angleListZ = angleMinZ: angleMaxZ;
    
    loss = 0;
    for angleListIdxY = 1: length(angleListY)
        for angleListIdxZ = 1: length(angleListZ)
            angleUnwarpY = angleListY(angleListIdxY);
            angleUnwarpZ = angleListZ(angleListIdxZ);

            sincOutput = 1;

            angleSincInputY = angleY / angleStepY - angleUnwarpY;
            if paramDot(1) == 0
                sincOutput = sincOutput * sincFun(angleSincInputY);
            else
                sincOutput = sincOutput * sincDotFun(angleSincInputY) / angleStepY;
            end
            angleSincInputZ = angleZ / angleStepZ - angleUnwarpZ;
            if paramDot(2) == 0
                sincOutput = sincOutput * sincFun(angleSincInputZ);
            else
                sincOutput = sincOutput * sincDotFun(angleSincInputZ) / angleStepZ;
            end
            
            angleWarpY = mod(angleUnwarpY, 4 * angleSampleNumY);
            angleWarpZ = mod(angleUnwarpZ, angleSampleNumZ);
            if(angleWarpY > 2 * angleSampleNumY)
                angleWarpY = 4 * angleSampleNumY - angleWarpY;
            end
            if(angleWarpY > angleSampleNumY)
                angleWarpY = 2 * angleSampleNumY - angleWarpY;
                if(angleWarpZ >= angleSampleNumZ / 2)
                    angleWarpZ = angleWarpZ - angleSampleNumZ / 2;
                else
                    angleWarpZ = angleWarpZ + angleSampleNumZ / 2;
                end
            end

            loss = loss + lossMat(angleWarpY + 1, angleWarpZ + 1) * sincOutput;
        end
    end
end