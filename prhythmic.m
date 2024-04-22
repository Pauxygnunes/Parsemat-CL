function p = prhythmic (nm)
% Conversion of note matrix to partitions table through rhythmic
% partitioning.
% Usage
%   tab = prhythmic(nm)
% Input argument: 
%	nm = note matrix of MIDI Toolbox, obtained from midi2nm.
% Output: 
%	tab = partitions table.
% Example: 
%     prhythmic(nm)
% Observations: The NM variable must be configured in the system, either by
% the Midi2nm script or by any other script that includes it.
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt 
% 'onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Select atpoints or checkpoints (disabled)
at = atpoints(nm);
% at = checkpoints(nm); 
% ========= Rhythmic partitioning
ptemp = [];
tab = [];
x = 1;
    while x <= size(at,1)
        % captures time-point
        tp = at(x);
        % captures note-offs
        nof = onset(ptemp)+dur(ptemp);
        % search for disabled notes
        i = nof <= tp;
        % delete disabled notes
        ptemp(i,:) = [];
        % find simultaneities in tp
        s = simult(tp,nm);
        % add the active part of ptemp
        ptemp = [ptemp; s];
        % orders horizontally the line
        pt = parts(ptemp);
        % saves in table
        tab(x,1:length(pt)) = pt;
        % Increase index
        x = x + 1;
    end
% calculates the last line of table, including the last timepoint with the
% last partition.
pf = finalpoint(nm);
tf = tab(end,:);
% mounts the table.
p = [at tab;pf tf];
end
% ========== function simult
function s = simult(x,nm)
% list simultaneous attacks in given timepoint
indices = onset(nm)== x;
s = nm(indices,1:2);
end
% ========= function parts 
function p = parts(nm)
% find parts
% ========== Initialization
p = [];
    while ~isempty(nm)
        % read attacks and durations
        o = onset(nm);
        d = dur(nm);
        % f is the number of equal durations and attacks
        f = find((o==o(1))& (d==d(1)));
        % parts absorbs this temporary number 
        p = [p length(f)];
        % delete absorbed lines
        nm(f,:) = [];
    end
% ascendent order
p = sort(p);
end