function [eigenvector,eigenvalue] = powermethod(A,x,TOL)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x(:,1) = x;
x(:,2) = x(:,1) - 1;

i = 1;
while(true)
    i = i + 1;
    y = A*x(:,i-1);
    x(:,i) = y/norm(y);
    
    if (norm(x(:,i) - x(:,i-1),inf) < TOL)
        break;
    end
end
disp((i-1) + " Iterations Ran");
eigenvector = x(:,i);
eigenvalue = ((x(:,i))'*A*x(:,i))/(x(:,i)'*x(:,i));
return;

