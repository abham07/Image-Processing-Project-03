function out_im = minFilt(im, num)
% Function takes an image and number and applied the minimum filter

im_pad = padarray(im, [floor(num/2) floor(num/2)]);
im_col = im2col(im_pad, [num num], 'sliding');

im_min = min(im_col);

out_im = col2im(im_min, [num num], size(im_pad), 'sliding');

end
