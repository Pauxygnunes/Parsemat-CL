function midird3tonm = midird3tonm(arquivo)
% This function maps the results of function midird3.m (freely available
% from Roland Co.) to the format of MIDI Toolbox (Eerola and Toivianen
% 2007). The adaptation was made by Gentil-Nunes as a workaround of the
% issues about the original conversion module of MIDI Toolbox and the
% posterior versions of Matlab.
% Usage
%   midired3tonm(filename)
% Example
%   midired3tonm('mozart.mid')
% Created in february 2009, under MATLAB 7.0 (PC).
% © Part of PARSEMAT - Parseme Toolbox Software Package,    
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho -
% pauxygnunes@gmail.com
% See License.txt
% ========== Getting the info from the MIDI file using midird3.m
dados = midird3(arquivo);
sizearquivo = size (dados, 2);
tab = [];
tabmt = [];
    for f = 2:sizearquivo
    track = sortrows((dados{f}),2);
    tab = [tab; track];
    end
% ========= Mapping between tables (midird3 -> note matrix)
% tabmt(:,1) = [(tab(2:end,2))-(tab(1:end-1,2)); 0];
tabmt(:,1) = (tab(:,2))/1024;
tabmt(:,2) = (tab(:,4))/1024;
tabmt(:,3) = tab(:,6)+1;
tabmt(:,4) = tab(:,3);
tabmt(:,5) = tab(:,5);
tabmt(:,6) = (tab(:,2))/2048;
tabmt(:,7) = (tab(:,4))/2048;
tabmt = sortrows(tabmt, 1);
midird3tonm = tabmt;