function [newC,newV,state] = burst(C,V,state)

%this function starts the agents either to the left, right, top or bottom of the screen and then moves them straight across the screen


persistent distmatrix x1 y1 x2 y2

axlims = axis;

n = size(C,2); %number of agents
v = 0.45;  %was 0.4 changed 15/11/2004      %speed of the agents.. this over-rides the speed definition in the main file %19/11 changed from 0.6

if strcmp(state, 'init') %initialise the location of the dots first time the funtion is called
    
    TH = (2.*pi.*rand(1,n)) -2;
    [X,Y] = pol2cart(TH,1.2); %value after TH determines the radius of the hoop for initial starting points of tadpoles 
    newC = [X;Y];
    newV = unitvector([X;Y]);
    state = '';
    
else %move the dots for subsequent calls of the function
    
%   i might want to introduce an avoidance rule later
%     [x1,x2]=meshgrid(C(1,:));[y1,y2]=meshgrid(C(2,:));
% 	distmatrix = ((x2-x1).^2+(y2-y1).^2);
%     rdist = (distmatrix<=1 & distmatrix~=0);
        
     
    newV = unitvector(V + 0.1.*randn(2,n)); 
	newC = C + newV.*v;
    
end
    
    
    
    
    
    
