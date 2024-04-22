function p = plotlexset(n)
% 
% The function plotlexset provides the partitiogram of the lexset of a
% number n
% 
% Input argument: 
%	n (positive integer)
%
% Output: 
%	partitiogram
%
% Example:
%     plotlexset(4)
%
% Observations:
%
% The partitogram drawn by plotlexset is an exhaustive taxonomy of all
% partitions from 1 to n (lexical set, see Gentil-Nunes 2009). The graph
% represents the potential for using partitions for a given medium (vocal,
% instrumental or electronic), and for this reason it can have
% compositional or analytical applications. The distances between the
% partitions are significant and constitute a topology of the space
% constituted by the lexicon set.
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
ls = lexset(n);
jc = [1:(length(onset(ls)))];
tab = [jc' ls];
a = agglom(tab);
d = dispers(tab);
maxtot = max([a d]);
% ========== mount label table
c = translatep(ls);
%========== plot partitiogram
ef = plot (a,d, 'g.',...    
                  'LineWidth',2,...
                  'MarkerEdgeColor','g',...
                  'MarkerFaceColor','g',...
                  'Markersize',5);
eg = text (a, d, c, ...
                  'Color', 'k',...
                  'Fontsize', 8,...
                  'Backgroundcolor', 'w',...
                  'HorizontalAlignment', 'center');

axis([-1 maxtot+1 -1 maxtot+1]);
xlabel('agglomeration')
ylabel('dispersion')
axis square;
end