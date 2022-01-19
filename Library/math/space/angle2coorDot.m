function [coorDot] = angle2coorDot(angle, angleDot, coorOrig)
    rotateMatX = RotateMat(angle(1), 'X');
    rotateMatY = RotateMat(angle(2), 'Y');
    rotateMatZ = RotateMat(angle(3), 'Z');
    rotateMatDotX = RotateMatDot(angle(1), angleDot(1), 'X');
    rotateMatDotY = RotateMatDot(angle(2), angleDot(2), 'Y');
    rotateMatDotZ = RotateMatDot(angle(3), angleDot(3), 'Z');
    
    coorDot = rotateMatDotX * rotateMatY * rotateMatZ * coorOrig + ...
        rotateMatX * rotateMatDotY * rotateMatZ * coorOrig + ...
        rotateMatX * rotateMatY * rotateMatDotZ * coorOrig;
end