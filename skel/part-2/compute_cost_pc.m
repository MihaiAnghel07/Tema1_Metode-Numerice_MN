function [cost] = compute_cost_pc(points, centroids)
  
  format long
  [NC dim_points] = size(centroids);
  [n_points dim_points] = size(points);
  
  contor = 1;
  cost = 0;
  %parcurg punctele si aflu distanta minima si o sumez
  for i = 1:n_points
    distanta = norm(points(i,:) - centroids(1,:));
    contor = 1;
    for j = 2:NC
      if norm(points(i,:) - centroids(j,:)) < distanta
        distanta = norm(points(i,:) - centroids(j,:));
        contor = j;
      endif
    endfor
    cost  = cost + norm(points(i,:) - centroids(contor,:));
  endfor
endfunction

