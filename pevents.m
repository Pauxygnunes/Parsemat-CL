function p = pevents(nm)
% The function pevents converts the note matrix in a partition table
% through event partitioning.
% 
% Usage
%   tab = pevents (nm)
% 
% Input argument: 
%	nm = note matrix 
%
% Output: 
%	tab = partition table.
%
% Example: 
%     pevents(nm)
%
% Observation:
%
% Please ensure the nm variable is set in the system, either through the
% midi2nm script or another script that incorporates it.
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Initialization
at = atpoints(nm);
ptemp = [];
tab = [];
x = 1;
% =========== Reading
while x <= length(at)
    % captures time-points
    tp = at(x);
    % captures note-offs
    nof = onset(ptemp)+dur(ptemp);
    % search for disabled notes
    i = nof <= tp;
    % delete disabled notes from ptemp
    ptemp(i,:) = [];
    % find channel matches in tp
    s = dnchan(tp,nm);
        % if s is empty, avoid lines in indexogram
        if isempty(s)==1
            s = NaN(1,length(s));
        end
    % add the active part of ptemp
    ptemp = [ptemp; s];
    % horizontal order of the line
    pt = canais(ptemp);
    % saves in table
    tab(x,1:length(pt)) = pt;
    % increase index         
    x = x + 1;
end
% Finalization
pf = finalpoint(nm);
tf = tab(end,:);
p = [at tab];
end
% ========== function dnchan
function dnchan = dnchan(x,nm)
% List of simultaneous attacks in a given tp
indices = onset(nm) == x;
dnchan = nm(indices,1:3);
end
% ========== function canais
function c = canais(ca)
% Distribution of events according the channel
%
% function c = canais (ca)
%
% Function of event partitioning aiming ordering channels used in a given
% timepoint. 
% 
% Input argument:
%   ca = unordered vector containing the channels articulated in a given
%   timepoint. 
%
% Output: 
%	C = ordered vector containing the channels articulated in a given
%   timepoint. 
%
% Observation: 
% Ordenation function - no new data.
% 
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'Channel' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% © Part of PARSEMAT - Parseme Toolbox, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Initialization
c = [];
% ========== Ordering
while ~isempty(ca)
    % reads channels
    ch = channel(ca);
    % number of same simultaneous channels
    f = find((ch==ch(1)));
    % part absorb the temporary number
    c = [c length(f)];
    % deleting the absorbed lines
    ca(f,:) = [];
end
% ascendent order
c = sort(c);
end
