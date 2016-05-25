%test side2side
clear;
n = 50;
dens = 1;
wiggle = 0.1;
ratio = 1; % length / width of shoal

C = zeros(2,n);
V = C;

figure(1)
set(1,'NextPlot','ReplaceChildren','color',[0.9 0.9 0.9],'position',...
    [1 31 1024 662], 'DoubleBuffer','on')
axis ([-20 20 -20 20])

shape = [dens ratio];
[C,V,state] = burst(C,V,'init');
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
axis ([-30 30 -30 30])
axis square
axis on
box on
set(gca,'xtick',[],'ytick',[])
set(1,'NextPlot','ReplaceChildren','color',[0.9 0.9 0.9],'position',...
    [1 31 1024 662], 'DoubleBuffer','on')

ct = 0;

tailNaN = repmat(NaN,size(C(1,:)));
while 1
    ct = ct + 1;
    [newC,newV,state] = burst(C,V,state);
    
    C = newC;
    V = newV;
    
	%generate the tails in a vector
	uu = reshape([C(1,:);C(1,:)-V(1,:); tailNaN],1,size(C,2).*3);
	vv = reshape([C(2,:);C(2,:)-V(2,:); tailNaN],1,size(C,2).*3);

	set(h(1),'xdata',C(1,:),'ydata',C(2,:))
	set(h(2),'xdata',uu,'ydata',vv)
    
    pause(0.02)
    drawnow
    
    if ct >10 & (all(abs(C(1,:))>21) | all(abs(C(2,:))>21)); break; end
    
    
end
