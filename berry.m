function b = berry(tab)
% 
% The function berry provides a table of partitions in Wallace Berry's
% format (Berry 1974,2)
%
% Usage
%   b = berry(tab)
%
% Input argument: 
%	tab = partition table.
%
% Output: 
%	b = partition table in Berry's format.
%
% Example: 
%     berry(tab)
%
% Observations: 
%
% The partition table is presented as a list of partitions, with first
% column containing timepoints. Berry's format is a vector of partitions
% formatted in vertical arrange, without timepoints. This function is just
% about design - no new information is added.
% 
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Format tab to Berry's design
t = tab(1:end,2:end);
b = double(int32(t))';
