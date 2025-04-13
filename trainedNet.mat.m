% Load images
imds = imageDatastore('BATTERY', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% Resize images to 64x64 and split data
imds.ReadFcn = @(filename)imresize(imread(filename), [64 64]);
[trainData, testData] = splitEachLabel(imds, 0.8, 'randomized');

% Define a custom CNN
layers = [
    imageInputLayer([64 64 3])
    
    convolution2dLayer(3, 8, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 16, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2, 'Stride', 2)
    
    convolution2dLayer(3, 32, 'Padding', 'same')
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

% Set training options
options = trainingOptions('sgdm', ...
    'MaxEpochs', 8, ...
    'InitialLearnRate', 0.01, ...
    'MiniBatchSize', 4, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

% Train the network
trainedNet = trainNetwork(trainData, layers, options);

% Save model
save trainedNet.mat trainedNet
