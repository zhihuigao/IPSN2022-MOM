function [doppler] = coorDot2doppler(coorDot, soundVelocity)
    doppler = (soundVelocity + coorDot(1, :)) / soundVelocity;
end

