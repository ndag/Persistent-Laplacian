% B1 is a (q+1)-boundary matrix, B2 is a q-boundary matrix (or 0 if q=0),
% Gind is an index set for reduction

function [pL,upL] = persistLap(B1,B2,Gind)
%     B1 = sparse(B1);
%     B2 = sparse(B2);
    upLaplacian = B1 * B1';
    if B2 == 0
        %up persistent Laplacian
        upL = SchurComp(upLaplacian,Gind);
        %persistent Laplacian
        pL = upL;
    else
        downLaplacian = B2' * B2;
        %up persistent Laplacian
        upL = SchurComp(upLaplacian,Gind);
        %persistent Laplacian
        pL = upL + downLaplacian;
    end 
    
