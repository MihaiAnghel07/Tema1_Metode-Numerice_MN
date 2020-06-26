function [centroids] = clustering_pc(points, NC)
  
  [n_points dim_points] = size(points);
  cluster = zeros(NC,dim_points);
  
  %parcurg punctele si in acelasi timp le sumez in NC clustere
  %de puncte pentru fiecare cluster
  contor = 1;
  for i = 1:n_points
    if contor == NC + 1
      contor = 1;
    endif
     cluster(contor, :) = cluster(contor, :) + points(i,:); 
     contor++;
  endfor
  
  
  %salvez in centroids media (centrele de masa)
  for i = 1:NC
    centroids(i, :) = cluster(i, :) / (n_points/NC); 
  endfor
  
  
  lista = zeros(NC,dim_points);
  %se repeta pasii 2,3,4 cat timp distanta se modifica
  while 1
    pozitie(1:n_points) = 0;
    for i = 1:n_points
      distanta = norm(points(i, :) - centroids(1, :));
      iterator = 1;
      %calculez cea mai mica distanta
      for j = 2:NC
          if norm(points(i, :) - centroids(j, :)) < distanta
            distanta = norm(points(i, :) - centroids(j, :));
            iterator = j;
          endif
      endfor
      pozitie(i) = iterator;
    endfor 
    lista = centroids;
    centroids = zeros(NC, dim_points);
   %se atribuie listei fiecare punct in functie de distanta minima
    for i = 1:NC
       contor = 0;
       for j = 1:n_points
         if i == pozitie(j)
           centroids(i, :) = centroids(i, :) + points(j, :);
           contor++;
          endif
       endfor
        %recalculez pozitiile centroizilor
       centroids(i, :) = centroids(i, :) / contor;
    endfor
    if norm(centroids - lista) == 0
      return;
    endif
  endwhile
endfunction
