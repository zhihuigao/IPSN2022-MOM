function [dataCont] = getContSample(dataDisc, index)
    interval = 20;
    
    currPos = index;
    minPos = max([round(currPos) - interval 1]);
    maxPos = min([round(currPos) + interval length(dataDisc)]);
    dataCont = 0;
    for dataIdx = minPos: maxPos
        sincInput = currPos - dataIdx;
        
        % sincOutput = sincFun(sincInput);
        if sincInput ~= 0
            sincOutput = sin(pi * sincInput) / pi / sincInput;
        else
            sincOutput = 1;
        end
            
        dataCont = dataCont + dataDisc(dataIdx) * sincOutput;
    end
end