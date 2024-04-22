function d = dnp(tab)
%   The funcion dnp calculates the agglomeration indices for each part of the
%   partition table. Returns a table where each part is substituted by its
%   agglomeration index.
% Usage:
%   tabd = dnp(tab)
% Input argument: 
%	  tab (partition table)
% Output: 
%	  tabd (agglomeration indices table)
% Example:
%     dnp(tab)
% Observations: 
%   This function is necessary to calculate the sum of agglomeration
%   indices for the agglomeration index of partition.
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Calculation of pairwise combinations of each part 
d = ((berry(tab)) .* ((berry(tab))-1))/2;
