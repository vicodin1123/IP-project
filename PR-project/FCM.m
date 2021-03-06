%% FCM Matlab
if ~exist('testing', 'var')
    clear; close all;
    data_dir = './pics/';
    file_name = '4.jpg';
    n_cluster = 3;
end

% Parameters
fuzziness = 2;
stopping_threshold = 1e-4;
update_rate = 0.1;

% Read the image
img = im2double(imread([data_dir file_name]));

n_row = size(img, 1);
n_col = size(img, 2);

cc = rand(1, n_cluster);
[Ifc, C, M] = fuzzycmeans(img, n_cluster, 15, cc);

%%
img = im2double(imread([data_dir file_name]));
values = unique(img);

mems = zeros(length(values), n_cluster);
for i = 1 : length(values)
    for c = 1 : n_cluster
        cM = M(:, :, c);
        ind = find(img==values(i));
        mems(i, c) = cM(ind(1));
    end
end

figure; hold on;
for i = 1 : n_cluster
    plot(values, mems(:, i));
    plot(C(i), 0,'o', 'Color', 'r');
end
title('FCM Membership');

%%

for i = 1 : n_cluster
    img(Ifc==i) = C(i);
end

if ~exist('testing', 'var')
    figure;
    imshow(img);
end

disp(C);

imwrite(img, sprintf('./temp/%s_FCM_c%d.jpg', file_name, n_cluster));