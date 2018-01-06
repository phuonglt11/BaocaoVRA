function LBPFeature()
%Read in a sample image and convert it to grayscale.
I = imread('ThanhPhuong.jpg');
I = rgb2gray(I);

%Extract unnormalized LBP features so that you can apply a custom normalization.
lbpFeatures = extractLBPFeatures(I,'CellSize',[64 64],'Normalization','None');

%Reshape the LBP features into a number of neighbors -by- number 
% of cells array to access histograms for each individual cell.
numNeighbors = 8;
numBins = numNeighbors*(numNeighbors-1)+3;
lbpCellHists = reshape(lbpFeatures,numBins,[]);

%Normalize each LBP cell histogram using L1 norm.
lbpCellHists = bsxfun(@rdivide,lbpCellHists,sum(lbpCellHists));

%Reshape the LBP features vector back to 1-by- N feature vector.
lbpFeatures = reshape(lbpCellHists,1,[]);

%Display the original image and the LBP features.
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
plot(lbpFeatures);
end