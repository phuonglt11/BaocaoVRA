function AlexNetFeature()

%Read in the image of interest.
I1 = imread('ThanhPhuong.jpg');
I2 = rgb2gray(I1);
arrPointI = detectHarrisFeatures(I2);
[arrfeatureI, arrValidPointI] = extractFeatures(I2, arrPointI);
figure;
imshow(I2);
arrSubValidPointI = arrValidPointI.selectStrongest(20);
hold on;
plot(arrSubValidPointI);




end