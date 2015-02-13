function [ number ] = rgb2blackTest( n )

load('nn.mat');
loc = sprintf('image%d.jpg', n);
image = imread(loc);
number = rgb2b(image,finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftMaxTheta );
disp(number);
end

