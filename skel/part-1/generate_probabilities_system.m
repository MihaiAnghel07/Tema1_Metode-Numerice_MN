function [A, b] = generate_probabilities_system(rows)
  
  m = rows*(rows+1)/2; % numar ecuatii
  A = zeros(m,m);
  %piramida are cel putin 3 randuri :D
  A(1,2) = A(2,1) = A(1,3) = A(3,1) = -1;
  A(2,3) = A(3,2) = -1;
  A(2,4) = A(4,2) = A(2,5) = A(5,2) = A(3,5) = A(5,3) = A(3,6) = A(6,3) = -1;
  A(4,5) = A(5,4) = A(5,6) = A(6,5) = -1;
  
  b(1,1:m) = 1;
  b(1,1:m-rows) = 0; 
  b = b';
  
  if rows == 3 
    A(1,1) = A(6,6) = A(4,4) = 4 ;
    A(2,2) = A(3,3) = A(5,5) = 5;
    return;
  endif

  for i = 3:rows
    c = (i+1)*(i+2)/2-i;
    for j = (i*(i+1)/2)-i+1:(i*(i+1)/2)
      
      if j ~= i*(i+1)/2
        A(j,j+1) = A(j+1,j) = -1;
      endif
      
      if i ~= rows 
        A(j,c) = A(c,j) = A(j,c+1) = A(c+1,j) = -1;
      endif
      c++;
      
    endfor
  endfor
  
  for i = 1:m
    suma = 0;
    for j = 1:m
      suma = suma + A(i,j);
    endfor
    
      if suma == -2
        A(i,i) = 4;
     endif
    
      if suma == -4
        A(i,i) = 5;
      endif
    
      if suma == -6
        A(i,i) = 6;
      endif
  endfor
 
endfunction