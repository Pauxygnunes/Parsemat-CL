function d = dn(tab)
% 
% The function dn gives the density-numbers of the MIDI file. 
%
% Usage:
%   dn(table of partitions)
%
% Input argument: 
%	tab (partitions table)
%
% Output: 
%	dnlist (density-numbers of MIDI file)
% 
% Example:
%     dn(tab)
%
% Observations: 
%   The density-number is a concept by Wallace Berry (1974, cap. 2).
% 
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Sum of partes of Berry table
d = sum (berry(tab),1);
