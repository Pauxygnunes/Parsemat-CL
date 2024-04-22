function indices = adpairs(tab)
%       
% The function adpairs provides all the pairs (agglomeration, dispersion)
% for each partition of partition table.
% 
% Example: 
%     adpairs(tab)
%
% Observation:
%   It is necessary that variables nm and tab are available in workspace.
%
% Created in february 2009, under MATLAB 7.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Calculation of indices
a = agglom(tab)';
d = dispers(tab)';
indices = [a, d];