function a = agglom(tab)
% The function agglom provides the agglomeration indices for each partition
% of the partition table. 
% 
% Input argument:
%	tab (partition table)
%
% Output: 
%	a (agglomeration indices for each partition)
%
% Example:
% 
%     a = agglom(tab)
%
% Observations:
%   The agglomeration index constitutes, with the dispersion index, a pair of
%   coordinates for plotting the indexogram and partitiogram (see
%   Gentil-Nunes 2009).
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Calculatino of agglomeration indices
dn = dnp(tab);
a = sum (dn,1);