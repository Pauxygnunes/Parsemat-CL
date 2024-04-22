function fp = finalpoint(nm)
% The function finalpoint gets the final timepoint of note matrix (last
% noteoff).
% Usage
%   function pf = pfinal(nm)
% Input argument: 
%	nm = note matrix of MIDI Toolbox, provided by the script midi2nm.
% Output: 
%	fp = timepoint correspondent to the last noteoff of note matrix.
% Example: 
%     pfinal(nm)
% Observations: For plotting the graphs, it is necessary to consider the
% last time point of the matrix, even if it does not correspond to any real
% articulated partition. The partition equivalent to the penultimate time
% point is assigned to this time point, only to graphically constitute the
% action field of the partition. It is necessary that the variable NM is
% configured in the system, either by the midi2nm script or by any other
% script that includes it.
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'onset' and 'dur' are functions of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Simple reading of last noteoff
fp = max (onset(nm) + dur(nm));