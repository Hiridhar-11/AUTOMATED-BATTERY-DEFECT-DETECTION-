% Read a sample image from Damaged folder
img = imread('BATTERY\damaged\damaged.jpg');

% Convert to grayscale
gray = rgb2gray(img);

% Apply edge detection to find scratches, cracks, etc.
edges = edge(gray, 'Canny');

% Display original and processed image
subplot(1,2,1), imshow(img), title('Original Image');
subplot(1,2,2), imshow(edges), title('Detected Edges (Canny)');
