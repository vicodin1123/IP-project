%% FCM Matlab
if ~exist('testing', 'var')
    clear; close all;
    data_dir = './pics/';
    file_name = '3.jpg';
    n_cluster = 4;
end

% Parameters
fuzziness = 2;
stopping_threshold = 1e-4;
update_rate = 0.1;

img = imread([data_dir file_name]);

n_row = size(img, 1);
n_col = size(img, 2);

% Read the image
img = double(reshape(img, [numel(img) 1]));


[centers,U] = fcm(img, n_cluster);

img = reshape(img, [n_row n_col]);

[val ind] = max(U);
%%
for i = 1 : n_cluster
    img(ind==i) = centers(i);
end

if ~exist('testing', 'var')
    figure;
    imshow(uint8(img));
end

disp(centers);

imwrite(uint8(img), sprintf('./temp/%s_FCM_matlab.jpg', file_name));