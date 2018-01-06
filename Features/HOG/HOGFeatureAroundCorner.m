function HOGFeatureAroundCorner()
%Read in the image of interest.
I2 = imread('GaTrong.jpg');

%Detect and select the strongest corners in the image.
corners   = detectFASTFeatures(rgb2gray(I2));
strongest = selectStrongest(corners,7);

%Extract HOG features.
[hog2, validPoints,ptVis] = extractHOGFeatures(I2,strongest);

%Display the original image with an overlay of HOG features around the strongest corners.
figure;
imshow(I2);
hold on;
plot(ptVis,'Color','blue');