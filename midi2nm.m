% Script midi2nm
% 
% Reading and conversion of MIDI file into a note matrix (MIDI Toolbox
% format).
%
% The script opens the selection dialogue and converts the chosen file to
% the note matrix format.
%
% Usage:   
%
%     midi2nm   
%
% Observations:
%
% Created in february 2009, under MATLAB 7.0 (PC).
% © Part of PARSEMAT - Parseme Toolbox Software Package,    
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho -
% pauxygnunes@gmail.com
% See License.txt
% 'readmidi' and 'quantize' are functions of MIDI Toolbox Software Package.
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Getting the file address
[arquivo, endereco] = uigetfile({'*.mid', 'Choose MIDI'}); 
caminhocompleto = [endereco arquivo];
% ========== Converts the file to nm format
nm = midird3tonm(caminhocompleto);
disp 'Arquivo MIDI convertido para note matrix'
% ========== Options for quantization - disabled
% indquant = min(nm(:,2))/20;   
% quant = quantize(nm,1/256,1/256,1/256);
% nm = quantize(nm,indquant,indquant);
