% Script rhythmicindexogram 
%   The script rhythimicindexogram provides, from a MIDI file, the
%   correspondent rhythmic partitioning indexogram.
% Example:
%     rhythmicindexogram
% Observations: 
%   The rhythmic partitioning is part of Partitional Analysis
%   (Gentil-Nunes 2009).
% Info
%   Created in february 2009, under MATLAB 6.0 (PC)
%   © Part of PARSEMAT - Parseme Toolbox Software Package, 
%   Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
%   See License.txt
% ========== Commands for rhythmic partitioning indexogram
midi2nm
tab = prhythmic(nm);
indexogram(tab)
