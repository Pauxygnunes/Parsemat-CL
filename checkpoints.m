function a = checkpoints(nm)
% The function checkpoints returns an exhaustive list of check points in
% the note matrix (noteon and noteoffs).
% Usage
%   a = checkpoints (notematrix)
% Input argument: 
%	nm = note matrix in MIDI Toolbox format.
% Output: 
%	a = list of all checkpoints of note matrix.
% Example: 
%     checkpoints(nm)
% Observations: 
% When using 'checkpoints' instead of 'attacks' in the functions
% 'parsemarit', 'parsemachan' and 'parsemalin', it allows for the recording
% of silences, which can be useful in some analysis situations. For
% 'parsemarit', 'attacks' will be used as the default. For 'parsemachan',
% it's recommended to use 'checkpoints'. 
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'Onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Extracting checkpoints from note matrix
noteons = onset(nm);
noteoffs = onset(nm) + dur(nm);
tp = [noteons noteoffs];
a = unique(tp);
