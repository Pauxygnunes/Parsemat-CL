% Script rhythmicpartitiogram
%   The script rhythmicpartitiogram provides the rhythmic partitiogram of the
%   MIDI file. The script asks for the MIDI file location, calculates and
%   render the rhythmic partitiogram.
% Example: 
%     rhythmicpartitiogram
% Observations: 
%   The rhythmic partitiogram is an inventory of all
%   partitions of MIDI file (Carvalho and Gentil-Nunes 2003)
% Info
%   Created in february 2009, under MATLAB 7.0 (PC)
%   © Part of PARSEMAT - Parseme Toolbox Software Package, 
%   Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
%   See License.txt
% ========== Calculating tab from file
midi2nm
tab = prhythmic(nm);
% ========== Render the graph
partitiogram(tab)
