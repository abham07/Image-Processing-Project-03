function out_im = medFilt(im, num)
% Function takes an image and number and applied the median filter

im_pad = padarray(im, [floor(num/2) floor(num/2)]);
im_col = im2col(im_pad, [num num], 'sliding');
sorted_cols = sort(im_col, 1, 'ascend');

med_vector = sorted_cols(floor(num*num/2) + 1, :);

out_im = col2im(med_vector, [num num], size(im_pad), 'sliding');

end
