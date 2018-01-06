function AlexnetKnn()
%% Call libraly of convolutional neural network
convnet = alexnet;
convnet.Layers

%% Set up data_training
%Load Image Data Train

rootFolderTrain = fullfile('trainingSet');
categories = {'Vit', 'Ga', 'Heo', 'Cho', 'Meo'};
imgeTrainAll = imageDatastore(fullfile(rootFolderTrain, categories), 'LabelSource', 'foldernames');

% Extract features from the training set images
featureLayer = 'fc7';
trainingFeatures = activations(convnet, imgeTrainAll, featureLayer);
trainingLabels = imgeTrainAll.Labels;

%% Train a model
classifier = fitcknn(trainingFeatures,trainingLabels);

%% Set up data_test
%Load Image Data Test

rootFolderTest = fullfile('testSet');
categories = {'Vit', 'Ga', 'Heo', 'Cho', 'Meo'};
imgeTestAll = imageDatastore(fullfile(rootFolderTest, categories), 'LabelSource', 'foldernames');

% Extract features from the training set images
featureLayer = 'fc7';
testFeatures = activations(convnet, imgeTestAll, featureLayer);
testLabels = imgeTestAll.Labels;

%% Classify Test Images and count of number of sample
predictedLabels = predict(classifier,testFeatures);
nResult = (predictedLabels == testLabels);
nCount = sum(nResult);
accuracy = mean(predictedLabels == testLabels)
fprintf('\n So luong mau test :50')
fprintf('\n So luong mau dung :%d\n', nCount)
fprintf('\n Ti le mau dung :%d\n', accuracy)

%% Display four sample test images with their predicted labels.
idx = [1 13 25 37 49];
figure
for i = 1:numel(idx)
    subplot(2,3,i)
    I = readimage(imgeTestAll,idx(i));
    label = predictedLabels(idx(i));
    imshow(I)
    title(char(label))
end
end
