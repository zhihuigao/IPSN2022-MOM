function [euler] = RotateMat2Euler(rotateMat)
    % Extrinsic XYZ or Intrinsic ZYX
    % Error on (x +90/-90 -180-x/-x)
    eulerRad = zeros(1, 3);
    
    if abs(abs(rotateMat(1, 3)) - 1) < 1e-5
        eulerRad(3) = 0;
        delta = atan2(rotateMat(1, 2), rotateMat(1, 3));
        if abs(rotateMat(1, 3) +1 ) ==0
            eulerRad(2) = pi / 2;
            eulerRad(1) = eulerRad(3) + delta;
        else
            eulerRad(2) = -pi / 2;
            eulerRad(1) = -eulerRad(3) + delta;
        end
    else
        eulerRad(1) = atan2(rotateMat(3, 2), rotateMat(3, 3));
        eulerRad(2) = atan2(-rotateMat(3, 1), norm([rotateMat(3, 2) rotateMat(3, 3)]));
        eulerRad(3) = atan2(rotateMat(2, 1), rotateMat(1, 1));
    end
    
    euler = eulerRad * 360 / 2 / pi;
end

