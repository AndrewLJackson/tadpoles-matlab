function [arruu, arrvv, arrhu, arrhv] = newarrow2(x,y,u,v)

%ive stolen all this coded from quiver.m - AJ
% essentially it does the same but just doesnt plot the results
% this then gets passed out for replotting in the main code

% Arrow head parameters
alpha = 0.6;%0.33; % Size of arrow head relative to the length of the vector
beta = 0.5;  % Width of the base of the arrow head relative to the length

% Make velocity vectors
x = x(:).'; y = y(:).';
u = u(:).'; v = v(:).';
arruu = [x;x+u;repmat(NaN,size(u))];
arrvv = [y;y+v;repmat(NaN,size(u))];


% Make arrow heads and plot them
arrhu = [x+u-alpha*(u+beta*(v+eps));x+u; ...
    x+u-alpha*(u-beta*(v+eps));repmat(NaN,size(u))];
arrhv = [y+v-alpha*(v-beta*(u+eps));y+v; ...
    y+v-alpha*(v+beta*(u+eps));repmat(NaN,size(v))];