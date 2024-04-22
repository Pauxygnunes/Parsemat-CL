function d = dispers(tab)
% 
% The function dispers provides the dispersion indices for each partition
% of partition table.
%
% Usage
%   d = dispers(partition table) 
%
% Input argument: 
%	tab (partition table)
%
% Output: 
%	d = dispersion indices
% 
% Exemplo:
%     dispers(tab)
%
% Observations: 
%   The dispersion index constitutes, with the agglomeration index, a pair
%   of coordinates for plotting indexogram and partitiogram. (Gentil-Nunes
%   2009).
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% =========== Dispesion index as the difference between totalrel and agglom
% index.
T = totalrel(tab);
A = agglom(tab);
d = T - A;

