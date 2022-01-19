function [params] = getParams()
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
    %     ***sourceNum: 
    %         The number of multipaths extracted in one time window.
    params.readRate = 100;
    params.readSampleNum = 100;
    params.sourceNum = 2;
    
    % Microphone Array Parameters
    micNumTotal = 6;
    micCoorDeg = 270 - 60 * (1: micNumTotal); 
    micCoorRad = 2 * pi / 360 * micCoorDeg;
    micCoorTotal = [4.6e-2 * cos(micCoorRad); ...
       4.6e-2 * sin(micCoorRad); ...
       zeros(1, micNumTotal)];
    micDelay = [0 0 0 0 0 0];
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
    params.micUsed = 1: micNumTotal;
    params.micNum = length(params.micUsed);
    params.micCoor = micCoorTotal(:, params.micUsed);
    params.micDelay = micDelay(params.micUsed);
        
    % Computation Cost Reduction Parameters
    %     angleRangeY/Z:
    %         The range of the spatial angle for AoA around Y/Z axis in
    %         deg.
    %         % angleRangeY is also termed as the elevation angle.
    %         % angleRangeZ is also termed as the azimuth angle.
    %         % For most of the microphone array, AoA is extracted in a
    %         semi-space. Thus, the angleRangeY is from 0 to 90 deg instead
    %         of -90 to 90 deg.
    %     angleDotRangeY/Z: (Deprecated)
    %         The range of angular velocity around Y/Z axis in deg/s.
    %         % We found angular velocity can hardly influence the AoA
    %         extraction. Thus, we remove this item.
    params.angleRangeY = [0 90];
    params.angleRangeZ = [0 360];
    params.angleDotRangeY = [-500 500];
    params.angleDotRangeZ = [-1000 1000];
    %     *angleSampleNumY/Z:
    %         The number of samples used in angle around Y/Z axis.
    %         % 
    %     angleDotSampleNumY/Z: (Deprecated)
    %         The number of samples used in angular velocity around Y/Z
    %         axis.
    %         Warning: The angleSampleNumZ must be even!
    %         % A larger angleSampleNumY/Z brings higher accuracy with
    %         larger computation cost.
    %         % We found angular velocity can hardly influence the AoA
    %         extraction. Thus, we remove this item.
    params.angleSampleNumY = 5;
    params.angleSampleNumZ = 10;
    params.angleDotSampleNumY = 2;
    params.angleDotSampleNumZ = 4;
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
    %         The learning rate along the Y/Z axis.
    params.iterNum = 50;
    params.learnRateY = ones(1, params.iterNum) * 500;
    params.learnRateZ = ones(1, params.iterNum) * 500;
        
    % Constant Parameters
    %     soundVelocity:
    %         The velocity of the sound, which is 340 m/s.
    params.soundVelocity = 340;
end
