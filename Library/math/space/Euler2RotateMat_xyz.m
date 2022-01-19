function [rotateMat] = Euler2RotateMat_xyz(euler)
    % Extrinsic ZYX or Intrinsic XYZ
    rotateMatX = RotateMat(euler(1), 'X');
    rotateMatY = RotateMat(euler(2), 'Y');
    rotateMatZ = RotateMat(euler(3), 'Z');
    rotateMat = rotateMatX * rotateMatY * rotateMatZ;
end

