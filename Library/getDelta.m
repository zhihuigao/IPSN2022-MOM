function [delta] = getDelta(angle, angleDot, params)
    soundVelocity = params.soundVelocity;
    sampleRate = params.sampleRate;
    coorOrig = params.micCoor;
    micNum = params.micNum;
    micDelay = params.micDelay;

    coor = zeros(3, micNum);
    coorDot = zeros(3, micNum);
    for micIdx = 1: micNum
        coor(:, micIdx) = angle2coor(angle, coorOrig(:, micIdx));
        coorDot(:, micIdx) = angle2coorDot(angle, angleDot, coorOrig(:, micIdx));
    end
    delay = coor2delay(coor, soundVelocity, sampleRate);
    doppler = coorDot2doppler(coorDot, soundVelocity);
    
    delta = delay ./ doppler + micDelay * sampleRate;
end

