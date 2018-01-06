function HOGFeatureSVM()
%% Load Image Information from ATT AnimalData Directory
faceDatabase = imageSet('AnimalData','recursive');


%% Split Database into Training & Test Sets 4680
[training,test] = partition(faceDatabase,[0.8 0.2]);


%% Extract HOG Features for training set 
% 26244 = extractHOGFeatures(read(training(i),j)). L?u y?
trainingFeatures = zeros(size(training,2)*training(1).Count,26244);
TrainingfeatureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainingFeatures(TrainingfeatureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{TrainingfeatureCount} = training(i).Description;    
        TrainingfeatureCount = TrainingfeatureCount + 1;
    end
    AnimaltraingIndex{i} = training(i).Description;
end

%% Create 40 class classifier using fitcecoc 
MdSVM = fitcecoc(trainingFeatures,trainingLabel);

%% Extract HOG Features for test set 
% X = extractHOGFeatures(read(training(i),j)). Luy y: X = 26244
testFeatures = zeros(size(test,2)*test(1).Count,26244);
TestfeatureCount = 1;
for i=1:size(test,2)
    for j = 1:test(i).Count
        testFeatures(TestfeatureCount,:) = extractHOGFeatures(read(test(i),j));
        testLabel{TestfeatureCount} = test(i).Description;    
        TestfeatureCount = TestfeatureCount + 1;
    end
    AnimaltestIndex{i} = test(i).Description;
end
%% Classify Test Images and count of number of sample
predictedLabels = predict(MdSVM,testFeatures);
lblPredicted = predictedLabels';
nResult = strcmp(testLabel,lblPredicted);
nCount = sum(nResult);
nTest = size(testLabel,2);
accuracy = nCount/nTest
fprintf('\n So luong mau test :%d\n', nTest)
fprintf('\n So luong mau dung :%d\n', nCount)
fprintf('\n Ti le mau dung :%d\n', accuracy)

%% Display five sample test images with their predicted labels.
animal = 6;
idx = [1 13 25 37 49];
figure;
for i = 1:numel(idx)
    label = predictedLabels(idx(i));
    lbl = label';
    subplot(2,3,i);imshow(read(test(i),animal));
    title(char(lbl));
end
end


