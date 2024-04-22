function partitiogram(tab)
% Description
%   The function partitiogram renders the graphic where the partitions of
%   the file are displaced in a phase space where the coordinates are the
%   agglomeration and dispersion indices.
% Input argument: 
%	tab (partition table)
% Output: 
%   partitiogram
% Example:
%   partitiogram(tab)
% Notes: 
%   The partitiogram is one of the main tools of Musical Partitional
%   Analysis. It represents the inventory of partitions of the MIDI file,
%   topologically displaced to show parsimonious relations and distances.
%   The background is filled with the lexset of the maximal density-number
%   of the instrumentation.
% Info:
%   Created in 2004, 2022, under MATLAB 6.0 (PC) and Mac Os 
%   The function partitiogram is part of PARSEMAT - Parseme Toolbox, 
%   Copyright© 2003, 2005, 2007, 2009, 2022 by Pauxy Gentil Nunes Filho
%   See License.txt
%========== Initialization
a = agglom(tab);
d = dispers(tab);
maxtot = max([a d]);
particoes = tab(:,2:end)';
    if size(particoes, 1)>1
        dnmax = max(sum(particoes));
    else
        dnmax = max(particoes);
    end
% defining parsemes
as = agglom(sumulapart(tab));
ds = dispers(sumulapart(tab));
st = sumulapart(tab);
ls = translatep(st(:,2:end));
% partitiogram
fh = figure(2);
set(fh,... 
    'Name','Partitiogram',...
    'NumberTitle','off',...
    'WindowStyle', 'normal',...
    'MenuBar', 'figure');
clf
hold on
grid on
axis([-1 maxtot+1 -1 maxtot+1]);
xlabel('agglomeration')
ylabel('dispersion')
axis square
box on
% ========== lines
plot (a,d,...
        '-bo',...
        'Color', [.8 .8 1],...
        'LineWidth',1.5,...
        'MarkerEdgeColor','auto',...
        'MarkerFaceColor','m',...
        'Markersize',8);
hold off
% ========== menus
menus = findobj(fh, 'Type', 'uimenu');
set(menus, 'Enable', 'on');
dcm = datacursormode(fh);
datacursormode on
dcm.DisplayStyle = 'window';
set(dcm, 'updatefcn', {@showinfo, as, ds, st})
end
% =========== function sumulapart
function sp = sumulapart(tab)
lp = listapart(tab);
lt = length(onset(lp));
jc = 1:lt;
sp = [jc' lp];
end
% ========== function listapart
function listapart = listapart(nm)
% Partitions found in note matrix - 
% for paradigmatic analysis
% listapart is part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, 2022, Pauxy Gentil Nunes Filho
% See License.txt
%========== Initialization
pl = (berry(nm))';
x = 1;
p = zeros(1, length(pl(1,:)));
    while x <= size(pl,1)
        pltemp = pl(x,:);
        i = find(ismember(p,pltemp,'rows'), 1);
        if isempty(i) == 1
            p = [p; pl(x,1:end)];
        end
        x = x + 1;
    end
p(1,:)=[];
listapart = p;
end
% ========== Info box
function showinfo = showinfo(~,event_obj, as, ds, st)
pos = get(event_obj,'Position');
inda = find(as == pos(1));
indd = find(ds == pos(2));
inds = intersect(inda,indd);
inds = inds(1);
inda = inda(1);
indd = indd(1);
part = st(inds, 2:end);
part(part==0) = [];
part = sort(part);
part = cell2mat(translatep(part));
ag = num2str(inda);
dp = num2str(indd);
showinfo = {['p = ', part];...
            ['ad = (', ag, ', ', dp, ')']};
end
