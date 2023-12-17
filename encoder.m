clc;

img = imread("peppers.tif");
load('watermark.mat');

[a1,h1,v1,d1] = dwt2(img, "db2", "mode", "per");
[a2,h2,v2,d2] = dwt2(a1, "db2", "mode", "per");
[a3,h3,v3,d3] = dwt2(a2, "db2", "mode", "per");

alpha = 0.2;

h3 = embedding(h3,w1,alpha);
d3 = embedding(d3,w2,alpha);
v3 = embedding(v3,w3,alpha);

dwt_inverse_L3 = idwt2(a3, h3, v3, d3, "db2", "mode", "per");
dwt_inverse_L2 = idwt2(dwt_inverse_L3, h2, v2, d2, "db2", "mode", "per");
dwt_inverse_L1 = idwt2(dwt_inverse_L2, h1, v1, d1, "db2", "mode", "per");

dwt_inverse = uint8(dwt_inverse_L1);

imshow(dwt_inverse);
imwrite(dwt_inverse, "watermark.tif");
