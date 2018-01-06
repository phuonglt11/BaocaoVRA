function BagofFeature()
%Read the image of interest.
I1 = imread('ThanhPhuong.jpg');

%Extract HOG features.
bag = bagOfFeatures(I1);

%Display the original image and the HOG features.
subplot(1,2,1);
imshow(I1);
subplot(1,2,2);
plot(bag);
end
bag = bagOfFeatures(imds);
img = readimage(imds,1);
featureVector = encode(bag,img);
figure
bar(featureVector)
title('Visual word occurrences')
xlabel('Visual word index')
ylabel('Frequency of occurrence')