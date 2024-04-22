function stairsindexogram(tab)
%         The function stairsindexogram renders the indexogram in stairs style,
%         where the lines follows the full duration of each partition.
% Input argument: 
%	tab (partition table)
% Output:
%   indexogram in stairs style
% Example:
%     stairsindexogram(tab)
% Observation: 
%   The stairs indexogram emphasizes the sudden change of one partition to
%   another. It is provided for more precise representation where the
%   angles from one partition to another are not important.
% Info
%   Created in 2004, january, under MATLAB 6.0 (PC)
%   © Part of PARSEMAT - Parseme Toolbox Software Package, 
%   Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
%   See License.txt
%   'Onset' is a function of MIDI Toolbox Software Package,
%   by Tuomas Eerola & Petri Toiviainen, Department of Music,
%   ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
%   Copyright © 2004, University of Jyvaskyla, Finland
% ========== Initialization
p = structpars(tab);
a = agglom(tab);
d = dispers(tab);
% graphic limits
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
%========== Indexogram in stairs style
fh = figure(1);
gdd = stairs (jc, d, 'ro:',...
        'LineWidth', 1,...
        'Markersize', 3);
hold on
gda = stairs (jc, -a, 'bo-',...
            'LineWidth', .5,...
            'MarkerSize', 3,...
            'MarkerFaceColor',...
            'b');
xlabel('time points', 'Fontsize', 12)
ylabel('<-- agglom. / dispers. -->', 'Fontsize', 12)
axis([-1 pf+1 (-lm) lm]);
% legend('dispers', 'aglom',...
%         'Location', 'Best')
pan xon
zoom xon
hold off
% ========== Datatips  
dcm = datacursormode(fh);
datacursormode on
dcm.DisplayStyle = 'window';
set (dcm,'updatefcn',{@showinfo, a, d, tab})
end
%========== Generate Datatips
function showinfo = showinfo(~,event_obj, a, d, tab)
pos = get(event_obj,'Position');
tp = find(onset(tab) == pos(1));
ind = num2str(pos(2));
ag = num2str(a(tp));
dp = num2str(d(tp));
pt = tab(tp,2:end);
colsWithZeros = pt==0;
pt(colsWithZeros)=[];
part = sort(pt);
part = num2str(part);
beat = num2str(pos(1));
%part = num2str(ind2part(pos(1), pos(2)))
showinfo = {['p = ', part];...
            ['ad = (', dp, ', ', ag, ')'];...
            [['tp = ', beat]]};
end 
