function [angleDiff] = RotateMatDiff(rotateMat_1, rotateMat_2)
    rotateMatDiff = rotateMat_1 / rotateMat_2;
    angleDiffRad = acos((trace(rotateMatDiff) - 1) / 2);
    angleDiff = angleDiffRad / 2 / pi * 360;
end

