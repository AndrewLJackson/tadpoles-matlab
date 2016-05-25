function [GotOne] = testcheckclick_3; %changed 12/11/2004
%tests to see if a mouse click captures a prey
%also records the number of clicks made during a simulation
% this file is for use only when interested in whether the person clicked
% the focal prey - all other prey are ignored

global C xy GotOne clickcount t preypositionX preypositionY cursorposition focus_prey%these variables are global i.e. available to all functions in the workspace.
                                % t ADDED TO THIS LIST 12/11/2004
clickcount = clickcount + 1;
cp=get(gca,'CurrentPoint');
xy=cp(1,1:2);

preypositionX = [preypositionX; C(1,:)];
preypositionY = [preypositionY; C(2,:)];
cursorposition = [cursorposition; xy];

xprey = C(1,focusprey);
yprey = C(2,focusprey);

s = (sqrt((xprey - xy(1)).^2 + (yprey - xy(2)).^2)); % only worry about the focal prey item

if s <= 0.85 %was 0.4 changed 15/11/2004 19/11 changed from 0.6
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
        plot(C(1,nearest),C(2,nearest),'or','markersize',[5],'markerfacecolor','r','markeredgecolor','r')
        hold off
        drawnow
        pause(1)    %AJ - this pauses after a succesful hit
	else
        GotOne = 0;
	end
end