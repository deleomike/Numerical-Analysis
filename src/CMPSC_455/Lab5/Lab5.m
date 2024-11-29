%%CMPSC 455 lab 5
%Q1

left_sum = zeros(10,1);
center_sum = zeros(10,1);
right_sum = zeros(10,1);

a = -1;
b = 1;

f = @(x) exp((-1/2)*x.^2);

A0 = (1/sqrt(2*pi))*integral(f,a,b);

for n=1:1:10
    h = 2^(-n+1);
    for i=0:1:(2^n-1)
        xi = a + h*i;   %x increment
        xi_1 = a + h*i + h; % next x increment
        left_sum(n) = left_sum(n) + f(xi);
        
        center_sum(n) = center_sum(n) + f((xi+xi_1)/2);
    end
    left_sum(n) = (h/(sqrt(2*pi))) * left_sum(n);
    center_sum(n) = (h/(sqrt(2*pi))) * center_sum(n);
    for i=1:1:(2^n)
        xi = a + h*i;
        right_sum(n) = right_sum(n) + f(xi);
    end
    right_sum(n) = (h/(sqrt(2*pi))) * right_sum(n);
end

sums = left_sum;
sums(1:10,2) = center_sum;
sums(1:10,3) = right_sum;
%TODO: fix error with the amount. approximate order

for i=1:1:3
    upper = sums(8,i)-sums(9,i);
    lower = sums(9,i) - sums(10,i);
    order(i) = log2(upper/lower);
end

txt=sprintf("Approximate the the Integral (1/sqrt(2*pi)) * Integral(exp((-1/2)*x^2)) from -1 to 1\nThe answer to this integral is %.8f",A0);
disp(txt)

txt = sprintf("METHOD         ORDER       APPROXIMATION (n=10)");
disp(txt)

txt = sprintf("Left Sum    %10.5f %11.5f\nCenter Sum     %5.5f %11.5f\nRight Sum      %5.5f %11.5f\n",order(1),left_sum(10),order(2),center_sum(10),order(3),right_sum(10));
disp(txt)

%%
%Q2

%Extrapolate center rule to the first order, and find the step size in it
%that gives the same error as M(2^-9). so same as n=10

center_sum(1,2)=0;
q=1/2;
for i=2:1:10
    center_sum(i,2)=(1/(1-(1/(q^(order(2))))))*(center_sum(i-1,1)-(q^(-order(2)))*center_sum(i));
end

txt = sprintf("Extrapolated Table\nh          M(h)       M1(h)");
disp(txt)

for i=1:1:10
    txt = sprintf("%.5f %10.5f %10.5f",2^(-i+1),center_sum(i,1),center_sum(i,2));
    disp(txt)
end

txt = sprintf("\nAs seen from the table, the extrapolated model of M(h) (The center sum model)\nmatches the model for step size 0.125");
disp(txt)

%%
%Q3

err = 10^-6;

%func = @(x) exp(-x);
%num = 5*(func(10) + func(0));

num = (f(1) + f(-1));

answer  = (1/(sqrt(2*pi)))*quad_rec(f,-1,1,err,num);

txt = sprintf("Value           Error\n");
disp(txt);
txt = sprintf("The value of thec center-rectangle rule applied with adaptive quadrature is %.7f\n                  Value           Error\nReal Answer: %15.8f\nLeft Rectangle: %12.8f %15.8f\nCenter Rectangle: %6.8f %15.8f\nRight Rectangle: %11.8f %15.8f\nExtrapolated CR: %11.8f %15.8f\nAdaptive Quad CR: %6.8f %15.8f\n",answer,A0,sums(10,1),abs(A0-sums(10,1)),sums(10,2),abs(A0-sums(10,2)),sums(10,3),abs(A0-sums(10,3)),center_sum(10,2),abs(A0-center_sum(10,2)),answer,abs(A0-answer));
disp(txt);

txt = sprintf("It is clearly shown that the lowest error, is that of the extrapolation for the center rectangle rule.\n");
disp(txt);

