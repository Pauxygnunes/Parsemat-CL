function t = totalrel(tab)
%   Total number of binary relations for each partitions. From a partition
%   table, returns a list of numbers. 
% Usage
%   totalrel (partition table)
% Input argument: 
%	  tab (partition table)
% Output: 
%	  t (vector of indices correspondent to the total binary relations of 
%   each partition of a partition table)
% Example: 
%     totalrel(tab)
% Observations:
%   It is necessary to render the notematrix previous to the use of this
%   function.
% Info:
%   Created in 2004, january, under MATLAB 6.0 (PC)
%   © Part of PARSEMAT - Parseme Toolbox Software Package, 
%   Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
%   See License.txt
%   'onset' is a function of MIDI Toolbox Software Package,
%   by Tuomas Eerola & Petri Toiviainen, Department of Music,
%   ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
%   Copyright © 2004, University of Jyvaskyla, Finland
% ========== Calculates totalrel for any partition of table
t = (dn(tab)).*((dn(tab))-1)/2;
