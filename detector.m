clc;

img = imread("watermark.tif");
load('watermark.mat');

[a1,h1,v1,d1] = dwt2(img, "db2", "mode", "per");
[a2,h2,v2,d2] = dwt2(a1, "db2", "mode", "per");
[a3,h3,v3,d3] = dwt2(a2, "db2", "mode", "per");

alpha = 0.2;

disp(strcat("Watermark 1",detection(h3,w1,alpha)));
disp(strcat("Watermark 2",detection(d3,w2,alpha)));
disp(strcat("Watermark 3",detection(v3,w3,alpha)));

