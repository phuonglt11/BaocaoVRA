function CreateABagOfVisualWordsFeature()

%% Create a Bag of Visual Words
% Load two image sets.
setDir  = fullfile('imageSets');
imgSets = imageSet(setDir,'recursive');

%% Pick the first two images from each image set to create training sets.
trainingSets = partition(imgSets,2);
 
%% Create the bag of features.
bag = bagOfFeatures(trainingSets,'Verbose',false);

% Compute histogram of visual word occurrences for one of the images. 
% Store the histogram as feature vector.
img = read(imgSets(1),1);
featureVector = encode(bag,img);

%% Display a figure for Bag of Visual Words
figure
bar(featureVector)
title('Visual word occurrences')
xlabel('Visual word index')
ylabel('Frequency of occurrence')

end