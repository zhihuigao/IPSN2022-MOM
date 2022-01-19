function [coor] = angle2coor(angle, coorOrig)
    rotateMatX = RotateMat(angle(1), 'X');
    rotateMatY = RotateMat(angle(2), 'Y');
    rotateMatZ = RotateMat(angle(3), 'Z');
    rotateMat = rotateMatX * rotateMatY * rotateMatZ;

    coor = rotateMat * coorOrig;
end

%     % ZYX extrinsic euler angle
%     rotate(1, 1) = C(2) * C(3);
%     rotate(1, 2) = - C(2) * S(3);
%     rotate(1, 3) = S(2);
%     rotate(2, 1) = C(1) * S(3) + C(3) * S(1) * S(2);
%     rotate(2, 2) = C(1) * C(3) - S(1) * S(2) * S(3);
%     rotate(2, 3) = - C(2) * S(1);
%     rotate(3, 1) = S(1) * S(3) - C(1) * C(3) * S(2);
%     rotate(3, 2) = C(3) * S(1) + C(1) * S(2) * S(3);
%     rotate(3, 3) = C(1) * C(2);

%     % XYZ extrinsic euler angle
%     rotate(1, 1) = C(1) * C(2);
%     rotate(1, 2) = C(1) * S(2) * S(3) - C(3) * S(1);
%     rotate(1, 3) = S(1) * S(3) + C(1) * C(3) * S(2);
%     rotate(2, 1) = C(2) * S(1);
%     rotate(2, 2) = C(1) * C(3) + S(1) * S(2) * S(3);
%     rotate(2, 3) = C(3) * S(1) * S(2) - C(1) * S(3);
%     rotate(3, 1) = - S(2);
%     rotate(3, 2) = C(2) * S(3);
%     rotate(3, 3) = C(2) * C(3);