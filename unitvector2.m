function [newA]=unitvector2(A)
%converts the set of vectors in A to unit vectors
% A =  [x1 x2 x3...
%       y1 y2 y3...
%       z1 z2 z3...]

n = size(A,1);


% x = repmat(A(1,:),n,1);
% y = repmat(A(2,:),n,1);
% 
% if n == 3
% 	z = repmat(A(3,:),n,1);
% else
%     z = 0;
% end
% 
% newA = A ./ sqrt(x.^2 + y.^2 + z.^2);

newA = A ./ repmat( sqrt(sum(A.^2)) , n ,1 )