% wriggle by degrees
clear all
close all

wiggle = 0.05;

n = 50000;

V = [1;0];

theta = zeros(1,n);

for i = 1:n
    newV = unitvector(V + wiggle.*randn(2,1));
    theta(i) = atan2(newV(2),newV(1));
end

figure(1)
hist(theta,20)

mean(theta)
std(theta)

