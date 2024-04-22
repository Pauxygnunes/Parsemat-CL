function combindexogram(tab)
%     The function combindexogram provides a indexogram where the main line is
%     the difference between the agglomeration and dispersion indices.
% Input argument: 
%	tab (partition table)
% Output: 
%	combined indexograma correspondent to partition table
% Example:
%     combindexogram(tab)
% Observations: 
%   The difference between the agglomeration and dispersion indices are
%   plotted against the temporal axis, reflecting the equilibrium between
%   the two aspects of partitional progressions. (Gentil-Nunes 2009)
% Created in 2004, january, under MATLAB 6.0 (PC)
% 'Onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
%========== Initialization
p = structpars(tab);
a = agglom(tab);
d = dispers(tab);
% delimitation of graphics
in = ([a d]);
mx = max(in);
lm = mx + 4;
% graphic data
jc = onset(tab);
pf = max(onset(tab));
pt = structpars(tab);
ps = onset(pt);
% label data
ls = translatep (pt(:,2:end));
sz = length(ps);
lt = (ones(sz,1))*(((max(d))+lm)/2);
%========== combined indexogram
figure
h = area(jc,d-a); % Set BaseValue via argument
set(h,'FaceColor',[.98 .98 .98],...
    'Linestyle', ':')
hold on
plot (jc, d-a, 'k.-')
        %'LineWidth', .5,...
        %'Markersize', 3);                    
xlabel('pontos de tempo')
ylabel('<-- aglom. / dispers. -->')
axis([-1 pf+1 (-lm) lm]);
eg = text (ps, lt, ls, ...    
     'Fontsize', 8,...
     'Backgroundcolor', 'w',...
     'Fontweight', 'bold',...
     'HorizontalAlignment', 'center',...
     'Margin', 5);
pan xon
zoom xon
hold off
end
