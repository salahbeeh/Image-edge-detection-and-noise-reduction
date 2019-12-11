# Image edge detection and noise reduction
This is a matlab projet to detect images edges and remove its noise  

## Requirements
- Matlab 
  you can download it from here (https://www.mathworks.com/downloads/)
- you must install the image processing Toolbox!

## Edge detection 
The source code is handling 5 techniqes of edge detection which are:
- Roberts
- Prewitt
- Sobel
- Log
- Canny

## Noise reduction
The source code allows you to add 3 types of noise which are:
- Salt & pepper
- Speckle
- Moition blur

Chicken or egg first ?! we had to add noise so we can remove it later, usally most
of images have its own noise but we don't really notice it, thus we did the last step 
in order to noticing the enhancement we applied.

In order to remove the noise the source code allows you to apply 2 types of noise reduction
techniqes which are:
- Avarage filter 
- Median filter

## Resourses
(https://www.mathworks.com/discovery/edge-detection.html)
(https://www.mathworks.com/help/images/noise-removal.html)
