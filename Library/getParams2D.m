function [params] = getParams2D()
    % For User
    params.readRate = 100;
    params.readSampleNum = 100;
    
    % Loss Sampling
    params.angleRange = [0 180];
    params.angleDotRange = [-1000 1000];
    
    params.angleSampleNum = 30;
    params.angleDotSampleNum = 2;
    
    params.sincInterval = 10;
    
    % Gradient Descend
    params.iterNum = 50;
    params.learnRate = ones(1, params.iterNum) * 500;
    
    % For Microphone
    phoneSize = 0.152;
    micDelay = [0 0];
    
    micCoorTotal = [+phoneSize / 2 -phoneSize / 2 ; 0 0; 0 0];
    
    params.sampleRate = 48000;
    
    params.micUsed = [1 2];
    params.micNum = length(params.micUsed);
    params.micCoor = micCoorTotal(:, params.micUsed);
    params.micDelay = micDelay(params.micUsed);
        
    % Const
    params.soundVelocity = 340;
end
