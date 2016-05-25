%test side2side
clear;
n = 50;
dens = 1;
wiggle = 0.1;
ratio = 1; % length / width of shoal

figure(1)
set(1,'color',[0.9 0.9 0.9], 'position',[158 174 1024 662])

axis ([-20 20 -20 20])

shape = [dens ratio];
[C,V0,pick_side] = side2side_initialise(n,shape);
V = V0;
%these are the tails for the agents
uu = [C(1,:);C(1,:)-V(1,:);repmat(NaN,size(C(1,:)))];
vv = [C(2,:);C(2,:)-V(2,:);repmat(NaN,size(C(1,:)))];

%set up the initial plot
h1 = plot(C(1,:),C(2,:),'o','markersize',2,'markeredgecolor',[0 0 0.0],'markerfacecolor',[0 0 0.0],'visible','on'); %plots the dots
hold on
h2 = plot(uu(:),vv(:),'k','visible','on'); %plots the tails
%h3 = quiver(arrow(1),arrow(2),arrow(3),arrow(4),2,'r');  % this plots the arrow to point to a particular prey item, change the number before 'r' to adjust the length of the arrows
%set(h3,'linewidth',1.5,'visible','off') % sets the linewidth of the arrows
plot([-20 -20 20 20 -20],[-20 20 20 -20 -20],'r')
hold off
h = [h1 h2];
% axis ([-30 30 -30 30])
axis ([-20 20 -20 20])
axis square
axis on
box on
set(gca,'xtick',[],'ytick',[],'NextPlot','ReplaceChildren')

set(1,'NextPlot','ReplaceChildren','DoubleBuffer','on')


% MAKE THE BUTTON THAT WILL ALLOW US TO RECALL THIS FUNCTION
ax_pos = get(gca,'position'); % the location of the tadpole window in the figure
PB1 = uicontrol('style','pushbutton',...
                    'position',[10 10 100 100],...
                    'string','AGAIN',...
                    'callback','test_side2side_rect')

ct = 0;

tailNaN = repmat(NaN,size(C(1,:)));
while 1
    ct = ct + 1;
    [newC,newV] = side2side(C,V,V0,wiggle);
    
    C = newC;
    V = newV;
    
	%generate the tails in a vector
	uu = reshape([C(1,:);C(1,:)-V(1,:); tailNaN],1,size(C,2).*3);
	vv = reshape([C(2,:);C(2,:)-V(2,:); tailNaN],1,size(C,2).*3);

	set(h(1),'xdata',C(1,:),'ydata',C(2,:))
	set(h(2),'xdata',uu,'ydata',vv)
    
    drawnow
    
    if ct >10 & (all(abs(C(1,:))>21) | all(abs(C(2,:))>21)); break; end
end
