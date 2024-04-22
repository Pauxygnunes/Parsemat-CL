function p = partitions (n)
%
% The function partitions provides a list of all partitions of a integer
% number n in lexicographic order.
% 
% Input argument: 
%	n (positive integer)
%
% Output: 
%	p (list of partitions of n)
%
% Example: 
%     partitions(4)
%
% Observations:
%   Programmed by Gentil-Nunes (2007) from algorithm conceived by Butler,
%   Bill (2007) - Enumerations of partitions. Available in
%   <http://www.durangobill.com/Partitions.html>.
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Initialization
tab = [];
lintemp = [];
% Application of durango algorithm
d = durango(n);
    for i = 1:length(d)
        vec = d(i,:);
        p = find(vec);
        ind = vec(p);
        for f = 1:length(p)
            lin = p(f)*ones(1,ind(f));
            lintemp = [lintemp lin];
        end
        z = n - length (lintemp);
        lintemp = [lintemp zeros(1,z)];
        tab = [tab; lintemp];
        lintemp = [];
    end
p = sortrows(tab);
end
% ========== function durango
function d = durango(n)
% The function durango provides a table of multiplicities of each part in
% the context of integer partitions.
% 
% Input argument: 
%	n = integer
%
% Output: 
%	d = multiplicity table for each part
%
% Observation: 
%
%   Programmed by Gentil-Nunes (2007) from algorithm conceived by Butler,
%   Bill (2007) - Enumerations of partitions. Available in
%   <http://www.durangobill.com/Partitions.html>.
% 
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Initialization
tab = [];
x = [n zeros(1,n-1)];tab = [x;];
h = 1;
% ========== Durango algorithm
    while x(n)==0
        if x(1)>=2
            x = passo1(x); tab = [tab; x];
        else
            x = passo2(x); tab = [tab; x];
        end
    end
d = tab;
end
% ========== function passo1
function p = passo1(vec)
vec(1) = vec(1)-2;
vec(2) = vec(2)+1;
p = vec;
end
% ========== function passo2
function p = passo2(vec)
total = vec(1);
vec(1) = 0;
x = 2;
    while total < x
        total = total + (vec(x)*x);
        vec(x) = 0;
        x = x + 1;
    end
vec(x) = vec(x) +1;
vec(1)= total - x;
p = vec;
end
