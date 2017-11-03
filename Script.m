clear,
close all
clc
%% load the image and calculate the energy map
img = imread('lake.jpg');
Img_d = double(img)/255;
EMap = myEnergyFunc(Img_d);
figure,
imshow(EMap)
title('Energy Map')

%% resize the image
rC = 100;
rR = 100;

rImg = mySeamCarveResize(Img_d,rC,rR);
figure
imshow(rImg)
