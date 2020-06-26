Part 1
 - generate_probabilities_system
  Am alcatuit "de mana" matricea pentru situatia in care numarul randurilor este mai mic sau egal cu 3.
Parcurg fiecare nivel(rand) si fac legaturile cu nodul urmator. In cazul in care nu ma aflu pe ultimul
nivel, fac legaturile dintre nodurile nivelului prezent cu nodurile nivelului urmator. Diagonala principala 
contine valorile 4,5,6 in funcite de suma elementelor de pe linie.
 
 - matrix_to_csr
  Parcurg toate elementele matricei si formez cei 3 vectori in functie de regulile din prezentarea temei.

 - Jacobi_factorization
  Aplic metoda Jacobi pentru rezolvarea unui sistem Ax = b si calculez matricea de iteratie G_J si vectorul
de iteratie c_J.

 - Jacobi_sparse
  Se calculeaza solutia sitemului folosindu-se functia csr_multiplication(), se calculeaza eroarea si se 
repeta procedeul pana cand eroare devine mai mica decat toleranta primita ca parametru.


Part 2
 - clustering_pc
  In prima parte salvez numarul de puncte: n_points, dimensiunea unui punct: dim_points si initializez 
NC clustere cu 0. Parcurg toate punctele si le sumez in clustere in concordanta cu indicatiile din pdf. 
Apoi creez centroizii facand media punctelor din fiecare cluster.
  Parcurg punctele si calculez cea mai mica distanta dintre un punct si un centroid salvand intr-un vector
pozitia la care am gasit aceasta distanta minima. Apoi, se atribuie listei fiecare punct in functie de 
distanta minima(se foloseste vectorul in care am salvat pozitiile) iar apoi recalculez pozitiile centroizilor
facand iarasi media aritmetica. Totul se repeta cat timp pozitiile centroizilor se modifica.

 - compute_cost_pc
   La fel ca la functia de mai sus, initial salvez dimensiunile de care voi avea nevoie. Apoi parcurg toate
punctele, aflu distanta minima dintre un punct si un centroid, iar apoi calculez suma tuturor distantelor
minime.
 