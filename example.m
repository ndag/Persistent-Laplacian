% In this example, we consider a VR-complex from a point cloud Point.xyz of 35 points
% The boundary matrices are precomputed and stored in Boundary.mat
% K = VR(X,1) and L = VR(X,1.5)

load Boundary.mat
B1 = B{1}; % 1-boundary matrix
B2 = B{2}; % 2-boundary matrix
B3 = B{3}; % 3-boundary matrix

% prior knowledge of the number of all simplices of K; 
% it is known that for all boundary matrices, the first num_K rows/columns correspond to simplices in K
num_K = 1888; 

%% construct relevant boundary matrices from the whole boundary matrices
simplex = find(sum(abs(B3')));
face = find(sum(abs(B2')));
edge = find(sum(abs(B1')));
vertex = find(sum(abs(B1)));

LB3 = B3'; LB3 = LB3(face,simplex);
LB2 = B2'; LB2 = LB2(edge,face);
LB1 = B1'; LB1 = LB1(vertex,edge);

edge_K = find(edge <= num_K);
KB1 = LB1(:,edge_K);
face_K = find(face <= num_K);
KB2 = LB2(:,face_K);


%% Computing 0-, 1-, 2-persistent Laplacians and eigenvalues
k = 10; % number of eigenvalues

pL0 = LB1*LB1'; % in the case when vertex set is fixed, 0-persistent Laplacian is the same as 0-Laplacian
eigs(pL0,k,'smallestabs')

[pL1,~] = persistLap(LB2, KB1, edge_K);
eigs(pL1,k,'smallestabs')

[pL2,~] = persistLap(LB3, KB2, face_K);
eigs(pL2,k,'smallestabs')
