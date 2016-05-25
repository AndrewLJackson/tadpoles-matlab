function [GotOne] = testcheckclick;
%tests to see if a mouse click captures a prey
%also records the number of clicks made during a simulation

global C xy GotOne clickcount  %these variables are global i.e. available to all functions in the workspace.
                                
clickcount = clickcount + 1;
cp=get(gca,'CurrentPoint');
xy=cp(1,1:2);

[s I] = sort(sqrt((C(1,:) - xy(1)).^2 + (C(2,:) - xy(2)).^2)); %distance from cursor click to all dots (nb not square rooted)

if s(1) <= 0.4
    nearest = I(1);
else
    nearest = [];
end
%nearest = find(s <= 0.4);

if GotOne == 0
	if ~isempty(nearest) %if the click was near enough to a dot
        GotOne = 1;
        xt = mean(get(gca,'xlim'));
        yt = mean(get(gca,'ylim'));
        t = toc;
        text(xt,yt,({['\fontsize{24}It took you ' num2str(t) ' seconds']; ['you made ' num2str(clickcount) ' clicks']}),'color','r','horizontalalignment','center')
        figure(1)
        hold on
        plot(C(1,nearest),C(2,nearest),'or','markersize',[5],'markerfacecolor','r','markeredgecolor','r')
        hold off
        drawnow
	else
        GotOne = 0;
	end
end