function [rotateMat] = Euler2RotateMat(euler)
    % Extrinsic XYZ or Intrinsic ZYX
    rotateMatX = RotateMat(euler(1), 'X');
    rotateMatY = RotateMat(euler(2), 'Y');
    rotateMatZ = RotateMat(euler(3), 'Z');
    rotateMat = rotateMatZ * rotateMatY * rotateMatX;
end

