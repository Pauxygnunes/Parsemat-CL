function a = atpoints(nm)
% The function atpoints returns an exhaustive list of attack points in the
% note matrix.
% 
% Usage
%   a = atpoints(notematrix)
% 
% Input argument: 
%	nm = note matrix in MIDI Toolbox format.
%
% Output: 
%	a = list of all attack points of note matrix.
% 
% Example: 
%     atpoints(nm)
%
% Observations: 
% Attack points can be useful in applications involving rhythm.
% They indiscriminately refer to attacks, either of individual parts, or 
% simultaneous articulations of different parts.
%
% Created in january 2004 by Pauxy Gentil-Nunes under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'Onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========= Resuming simultaneous attacks into one time point.
a = unique(onset(nm));