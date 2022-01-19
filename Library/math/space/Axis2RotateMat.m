function [rotateMat] = Axis2RotateMat(axis)
    if norm(axis) == 0
        rotateMat = eye(3);
    else
        axisNorm = axis / norm(axis);
        axisNormMat = Vec2Mat(axisNorm);
        axisAngle = norm(axis);
        axisAngleRad = axisAngle * 2 * pi / 360;

        rotateMat_1 = eye(3);
        rotateMat_2 = sin(axisAngleRad) * axisNormMat;
        rotateMat_3 = (1 - cos(axisAngleRad)) * axisNormMat * axisNormMat;
        rotateMat = rotateMat_1 + rotateMat_2 + rotateMat_3;
    end
end