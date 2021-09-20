%%Depth Image Segmentation 
%For image: 44
% img = imread('C:/Users/sahar/OneDrive/Desktop/dip_project_files/save_depth_map/44.jpg');
% figure, subplot(1,2,1), imshow(img), xlabel('Depth Image')
% img = rgb2gray(img);
% 
% level = graythresh(img);
% 
% BW = imbinarize(img,0.199);
% subplot(1,2,2), imshow(BW), xlabel('img: 44 Depth Image after Segmentation')

%For image: 34
img = imread('C:/Users/sahar/OneDrive/Desktop/dip_project_files/save_depth_map/34.jpg');
figure, subplot(1,2,1), imshow(img), xlabel('Depth Image')
img = rgb2gray(img);

level = graythresh(img);

BW = imbinarize(img,level);
subplot(1,2,2), imshow(BW), xlabel('img: 34 Depth Image after Segmentation')



     
