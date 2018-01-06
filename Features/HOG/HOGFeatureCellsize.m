function HOGFeatureCellsize()
%Read the image of interest.
I1 = imread('ThanhPhuong.jpg');

%Extract HOG features.
[hog1,visualization] = extractHOGFeatures(I1,'CellSize',[128 128]);

%Display the original image and the HOG features.
subplot(1,2,1);
imshow(I1);
subplot(1,2,2);
plot(visualization);
end