function S = SchurComp(A,ind)
% Author   : Zhengchao Wan
%            The Ohio State University
%            wan.252@osu.edu
% Last Rev : Wed Feb 24 12:54:08 EST 2021

% Copyright notice: You are free to modify, extend and distribute 
%    this code granted that the author of the original code is 
%    mentioned as the original author of the code.
    [l,w] = size(A);
    Saa = A(ind,ind);
    Sab = A(ind,setdiff(1:w,ind));
    Sba = A(setdiff(1:w,ind),ind);
    Sbb = A(setdiff(1:w,ind),setdiff(1:w,ind));
    % The following formula was supposed to be Saa-Sab * pinv(Sbb) * Sba
    % However, we use lsqminnorm(A,b) to efficiently implement pinv(A)*b
    S = Saa-Sab * lsqminnorm(Sbb,Sba);
