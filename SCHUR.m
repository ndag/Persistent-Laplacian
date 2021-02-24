function LS = SCHUR(A,ind)
% Author   : Roland Bunschoten
%            University of Amsterdam
%            Intelligent Autonomous Systems (IAS) group
%            Kruislaan 403  1098 SJ Amsterdam
%            tel.(+31)20-5257524
%            bunschot@wins.uva.nl
% Last Rev : Wed Oct 20 08:58:08 MET DST 1999
% Tested   : PC Matlab v5.2 and Solaris Matlab v5.3

% Copyright notice: You are free to modify, extend and distribute 
%    this code granted that the author of the original code is 
%    mentioned as the original author of the code.
    [l,w] = size(A);
    Laa = A(ind,ind);
    Lab = A(ind,setdiff(1:w,ind));
    Lbb = A(setdiff(1:w,ind),setdiff(1:w,ind));
    % The following formula was supposed to be Laa-Lab * pinv(Lbb) * Lab'
    % However, we use lsqminnorm(A,b) to efficiently implement pinv(A)*b
    LS = Laa-Lab * lsqminnorm(Lbb,Lab');
