function [ oImage2 ] = rgb2black( index )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    loc = sprintf('image%d.jpg', index);
    image = imread(loc);
    image = rgb2gray(image);
   % image = imfill(image);
    %image = imadjust(image);
    level = 0.7;  %graythresh(image2);
    oImage = im2bw(image, level);
    %imshow(oImage);
   % se90 = strel('line', 3, 90);
  %  se0 = strel('line', 3, 0);
    %oImage = imdilate()
    oImage = imcomplement(oImage);
    
    %edges = bwperim(oImage);
    oImage = imclearborder(oImage, 4);
    oImage = imcomplement(oImage);

    %oImage = imcomplement(oImage);
    %oImage2 = bwconncomp(oImage, 8);
   width = 0;
   locx = -1;
   i = 0;
   flag = 0;
   while locx == -1;
       i = i+1;
      for j = 1:3180
          if(oImage(i,j)==0)
              width = width+1;
              if(width>300 && flag<1)
                  i = i+3;
                  flag =1;
              end
          else
              if(width>300)
                  locx = j-width;
                  locy = i;
                  disp(locx);
                  disp(locy);
                  break;
              else
                  width =0;
              end
          end
      end
   end
   disp(size(oImage));
   disp(locx+width);
   disp(locy);
   oImage2 = oImage(locy:locy+175, locx:locx+width);
   total = 0;
   k = round(width/175);
   for l = 1:k
   total = total*10;
   image1 = oImage2(1:end, width*(l-1)/3+1:width*l/3);
   image1 = imresize(image1, [28, 28]);
   imshow(image1);
   pause(3);
   image1 = reshape(image1, [784,1]);
   total = total + getNum(image1);
   end
   disp(total);
   imshow(oImage2);

end

