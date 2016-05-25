function GUIshoal2dv5_3

clear all
rand('state',sum(101*clock));randn('state',sum(101*clock));
warning off %i need to turn the warnings off because of the NaN = ./0 i get for the distance and angle calculations
%----------------------------------------------------------------------------------------------------
%constants... you can change these here
n = 1; %number of individuals in the shoal

%these are for the self organising version
Rr = 1 .^2;             %radius of zone of repulsion
Ro = 2 .^2;             %radius of zone of orientation
Ra = 15 .^2;             %radius of zone of attraction
aa = pi./4;                %half the blindspot in radians

v = 50 .*ones(1,n).*0.1;        %speed in units per 0.1sec (per iteration)
dtheta = pi./4 .*ones(1,n).*0.1;    %turning rate in radians per 0.1sec (per iteration)
sigma = 0.1; %sigma from the range 0->0.2 rad;

trials = 300;
%----------------------------------------
%prime the vectors
X=zeros(n,1); Y=zeros(n,1); Th=zeros(n,1); R=zeros(n,1); Prefdir=zeros(2,n); 

%--indivs are initially assigned so that they are all within the zoa of at least one other
for a = 2:n
    b = fix(rand.*(a-1)+1);
    translat = -[X(b),Y(b)];                        %translation vector to the origin for the bth point
    X = X + translat(1); Y = Y + translat(2);       %translate all points accordingly
    Th(a) = rand.*2.*pi;
    R(a) = (sqrt(Ra).*rand);
    [XX,YY] = pol2cart(Th(a),R(a));                 %convert  polar to cartesian points
    X(a) = XX; Y(a) = YY;
end
C = [X';Y']; %The position vectors

%----------------------------
%assign random initial direction vectors... this is over-ridden by the function burst.m called later
V=0;
while min(sum(V,1))==0 %this while loop prevents a zero movment vector from occurring
	dx = randn(1,n); dy = randn(1,n);
	V=[dx;dy]; %The movement vectors
	V=unitvector(V); %make them unit vectors
end

%-------------------------------------------------------------------------------------
figure(1)
clf
set(1,'NextPlot','ReplaceChildren','color',[0.9 0.9 0.9],'position',[1 31 1024 692])

%as = 20; %size of frame around centre of shoal

%these are the tails for the agents
uu = [C(1,:);C(1,:)-V(1,:);repmat(NaN,size(C(1,:)))];
vv = [C(2,:);C(2,:)-V(2,:);repmat(NaN,size(C(1,:)))];

%set up the initial plot
h1 = plot(C(1,:),C(2,:),'o','markersize',5,'markeredgecolor',[0 0 0.8],'markerfacecolor',[0 0 0.8],'visible','off'); %plots the dots
hold on
h2 = plot(uu(:),vv(:),'k','visible','off'); %plots the tails
hold off
h = [h1 h2];
axis ([-20 20 -20 20])
axis square
axis on
box on
set(gca,'xtick',[],'ytick',[])


%this is the push button on the bottom left of the screen
pb1 = uicontrol('Style', 'pushbutton', 'String', 'GO AGAIN',...
    'Position', [10 10 100 40],'units','pixels', 'Callback', 'GUIshoal2dv5_3');
pb2 = uicontrol('Style', 'pushbutton', 'String', 'STOP',...
    'Position', [10 60 100 40],'units','pixels', 'Callback', 'stop');

%-- this is the count down text
txtcntdwn = [];
txt1 = text(0,0,num2str(txtcntdwn));
for i = 2:-1:0 % this is the value you change to give a longer or shorter countdown
    pause(1)
    txtcntdwn = i;
    set(txt1,'string',[num2str(txtcntdwn)],'fontsize',[30],'fontweight','bold');
    %drawnow
end
set(txt1,'string',num2str([]));

%--record cursor position
xy = [0 0];
set(1,'Pointer','circle','DoubleBuffer','on','WindowButtonDownFcn','testcheckclick;')
global xy C GotOne clickcount trial trials%these variable are available to all functions in the workspace

%----
%make the dots and tails visible again
set(h1,'visible','on')
set(h2,'visible','on')

% The simulation as such Begins Here
tic;
trial = 1; GotOne = 0; clickcount=0;
state = 'init'; %use this to initiliase the movement rules in burst.m
while trial<=trials & GotOne==0 & min(max(abs(C)))<21;
    
    %the function that determines the movement rules can be changed
    
    %[newC,newV] = couzin(C,V,n,Rr,Ro,Ra,v,dtheta,sigma,aa); %this is the self organising animation
    
    [newC,newV,state] = burst(C,V,state); %this is the simple star-burst animation
    
    C = newC;
    V = newV;
        
    %--draw and cursor check
    xc=mean(C(1,:));
    yc=mean(C(2,:));
    
	%generate the tails in a vector
	uu = reshape([C(1,:);C(1,:)-V(1,:);repmat(NaN,size(C(1,:)))],1,size(C,2).*3);
	vv = reshape([C(2,:);C(2,:)-V(2,:);repmat(NaN,size(C(1,:)))],1,size(C,2).*3);

	set(h(1),'xdata',C(1,:),'ydata',C(2,:))
	set(h(2),'xdata',uu,'ydata',vv)
	
    %the axes have to be centred for the self org animation
    %axis([xc-as, xc+as, yc-as, yc+as]);
    %axis on
	
    %--------------------------------------------------------------
    %the animation can be paused here for a given duration of time
    %ideally we want a timer in here but i cant find one for this version of matlab
    %pause(0.02)
    elap_tim_2 = clock;
    if trial>1
        elap_tim_3 = etime(elap_tim_2, elap_tim_1);
        if elap_tim_3 > 0.05
            error('computer is too slow for this carry on')
        end
        pause(0.04-elap_tim_3)
	end
    %elap_tim_4 = timer('TimerFcn',@mycallback, 'Period', 10.0);
    
    elap_tim_1 = clock;
    drawnow
    
    %---------------------------------------------------------------
    
    %--update current cursor location
    cp = get(gca,'CurrentPoint');
    xy = cp(1,1:2);        

    trial = trial + 1;    
end

if GotOne == 0
	ht=text(0,0,({['\fontsize{36}You failed... utterly.']; ['you made ' num2str(clickcount) ' clicks']}),'color','r','horizontalalignment','center');
end

%--------------------------------------------------------------------


%this section will probably run as a sub-function at the end of the day
%but for now i call a very similar external function called testcheckclick.m
%
%
% function [GotOne] = checkclick;
% global C xy GotOne
% 
% cp=get(gca,'CurrentPoint');
% xy=cp(1,1:2);
% 
% xs = C(1,:) - xy(1);
% ys = C(2,:) - xy(2);
% 
% if ~isempty( find(round(xs.*10) == round(ys.*10)) )
%     GotOne = 1;
%     xt = mean(get(gca,'xlim'));
%     yt = mean(get(gca,'ylim'));
%     text(xt,yt,'\fontsize{36}WELL DONE YOU GOT ONE!','color','r','horizontalalignment','center')
% else
%     GotOne = 0;
% end



