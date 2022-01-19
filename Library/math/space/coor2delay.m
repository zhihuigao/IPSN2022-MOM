function [delay] = coor2delay(coor, soundVelocity, sampleRate)
    delay = -coor(1, :) / soundVelocity * sampleRate;
end

