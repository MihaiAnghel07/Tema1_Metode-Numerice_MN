function [sol] = rgbHistogram(path_to_image, count_bins)
  path_to_image = "../../checker/checker-part-3/ref/input/458000.jpg";
  image = imread(path_to_image);
  count_bins = 16;
  %disp(image);
  n = histc(image,count_bins);
  
 
end