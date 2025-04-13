% Load model
load trainedNet.mat

% Run Simulink model
simOut = sim('team_13');
vPass = simOut.get('voltagepass');
vPass = vPass(end);

% Load and classify image
img = imread('BATTERY/healthy/h.jpg');  % Use damaged image here
img = imresize(img, [64 64]);
predictedLabel = classify(trainedNet, img);

% Show both individual results:
if vPass == 1
    disp("✅ Voltage Test: PASS");
else
    disp("❌ Voltage Test: FAIL");
end

if predictedLabel == "healthy"
    disp("✅ Image Inspection: HEALTHY");
else
    disp("❌ Image Inspection: DAMAGED");
end

% Final combined result:
if vPass == 1 && predictedLabel == "healthy"
    disp("✅ FINAL RESULT: Battery Pack PASSED Quality Check ✅");
else
    disp("❌ FINAL RESULT: Battery Pack FAILED Inspection ❌");
end
