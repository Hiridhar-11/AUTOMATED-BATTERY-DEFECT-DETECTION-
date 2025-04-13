% Load dataset
imds = imageDatastore('BATTERY\healthy\healthy.jpg', ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% Split into training and test data
[imdsTrain, imdsTest] = splitEachLabel(imds, 0.8, 'randomized');

% Load pretrained AI model
net = resnet18;
inputSize = net.Layers(1).InputSize;

% Replace final layers (for 2-class classification)
layersTransfer = net.Layers(1:end-3);
numClasses = numel(categories(imdsTrain.Labels));
newLayers = [
    layersTransfer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

% Training options
options = trainingOptions('sgdm', ...
    'MaxEpochs', 5, ...
    'MiniBatchSize', 4, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

% Train your custom AI
trainedNet = trainNetwork(imdsTrain, newLayers, options);

% Save the model
save trainedNet.mat trainedNet
