function [axis] = RotateMat2Axis(rotateMat)
    angleRad = acos((trace(rotateMat) - 1) / 2);
    angle = angleRad / 2 / pi * 360;
    [axisNormList, ~] = eig(rotateMat);
    for axisIdx = 1: 3
        if imag(axisNormList(:, axisIdx)) == [0 0 0]
            axisNorm = axisNormList(:, axisIdx);
        end
    end
    
    axisPos = axisNorm * angle;
    axisPosDelta = sum(sum((Axis2RotateMat(axisPos) - rotateMat).^2));
    axisNeg = -axisNorm * angle;
    axisNegDelta = sum(sum((Axis2RotateMat(axisNeg) - rotateMat).^2));
    if axisPosDelta < axisNegDelta
        axis = axisPos;
    else
        axis = axisNeg;
    end
end