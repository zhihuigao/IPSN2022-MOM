function [sincOutput] = sincFun(sincInput)
    if sincInput ~= 0
        sincOutput = sin(pi * sincInput) / pi / sincInput;
    else
        sincOutput = 1;
    end
end