% img = imread('C:\Users\sahar\OneDrive\university\dip\project\dip_project_files\images/cow_600.png');
% figure,subplot(2,2,1),imshow(img), xlabel('Original');
%  
% img = rgb2gray(img);
% subplot(2,2,2),imhist(img), ylim('auto');
% 
% %Otsu Thesholding
% thresh = 0.6
% seg_img = im2bw(img, thresh);
% subplot(2,2,3) ,imshow(~seg_img); xlabel(['Cow Image thresholded by Otsu with T=' num2str(255*thresh)]);
% 
% %applying erosion
% 
% se = strel('disk',10);
% eroded_seg = imerode(~seg_img, se);
% %subplot(2,2,3), imshow(eroded_seg); xlabel('After applying erosion on segmented image');
% 
% se = strel('disk',10);
% dilated_seg = imdilate(eroded_seg, se);
% subplot(2,2,4), imshow(dilated_seg); xlabel('After applying closing');
% 

img = imread('C:\Users\sahar\OneDrive\university\dip\project\dip_project_files\images/cow_600.png');
a  = imread('C:\Users\sahar\OneDrive\university\dip\project\dip_project_files\depth_images\sahar/34.jpg');
b = imread('C:\Users\sahar\OneDrive\university\dip\project\dip_project_files\depth_images\sahar/245.jpg');


figure, subplot(1,3,1), imshow(img), xlabel('Labeled Image, Weight: 600kg');
subplot(1,3,2), imshow(a), xlabel('Testset Image, Weight: 408kg');
subplot(1,3,3), imshow(b), xlabel('Testset Image, Weight: 870 kg');

