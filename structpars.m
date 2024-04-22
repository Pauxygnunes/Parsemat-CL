function sp = structpars(tab)
% 
% The function structpars provides a list of timepoints where changes of
% partitions occurs (structural junctions). These points delimitate the
% parsemes, there is, the musical areas constrained by a specific
% partition.
% 
% Input argument: 
%	tab (partition table)
%
% Output: 
%	sp (structural junctions)
%
% Example: 
%     structpars(tab)
%
% Observations:
%   It is necessary to have the tab variable in workspace.
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% 'onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% remoçao de duplicatas e definiçao das juncoes estruturais.
% ========== Initialization
at = tab(:,1);
tab2 = tab(:,2:end);
nlin = size(at,1);
w = 1;
t = 1;
% ========== Read the file and find structural junctions
    while w <= nlin
        % copy values of tab and at to temporary variables
        tab2temp(t,:)= tab2(w,:);
        attemp(t,:) = at(w,:);
        % Increase counter
        w = w + 1;
            if w > nlin
                continue
            end
        % find parseme progression
        while isequal (tab2(w,:), tab2temp(t,:))
            w = w + 1;
            if w > nlin
                break
            end
        end
        t = t + 1;
    end
% mounts final table
sp = [attemp tab2temp];