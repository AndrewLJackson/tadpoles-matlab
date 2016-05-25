function [GotOne] = testcheckclick_5; %changed 12/11/2004
%tests to see if a mouse click captures a prey
%also records the number of clicks made during a simulation

global C xy GotOne clickcount t preypositionX preypositionY cursorposition focus_prey%these variables are global i.e. available to all functions in the workspace.
                                % t ADDED TO THIS LIST 12/11/2004
clickcount = clickcount + 1;
cp=get(gca,'CurrentPoint');
xy=cp(1,1:2);

preypositionX = [preypositionX; C(1,:)];
preypositionY = [preypositionY; C(2,:)];
cursorposition = [cursorposition; xy];

[s] = (sqrt((C(1,focus_prey) - xy(1)).^2 + (C(2,focus_prey) - xy(2)).^2)); %distance from cursor click to all dots (nb not square rooted)

if s(1) <= 0.6 %was 0.4 changed 15/11/2004 19/11 changed from 0.6
    nearest = 1;
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
        text(xt,yt,({['\fontsize{36}Hit']}),'color','r','horizontalalignment','center') % [C(1,nearest),C(2,nearest)] gives the [x,y] coordinates of the prey item that was clicked. could write this to a file
        figure(1)
        hold on
        plot(C(1,focus_prey),C(2,focus_prey),'or','markersize',[5],'markerfacecolor','g','markeredgecolor','g')
        hold off
        drawnow
        pause(1)    %AJ - this pauses after a succesful hit
	else
        GotOne = 0;
	end
end