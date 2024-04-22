function tempartgram(tab)
% Description
%   The function tempartgram renders a graphic that where agglomeration
%   index, dispersion index and the temporal axis are plotted together. The
%   graphic is 3D and can be freely rotated.
% Input argument: 
%	tab (partition table)
% Output:
%   tempartgram
% Exemplo:
%     tempartgram(tab)
% Notes:
%   Tempartgram is a tool for Partitional Analysis. It presents the progression
%   of partitions by its position in the partitiogram as they evolve through
%   time. The tempartgram is a merging of indexogram and partitiogram data
%   in a 3D graph.
% Info:
%   Density-number is a Wallace Berry's concept (1976, cap. 2).
%   Created in 2004, january, under MATLAB 6.0 (PC)
%   © Part of PARSEMAT - Parseme Toolbox, 
%   Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
%   See License.txt
% ========== Initialization
a = aglom(tab);
d = dispers(tab);
maxtot = max([a d]);
jc = onset(tab);
% Particiogram
fh = figure(3);
set(fh,... 
    'Name','Temporal Partitiogram',...
    'NumberTitle','off',...
    'WindowStyle', 'normal',...
    'MenuBar', 'figure');
clf;
hold on
% ========== lines
plot3 (jc, -a, d,...     
    '-bo',...
    'LineWidth',1,...
    'MarkerEdgeColor','auto',...
    'MarkerFaceColor','r',...
    'Markersize',5);
% ========== stems
stem3 (jc, -a, d,...    
    '-m',...
    'LineWidth',1);
% ========== axis
axis([0 max(jc)+1 -maxtot-  1 0 0 maxtot+1]);
xlabel('timepoints')
ylabel('agglomeration')
zlabel ('dispersion')
box on
grid on
view(3)
% ========== Datatips
    dcm = datacursormode(fh);
    datacursormode on
    dcm.DisplayStyle = 'window';
    set (dcm,'updatefcn',{@showinfo, a, d, tab})           
hold off
% ========== menus
menus = findobj(fh, 'Type', 'uimenu');
set(menus, 'Enable', 'on');
end
function showinfo = showinfo(~,event_obj, a, d, tab)
    pos = get(event_obj,'Position');
    indt = find (tab(:,1) == pos(1));
    inda = a(indt);
    indd = d(indt);
    part = tab(indt, 2:end);
    part(part==0) = [];
    part = sort(part);
    part = cell2mat(translatep(part));
    ag = num2str(inda);
    dp = num2str(indd);
    tp = num2str(indt);
    showinfo = {['p = ', part];...
                ['ad = (', ag, ', ', dp, ')'];...
                ['tp = ', tp]};
end
