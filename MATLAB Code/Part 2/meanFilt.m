function out_im = meanFilt(im, num)
% Function takes an image and number and applies the mean filter

im_pad = padarray(im, [floor(num/2) floor(num/2)]);
im_col = im2col(im_pad, [num num], 'sliding');

im_avg = sum(im_col)/(num*num);

out_im = col2im(im_avg, [num num], size(im_pad), 'sliding');

end
