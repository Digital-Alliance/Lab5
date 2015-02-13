function [ total ] = sFunc( finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftmaxTheta )
image = imread('http://eec181.ece.ucdavis.edu:8081/photo.jpg'); %read image
 %image = imread('testImage.jpg'); %testing purposes
image = rgb2gray(image); %convert to grayscale
   % image = imfill(image);
    %image = imadjust(image);
    level = 0.65;  %graythresh(image2); //constant for thresholding
    oImage = im2bw(image, level); %convert to binary using the threshhold
  
    oImage = imcomplement(oImage); %invert black and white to remove borders  
    oImage = imclearborder(oImage, 4); %remove outer blotches
    oImage = imcomplement(oImage); %invert back to normal

    %oImage = imcomplement(oImage);
    %oImage2 = bwconncomp(oImage, 8);
   width = 0;
   locx = -1; %locx = -1 implies location not yet found
   i = 0;
   flag = 0; %Flag used to make sure are low enough in the y direction to be inside the box
   while locx == -1;
       i = i+1;
      for j = 1:3180
          if(oImage(i,j)==0) %if pixel is 0 it is black
              width = width+1; 
              if(width>200 && flag<1) %move down after finding first line to adjust for slanting
                  i = i+3;
                  flag =1; %set the flag
              end
          else
              if(width>200)
                  locx = j-width;
                  locy = i;
                  break;
              else
                  width =0;
              end
          end
      end
   end
   oImage2 = oImage(locy:locy+175, locx:locx+width);
   total = 0;
   digits = round(width/175);
   for l = 1:digits %Number of digits is approximately equal to width of the box over height
   total = total*10; %shift left one decimal bit
   image1 = oImage2(1:end, width*(l-1)/digits+1:width*l/digits);
   image1 = imresize(image1, [28, 28]); %resize to 28x28 image
   image1 = reshape(image1, [784,1]); %reshape to 784 one dimmensional array
   
   z1 = 1./(1+exp(-(finalW1L1*image1+finalB1L1))); %perform the neural network
   z2 = 1./(1+exp(-(finalW1L2*z1+finalB1L2)));
   z3 = finalSoftmaxTheta *z2;
   z4 = mod(find(z3 == max(z3)), 10); %find the guess value for each digit
   
   total = total + z4; %add guess value to answer
   end


end

