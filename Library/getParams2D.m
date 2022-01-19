function [params] = getParams2D()
    % To configure the parameters in your implementation, 
    %     - *** parameters must be modified to your scenarios,
    %     - * parameters can be either directly used or customized, where
    %     the default value is optimized,
    %     - other parameters is not recommended to modified.
    % If you have any further questions, please feel free to contact us :)
    %     zhihui.gao@duke.edu

    % AoA Readout Parameters
    %     *readRate:
    %         The readout rate of the AoA in Hz.
    %     *readSampleNum:
    %         The length of the time window in sample.
    %         % A larger readSampleNum brings higher accuracy with larger
    %         computation cost.
    %         % We suggest the the value of readSampleNum:
    %         %     readSampleNum <= sampleRate / readRate
    params.readRate = 100;
    params.readSampleNum = 100;
    
    % Microphone Array Parameters
    phoneSize = 0.152;
    micDelay = [0 0];
    micCoorTotal = [+phoneSize / 2 -phoneSize / 2 ; 0 0; 0 0];
    %     ***sampleRate:
    %         The sampling rate of the microphones.
    %         % The sampling rate is recommended to be greater than 16 kHz.
    %     *micUsed:
    %         The set of used microphones on the microphone array.
    %         % Usually we use all the microphones. If you find one of the
    %         microphone does not work well, you can remove it in the set
    %         micUsed.
    %     micNum:
    %         The number of used microphones.
    %         % Do not modify this item.
    %     ***micCoor:
    %         The coordinate of each microphone on the array.
    %         % Each coordinate is a 3-D vector, which represents the X, Y,
    %         Z coordinates, respectively. Specifically, for a plane
    %         microphone array, you can set the Z coordinates as 0s.
    %         % You can modify this item by rewriting the codes above.
    %     ***micDelay:
    %         The delay of each microphone in second.
    %         % Without a perfect synchronization, each microphone tend to
    %         has its own delay, which should be calibrated and removed
    %         before calculating AoA.
    params.sampleRate = 48000;
    params.micUsed = [1 2];
    params.micNum = length(params.micUsed);
    params.micCoor = micCoorTotal(:, params.micUsed);
    params.micDelay = micDelay(params.micUsed);
    
    % Computation Cost Reduction Parameters
    %     angleRange:
    %         The range of the angle for AoA in deg.
    %         % For most of the microphone array, AoA is extracted in a
    %         semi-space. Thus, the angleRange is from 0 to 180 deg.
    %     angleDotRange: (Deprecated)
    %         The range of angular velocity in deg/s.
    %         % We found angular velocity can hardly influence the AoA
    %         extraction. Thus, we remove this item.
    params.angleRange = [0 180];
    params.angleDotRange = [-1000 1000];
    %     *angleSampleNum:
    %         The number of samples used in angle.
    %         % A larger angleSampleNum brings higher accuracy with
    %         larger computation cost.
    %     angleDotSampleNum: (Deprecated)
    %         The number of samples used in angular velocity.
    %         % We found angular velocity can hardly influence the AoA
    %         extraction. Thus, we remove this item.
    params.angleSampleNum = 30;
    params.angleDotSampleNum = 2;
    %     *sincInterval:
    %         The number of sinc terms used in Whittaker-Shannon
    %         interpolation formula.
    %         % A larger sincInterval brings higher accuracy with larger
    %         computation cost.
    params.sincInterval = 10;
    
    % Gradient Descent Parameters
    %     iterNum:
    %         The iteration number of the gradient descent.
    %         % The gradient descent is not the bottleneck of the AoA
    %         extraction. Thus, reducing iterNum does not reduce the
    %         computation cost.
    %     learnRateY/Z:
    %         The learning rate.
    params.iterNum = 50;
    params.learnRate = ones(1, params.iterNum) * 500;
        
    % Constant Parameters
    %     soundVelocity:
    %         The velocity of the sound, which is 340 m/s.
    params.soundVelocity = 340;
end
