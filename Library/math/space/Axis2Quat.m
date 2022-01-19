function [quat] = Axis2Quat(axis)
    if norm(axis) == 0
        quat = [1 0 0 0];
    else
        quat = zeros(1, 4);
        axisNorm = axis / norm(axis);
        axisAngle = norm(axis);
        axisAngleRad = axisAngle * 2 * pi / 360;
        
        quat(1) = cos(axisAngleRad / 2);
        quat(2: 4) = sin(axisAngleRad / 2) * axisNorm;
    end
end

