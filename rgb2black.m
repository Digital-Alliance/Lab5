function [ oImage ] = rgb2black( index )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    loc = sprintf('image%d.jpg', index);
    image = imread(loc);
    image = rgb2gray(image);
   % image = imfill(image);
    %image = imadjust(image);
    TopMargin = 500;
    image2 = image(TopMargin:end, :);
    level = graythresh(image2);
    oImage = im2bw(image2, level);
    imshow(oImage);
   % se90 = strel('line', 3, 90);
  %  se0 = strel('line', 3, 0);
    %oImage = imdilate()
    oImage = imcomplement(oImage);
    
    %edges = bwperim(oImage);
    oImage = imclearborder(oImage, 4);
    oImage = imcomplement(oImage);
    %edges = bwperim(oImage);
    %oImage = imclearborder(oImage, 4);
    %oImage = imfill(oImage);
   %imshow (oImage);

end

