img = imread('C:/Users/sahar/OneDrive/Desktop/dip_project_files/images/IMG20191102113704.jpg');
figure, subplot(1,3,1), imshow(img), xlabel('Original Image');
resize = imresize(img, 0.5);

img_g = rgb2gray(img);

%Smooth the image
mask = fspecial('gaussian', 3);
resize = imfilter(resize, mask, 'replicate')

subplot(1,3,2), imshow(resize), xlabel('Smooth resized image');

%conversion of Rgb to YCbCr
YCBCR = rgb2ycbcr(resize)
subplot(1,3,3), imshow(YCBCR), xlabel('RGB to YCbCr');

%edge detection 
%by Sobel
eRed = edge(resize(:,:,1), 'sobel'); % edges only in the I(:,:,1): red channel.
eGreen = edge(resize(:,:,2), 'sobel');
eBlue = edge(resize(:,:,3), 'sobel');

scombined = eRed | eGreen | eBlue;

figure, subplot(2,3,1), imshow(scombined), xlabel('Edges detected by Sobel');
sbel = bwareaopen(scombined,16);
subplot(2,3,4), imshow(sbel), xlabel('After Removal of small Objects from Sobel')

%by prewitt
eRed = edge(resize(:,:,1), 'prewitt'); % edges only in the I(:,:,1): red channel.
eGreen = edge(resize(:,:,2), 'prewitt');
eBlue = edge(resize(:,:,3), 'prewitt');

pcombined = eRed | eGreen | eBlue;
subplot(2,3,2), imshow(pcombined), xlabel('Edges detected by Prewitt');
prewt = bwareaopen(pcombined,16)
subplot(2,3,5), imshow(prewt), xlabel('After Removal of small Objects from (Prewitt)')

%by canny
eRed = edge(resize(:,:,1), 'canny'); % edges only in the I(:,:,1): red channel.
eGreen = edge(resize(:,:,2), 'canny');
eBlue = edge(resize(:,:,3), 'canny');

ccombined = eRed & eGreen & eBlue;
subplot(2,3,3), imshow(ccombined), xlabel('Edges detected by Canny');
cany = bwareaopen(ccombined,20);
subplot(2,3,6), imshow(cany), xlabel('After Removal of small Objects (Canny)')

%Compute the euclidean transform of the images obtained previously.

sobel_dist = bwdist(sbel);
figure, subplot(2,3,1), imshow(sobel_dist), xlabel('Distance Transform (Sobel)');
prewt_dist = bwdist(prewt);
subplot(2,3,2), imshow(prewt_dist), xlabel('Distance Transform (Prewitt)');
cany_dist = bwdist(cany);
subplot(2,3,3), imshow(cany_dist), xlabel('Distance Transform (Canny)');

%%Label the image 

sobel_label = bwlabel(sobel_dist,4);
subplot(2,3,4), imshow(sobel_label), xlabel('Image label(Sobel)');
prewt_label = bwlabel(prewt_dist,4);
subplot(2,3,5), imshow(prewt_label), xlabel('Image label(Prewitt)');
cany_label = bwlabel(cany_dist,4);
subplot(2,3,6), imshow(cany_label), xlabel('Image label(Canny)');


se = strel('disk',25);
closeBW = imclose(sbel,se);

c = imclearborder(~closeBW,4);
figure, imshow(c), xlabel('Segmented Region');















