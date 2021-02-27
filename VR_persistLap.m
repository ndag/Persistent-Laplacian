% We compute the q-persistent Laplacian of a simplicial pair K --> L coming from a VR-complex 
% The boundary matrices are precomputed and stored in q1Boundary.mat (q+1
% boundary matrix) qBoundary.mat (q boundary matrix)
% The q+1 boundary matrix is ordered such that the first several columns
% correspond to q+1 simplices in K

load q1Boundary.mat
load qBoundary.mat % comment this line if dimension q = 0
B1 = double(Bq); % q+1 boundary matrix
B2 = double(Bq1); % q boundary matrix
[~,num_K] = size(B1); 


% Computing the q-persistent Laplacian and smallest k eigenvalues
k = 10; % number of eigenvalues

tic
[pL,~] = persistLap(B2, B1, 1:num_K);
toc
eigs(pL,k,'smallestabs')



