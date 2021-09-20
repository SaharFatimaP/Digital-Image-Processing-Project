img = imread('C:/Users/sahar/OneDrive/Desktop/dip_project_files/images/IMG20191102113704.jpg'); 
figure, subplot(1,3,1),imshow(img), xlabel('Original');
img = rgb2gray(img);
Thresh = 0.5*(double(min(img(:))) + double(max(img(:))));
 
done = false; %Region-Based Segmentation
 
while ~done % Until the old and new thresholds differ keep iterating 
    seg_img = img >= Thresh;
    Thr = Thresh; % Saving the current threshold
% Taking mean of new segmented regions and setting their mean as T 
    Thr_next = 0.5*(mean(img(seg_img)) + mean(img(~seg_img)));
    done = abs(Thresh - Thr_next) < 0.5; 
    Thresh = Thr_next;
end

subplot(1,3,2), imshow(~seg_img); xlabel(['Global Thresholding - Cow thresholded with T=' num2str(Thr)]);

%apply erosion to remove noisy structures
se = strel('cube',7);
erodedBW = imerode(~seg_img, se); 
subplot(1,3,3), imshow(erodedBW),xlabel('After Erosion');
     




