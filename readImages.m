function readImages( x )

for y = 1:x
    dest = sprintf('image%d.jpg', y+20);
    img = imread('http://eec181.ece.ucdavis.edu:8081/photo.jpg');
    imshow(img);
    imwrite(img, dest, 'jpg'); 
    pause(3);
end
end

