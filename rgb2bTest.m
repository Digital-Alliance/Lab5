function [ number ] = rgb2bTest( )

load('NN.mat');
for y=1:37
loc = sprintf('image%d.jpg', y);
image = imread(loc);
imwrite(image, 'testImage.jpg', 'jpg');
number = sFunc(finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftmaxTheta  );
disp(number);
end
end

