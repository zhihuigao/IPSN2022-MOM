function [rotateMat] = RotateMat(angle, axis)
    C = cos(2 * pi / 360 * angle);
    S = sin(2 * pi / 360 * angle);

    switch axis
        case {'X', 'x'}
            rotateMat = [1 0 0; ...
                0 C -S; ...
                0 S C];
        case {'Y', 'y'}
            rotateMat = [C 0 S; ...
                0 1 0; ...
                -S 0 C];
        case {'Z', 'z'}
            rotateMat = [C -S 0; ...
                S C 0; ...
                0 0 1];
        otherwise
            rotateMat = zeros(3, 3);
    end
end