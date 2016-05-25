function [newA]=unitvector(A)
%converts the set of vectors in A to unit vectors
% A =  [x1 x2 x3...
%       y1 y2 y3...
%       z1 z2 z3...]

n = size(A,1);

newA = A ./ repmat(sqrt(sum(A.^2)),n,1);

