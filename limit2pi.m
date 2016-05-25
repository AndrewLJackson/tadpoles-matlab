function [newA] = limit2pi(A)

t=floor(A./(2.*pi));
newA=A-(t.*2.*pi);