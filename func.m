function [] = func( x )
load('testSet.mat');
ar = testData(:,x);
ar = reshape(ar, 28, 28);
imshow(ar);
end

