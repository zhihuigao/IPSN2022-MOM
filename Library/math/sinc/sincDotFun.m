function [sincDotOutput] = sincDotFun(sincDotInput)
    if sincDotInput ~= 0
        sincDotOutput = (pi * cos(pi * sincDotInput) * sincDotInput - ...
            sin(pi * sincDotInput)) / (pi * sincDotInput ^ 2);
    else
        sincDotOutput = 0;
    end
end

