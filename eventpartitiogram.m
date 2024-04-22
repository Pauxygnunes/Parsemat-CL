% Script eventpartitiogram
%   The script eventpartitiogram provides the partitiogram correspondent to
%   the event partitioning of a MIDI file. 
% Usage:
%   eventpartitiogram
% Example:
%   eventpartitiogram
% Observations: 
%   The MIDI file has to be prepared with each event in score assigned to a
%   specific channel. The event partitioning is part of Musical Partitional
%   Analysis (Gentil-Nunes 2009).
% Created in february 2009, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Operates the event partitioning
midi2nm
tab = pevents(nm);
partitiogram(tab)
