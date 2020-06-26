function [values, colind, rowptr] = matrix_to_csr(A)
  
   [n n] = size(A);
   nz = 0;
   gasit = 0;
   nr = 0;
   
   for i = 1:n
     gasit = 0;
     for j = 1:n
       if A(i,j) ~=0
         nz++;
         values(nz) = A(i,j);
         colind(nz) = j;
         
         if gasit == 0
            gasit = 1;
            nr++;
            rowptr(nr) = nz;
         endif
       endif
     endfor
   endfor
   
   rowptr(nr+1) = nz + 1;
  
endfunction