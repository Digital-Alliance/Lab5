function [ number ] = rgb2bTest( n )

load('NN.mat');
loc = sprintf('image%d.jpg', n);
image = imread(loc);
number = rgb2b(image,finalW1L1, finalW1L2, finalB1L1, finalB1L2, finalSoftmaxTheta  );
disp(number);
end

