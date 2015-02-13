function [ number ] = sFuncBTest( )

load('NN.mat');
for y=1:37
disp(y);
loc = sprintf('image%d.jpg', y);
image = imread(loc);
imshow(image)
pause(.75);
imwrite(image, 'testImage.jpg', 'jpg');
number = sFuncB(finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftmaxTheta  );
disp(number);
pause(.75);
end
end

