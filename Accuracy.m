
load ('testSet.mat');
load('NN.mat');
right = 0;
for n =1:10000;
    guess = testMatrix(n, finalW1L1, finalW1L2, finalB1L1, finalB1L2, finalSoftmaxTheta, testData );
    right = right + (guess== testLabels(n,1));
end

Data = right/10000;
    