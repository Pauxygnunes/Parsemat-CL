function indexogram(tab)
%     The function indexogram renders the graphic based on the indices of
%     agglomeration and dispersion, plotted against a median temporal axis.
% Input argument:
%	tab (partition table)
% Output:
%	indexogram
% Example:
%     indexogram(tab)
% Observations:
%   The agglomeration and dispersion indices are plotted around the median
%   temporal axis. Agglomeration index is plotted in the inferior part of
%   the graphic, for better comparison with the movements of the dispersion
%   line (Gentil-Nunes 2009).
% Info:
%     Created in 2004, january, under MATLAB 6.0 (PC)
%     © Part of PARSEMAT - Parseme Toolbox,
%     Copyright © 2003, 2005, 2007, 2009, 2022, Pauxy Gentil Nunes Filho
%     See License.txt
%     'Onset' is a function of MIDI Toolbox Software Package,
%     by Tuomas Eerola & Petri Toiviainen, Department of Music,
%     ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi
%     Copyright © 2004, University of Jyvaskyla, Finland
% ========== Initialization
a = agglom(tab);
d = dispers(tab);    
% graphic limits
in = ([a d]);
mx = max(in);
lm = mx*1.5;
if lm == 0; lm = 1; end
% graphic data
jc = onset(tab);
pf = max(onset(tab));
pt = structpars(tab);
ps = onset(pt);
% label data
ls = translatep (pt(:,2:end));
sz = length(ps);
lt = (ones(sz,1))*(((max(d))+lm)/2);  
%========== Indexogram
fh = figure(1);
set(fh,...
    'Name','Indexogram',...
    'NumberTitle','off',...
    'WindowStyle', 'normal',...
    'MenuBar', 'figure');
% Set BaseValue via argument
h = area(jc,d); 
set(h,'FaceColor',[.98 .98 .98],...
    'Linestyle', ':')
hold on
grid on
i = area(jc,-a);
% Set BaseValue via argument
set(i,'FaceColor',[.9 .9 .9],...
    'Linestyle', ':')
% myaa;
plot (jc, d,...
    '-bo',...
    'LineWidth',1,...
    'MarkerEdgeColor','auto',...
    'MarkerFaceColor','r',...
    'Markersize',3);
plot(jc, -a,...
    '-bo',...
    'LineWidth',1,...
    'MarkerEdgeColor','auto',...
    'MarkerFaceColor','r',...
    'Markersize',3);
xlabel('time points', 'Fontsize', 12)
ylabel('<-- agglom. / dispers. -->', 'Fontsize', 12)
axis([-1 pf+1 (-lm) lm]);
% Partitions as text in upper layer.
% (disabled after implementation of datatips)
%     eg = text (ps, lt, ls, ...
%         'Fontsize', 8,...
%         'BackgroundColor', 'w',...
%         'Fontweight', 'bold',...
%         'HorizontalAlignment', 'center',...
%         'Margin', 1);
pan xon
zoom xon
hold off
%========== Datatips
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
part = cell2mat(translatep(part));
beat = num2str(pos(1));
%part = num2str(ind2part(pos(1), pos(2)))
showinfo = {['p = ', part];...
            ['ad = (', dp, ', ', ag, ')'];...
            [['tp = ', beat]]};
end
