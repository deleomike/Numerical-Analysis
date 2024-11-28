function [eigenvector,eigenvalue] = invPowerMethod(A,x,coeff,TOL)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x(:,1) = x;
x(:,2) = x(:,1) - 1;

i = 1;
while(true)
    i = i + 1;
    x(:,i) = linsolve(A-coeff*eye(size(A)),x(:,i-1));
    x(:,i) = x(:,i)/norm(x(:,i));
    
    if (norm(x(:,i) - x(:,i-1),inf) < TOL)
        break;
    end
end

disp((i-1) + " Iterations Ran");

eigenvector = x(:,i);
eigenvalue = ((x(:,i))'*A*x(:,i))/(x(:,i)'*x(:,i));
end

