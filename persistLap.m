% B1 is a (q+1)-boundary matrix, B2 is a q-boundary matrix,
% Gind is an index set for reduction

function [pL,upL] = persistLap(B1,B2,Gind)
    upLaplacian = B1 * B1';
    downLaplacian = B2' * B2;
    upL = SchurComp(upLaplacian,Gind); % up persistent Laplacian    
    pL = upL + downLaplacian; % persistent Laplacian
    

    
