function [ z4 ] = testMatrix( x, finalW1L1, finalW1L2, finalB1L1, finalB1L2, finalSoftmaxTheta, testData )
%load ('testSet.mat');
%load('NN.mat');
z1 = 1./(1+exp(-(finalW1L1*testData(:,x)+finalB1L1)));
z2 = 1./(1+exp(-(finalW1L2*z1+finalB1L2)));
z3 = finalSoftmaxTheta *z2;
z4 = find(z3 == max(z3));
end

