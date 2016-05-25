function [newC,newV] = side2side(C,V,V0,wiggle)
persistent r1 r2 r22
% This function simply moves the tadpoles by their defined movement vector V in the previous time-step.
% It also generates a new movement Vector V

v = 0.45;  %was 0.4 changed 15/11/2004      %speed of the agents.. this over-rides the speed definition in the main file %19/11 changed from 0.6

n = size(C,2);

r1 = 0.3; % determines probability of turning back towards original direction
r2 = rand(1,n)<r1;
r22 = [r2;r2];

%newV = unitvector(V + wiggle.*randn(2,n) + V0); 
newV = unitvector( ((V+V0).*r22) + (V + wiggle.*randn(2,n)).*(1-r22) );
newC = C + newV.*v;