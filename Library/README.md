# Configure your own parameters
If you are running the given examples, you can directly run `main.m` without editting anything.\
If you are implementing your own scenarios, you should configure your own parameters in file `getParams.m` or `getParam2D.m` before running `main.m`.

To configure the parameters in your implementation,
* *** parameters must be modified to your scenarios,
* \* parameters can be either directly used or customized, where the default value is optimized,
* Other parameters is not recommended to modified.

## AoA Readout Parameters
* \* `readRate`:
    The readout rate of the AoA in Hz.
    
* \* `readSampleNum`:
    The length of the time window in sample.
    A larger `readSampleNum` brings higher accuracy with larger
    computation cost.
    We suggest the the value of `readSampleNum`: `readSampleNum <= sampleRate / readRate`
    
* *** `sourceNum`: 
    The number of multipaths extracted in one time window.

## Microphone Array Parameters
* *** `sampleRate`:
    The sampling rate of the microphones. The sampling rate is recommended to be greater than 16 kHz.
    
* \* `micUsed`:
    The set of used microphones on the microphone array.
    Usually we use all the microphones. If you find one of the microphone does not work well, you can remove it in the set `micUsed`.
    
* micNum:
    The number of used microphones. Do not modify this item.
    
* *** `micCoor`:
    The coordinate of each microphone on the array.
    Each coordinate is a 3-D vector, which represents the X, Y, Z coordinates, respectively. Specifically, for a plane microphone array, you can set the Z coordinates as 0s.

* *** `micDelay`:
    The delay of each microphone in second.
    Without a perfect synchronization, each microphone tend to has its own delay, which should be calibrated and removed before calculating AoA.

## Computation Cost Reduction Parameters
* `angleRangeY/Z`:
    The range of the spatial angle for AoA around Y/Z axis in deg.
    `angleRangeY` is also termed as the elevation angle.
    `angleRangeZ` is also termed as the azimuth angle.
    For most of the microphone array, AoA is extracted in a semi-space. Thus, the `angleRangeY` is from 0 to 90 deg instead of -90 to 90 deg.
    
* `angleDotRangeY/Z`: (Deprecated)
    The range of angular velocity around Y/Z axis in deg/s.
    We found angular velocity can hardly influence the AoA extraction. Thus, we remove this item.
    
* \* `angleSampleNumY/Z`:
    The number of samples used in angle around Y/Z axis.
    
* `angleDotSampleNumY/Z`: (Deprecated)
    The number of samples used in angular velocity around Y/Z axis.
    Warning: The `angleSampleNumZ` must be even!
    A larger `angleSampleNumY/Z` brings higher accuracy with larger computation cost.
    We found angular velocity can hardly influence the AoA extraction. Thus, we remove this item.
    
* \* `sincInterval`:
    The number of sinc terms used in Whittaker-Shannon interpolation formula.
    A larger `sincInterval` brings higher accuracy with larger computation cost.

## Gradient Descent Parameters
* `iterNum`:
    The iteration number of the gradient descent.
    The gradient descent is not the bottleneck of the AoA extraction. Thus, reducing `iterNum` does not reduce the computation cost.
    
* `learnRateY/Z`:
    The learning rate along the Y/Z axis.

## Constant Parameters
* `soundVelocity`:
    The velocity of the sound, which is 340 m/s.
