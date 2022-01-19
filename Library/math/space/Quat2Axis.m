function [axis] = Quat2Axis(quat)
    quatReal = quat(1);
    quatImag = norm(quat(2: 4));
    
    if quatImag == 0
        axis = [0 0 0];
    else
        angleNorm = quat(2: 4) / norm(quat(2: 4));
        angleAxisRad = 2 * acos(quatReal);
        angleAxis = angleAxisRad * 360 / 2 / pi;
        
        axis = angleNorm * angleAxis;
    end
end

