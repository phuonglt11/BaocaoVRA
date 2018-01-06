function Bag_ofWords
%% Load Image Data Train
rootFolder = fullfile('DataTrain');
categories = {'Vit', 'Ga', 'Heo', 'Cho', 'Meo'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
%---------
tbl01 = countEachLabel(imds)
minSetCount = min(tbl01 {:, 2});
imds = splitEachLabel(imds, minSetCount, 'randomize');
tbl02 = countEachLabel(imds)
bag = bagOfFeatures(imds);
img = readimage(imds,1);
featureVector = encode(bag,img);

% -------------------
categoryClassifier = trainImageCategoryClassifier(imds, bag);
% -------------------
rootFolder = fullfile('DataTest');
categories = {'Vit', 'Ga', 'Heo', 'Cho', 'Meo'};
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
tbl01 = countEachLabel(imds)
confMatrixTest = evaluate(categoryClassifier, imds);
mean(diag(confMatrixTest));
end