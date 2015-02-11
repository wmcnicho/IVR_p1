function [ bin ] = cardlocation( file, old_thresh )
%REGIONCARD Summary of this function goes here
%   Detailed explanation goes here

% Load image
i = myjpgload(file,1);

ad = adapt(file);
imshow(ad);
%{
% Create histogram
hist = dohist(i,2);
% Binarised image
thresh = findthresh(hist,1500,3);
disp(thresh)
bin = binarisedhigh(i,thresh);
image(bin);

% Removes lines
morph = bwmorph(bin,'open',4);
imshow(morph);
% Finds regions
label = bwlabel(morph,4);
card = regionprops(label,['basic']);
%}


end

