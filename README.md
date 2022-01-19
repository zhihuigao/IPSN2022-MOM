# IPSN2022-MOM
A passive angle-of-arrival (AoA) extraction algorithm for ambient sound sources.

## 3D AoA Extraction
We provide the full version that supports 3D AoA extraction for multiple sound sources in the folder `Extractor`.\
You can test our example to get started.\
The data is collected by the 6-microphone array ReSpeaker.
In this example, we fix two sound sources and the microphone array for 5 seconds.

![alt text](/data/ReSpeaker/example.png)

1. Data Preparation: Check the source data `/data/ReSpeaker/example.wav` and run `/data/ReSpeaker/Audio2Mat.m` to create a temp file `/data/ReSpeaker/example.mat`.
2. Parameter Configuration: Configure the parameters in `/Library/getParams.m`, the instruction of which can be found [here](/Library/).
3. AoA Extraction: Run `/Extractor/main.m` to extract AoAs, which might take a few minutes. The extraction results are saved in `/data/ReSpeaker/example_result.mat`.

To implement your own scenario, you can copy your audio files to `/data/YOUR_DATA` and repeat the steps above.
Remenber to configure your own parameters in `getParams.m` and modify the file paths in `Audio2Mat.m` and `main.m`.

## 2D AoA Extraction
We also provide a simplified version for 2D AoA extraction with single sound source in the folder `Extractor2D`.\
You can test our example to get started.\
The data is collected by the two microphones in the commodity smartphone Pixel 4.
In this example, we fix a single sound source and turn the smartphone for 360 degrees in 15 seconds.

![alt text](/data/Pixel4/example.png)

1. Data Preparation: Check the source data `/data/Pixel4/example.wav` and run `/data/Pixel4/Audio2Mat.m` to create a temp file `/data/Pixel4/example.mat`.
2. Parameter Configuration: Configure the parameters in `/Library/getParams2D.m`, the instruction of which can be found here.
3. AoA Extraction: Run `/Extractor2D/main.m` to extract AoAs, which might take a few minutes. The extraction results are saved in `/data/Pixel4/example_result.mat`.

To implement your own scenario, you can copy your audio files to `/data/YOUR_DATA` and repeat the steps above.
Remenber to configure your own parameters in `getParams2D.m` and modify the file paths in `Audio2Mat.m` and `main.m`.

## Reference
If you find our work useful in your research, please consider citing our paper:\
`MOM: Microphone based 3D Orientation Measurement`

If you have any further questions, please feel free to contact us at :D\
zhihui.gao@duke.edu
