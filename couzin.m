function [newC,newV] = couzin(C,V,n,Rr,Ro,Ra,v,dtheta,sigma,aa)

%this function determines the new positions C and direction vectors V
%according to a 2-dimensional self organising model based on couzin et al.

persistent distmatrix x1 x2 y1 y2 Vx Vy fsh2fshTHETA Prefdir

[x1,x2]=meshgrid(C(1,:));[y1,y2]=meshgrid(C(2,:));
distmatrix = ((x2-x1).^2+(y2-y1).^2); %NB not acual distances as i havnt taken the SQRT for speed

%USE THE SCALAR PRODUCT TO GET THE ANGLE FROM ONE FISH TO ANOTHER
Vx=repmat(V(1,:),n,1);  Vy=repmat(V(2,:),n,1);

%--CHECK THIS LINE.. SOME FISH SEEM TO BE TURNING THROUGH 90 DEGREES IN ONE GO
fsh2fshTHETA = limit2pi(acos((Vx.*(x1-x2)+Vy.*(y1-y2))./distmatrix));

%find all fish not in the ith indivs blindspot
cansee = (fsh2fshTHETA<=pi-aa | fsh2fshTHETA >= pi+aa);

%find all the beasts within zor, zoo and zoa for each indiv
rdist = (distmatrix<=Rr & distmatrix~=0);
odist = (distmatrix<=Ro & distmatrix>Rr & distmatrix~=0);
adist = (distmatrix<=Ra & distmatrix>Ro & distmatrix~=0);

for i=1:n        
    %get the intersect of these two sets
    r = find((rdist(i,:)+cansee(i,:))==2);
    o = find((odist(i,:)+cansee(i,:))==2);
    a = find((adist(i,:)+cansee(i,:))==2);
    
    %Choose actual preferred direction from hierarchy zor, (zoo + zoa), zoo, zoa
    if ~isempty(r)
        Cr = zeros(2,length(r));
        Cr(1,:) = C(1,r)-C(1,i); Cr(2,:)=C(2,r)-C(2,i);
        Cr = unitvector(Cr);
        rPrefdir = -sum(Cr,2);
        Prefdir(:,i) = rPrefdir;
    elseif ~isempty(o) & isempty(a) & isempty(r)
        oPrefdir = sum(V(:,o),2);
        Prefdir(:,i) = oPrefdir;
    elseif ~isempty(a) & isempty(o) & isempty(r)
        Ca = zeros(2,length(a));   
        Ca(1,:) = C(1,a)-C(1,i); Ca(2,:)=C(2,a)-C(2,i);
        Ca = unitvector(Ca);
        aPrefdir = sum(Ca,2);
        Prefdir(:,i) = aPrefdir;
    elseif ~isempty(a) & ~isempty(o) & isempty(r)
        Ca = zeros(2,length(a));   
        Ca(1,:) = C(1,a)-C(1,i); Ca(2,:)=C(2,a)-C(2,i);
        Ca = unitvector(Ca);
        aPrefdir = sum(Ca,2);
        oPrefdir = sum(V(:,o),2);
        Prefdir(:,i) = (aPrefdir + oPrefdir)./2; 
    else 
        Prefdir(:,i) = V(:,i);
    end  
end       
Prefdir=unitvector(Prefdir);

%calculate the angles between the current and desired directions
cur2pref = acos( (Prefdir(1,:).*V(1,:)) + (Prefdir(2,:).*V(2,:)) ); 

%------------------------------------------------------------------------------------------------

%--CHECK THESE LINES.. SOME FISH SEEM TO BE TURNING THROUGH 90 DEGREES IN ONE GO

%NEW CODE TO TURN THE FISH TOWARDS ITS PREFERRED DIRECTION...
%calculates the vector to transform the current direction vector V to the preffered direction Prefdir
%and rescales it the appropriate length determined by the turning angle dtheta

fullturn = find(cur2pref<=dtheta); %those fish that can turn fully to the prefdir in one turn
partturn = find(cur2pref>dtheta);  %those fish that must turn by dtheta

alpha = (pi - cur2pref) ./ 2; %base angle of isosceles triangle with arms Prefdir and current direction V
beta = pi - dtheta - alpha + sigma.*randn(1,n); %--AJ-- ive added the variation in here as an error of estimation
b = sin(dtheta)./sin(beta); %length of the base made by the angle dtheta with the current movement vector V
VECTORcur2pref = repmat(b,2,1).*unitvector(Prefdir - V); %rescale the V->Prefdir vector

%update the movement vector V
newV(:,fullturn) = Prefdir(:,fullturn);
newV(:,partturn) = V(:,partturn) + VECTORcur2pref(:,partturn);
newV = unitvector(newV);

%update the vector positions by multiplying the movement unit vector by the speed
%newC = C + V.*(repmat(v,2,1));
newC(1,:) = C(1,:)+V(1,:).*v; 
newC(2,:) = C(2,:)+V(2,:).*v;
    