function [rotateMatDot] = RotateMatDot(angle, angleDot, axis)
    C = cos(2 * pi / 360 * angle);
    S = sin(2 * pi / 360 * angle);

    switch axis
        case {'X', 'x'}
            rotateMatDot = [0 0 0; ...
                0 -S(1) -C(1); ...
                0 C(1) -S(1)];
        case {'Y', 'y'}
            rotateMatDot = [-S 0 C; ...
                0 0 0; ...
                -C 0 -S] * angleDot;
        case {'Z', 'z'}
            rotateMatDot = [-S -C 0; ...
                C -S 0; ...
                0 0 0] * angleDot;
        otherwise
            rotateMatDot = zeros(3, 3);
    end
end