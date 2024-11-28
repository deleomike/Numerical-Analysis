%Mike DeLeo
%Lab 1 Homework
%CMPSC 455
%Most of the explanations i had discussed with you were in class

%%
a=4/3;
b=a-1;
c=b+b+b;
eps0=1-c
%%
format long e
sum = 0;
for s = 1:1:7
    sum = 0;
    N = 10^s;
    for n = 1:1:N
        sum = sum + (1/n - (1/(n+1)));
    end
    sum1 = sum;
    sum = 0;
    for n = 1:1:N
        sum = sum + (1/((n+1)*n));
    end
    x = [sum sum1 abs(1 - sum) abs(1 - sum1)];
    disp(x);
end

%This shows that there are slight errors in the approximation of Epsilon
%the first column is the seperated sum approximation, the second column is
%the combined sum approximation, the last column is the absolute error of
%the two |sum - sum1|

%%
a = zeros(8,50);
for i = 1:1:8
    a(i,1) = 1/i;
end
b = [10 20 30 40 50];
for c = 1:1:5
    for N = 1:1:8
        for n = 2:1:b(c)
            a(N,n) = (N+1)*a(N,n-1)-1;
        end
    end
    disp(a);
end

%Here the error propogates quickly after a certain point. Things appear to
%go smoothly for a while, and then it shoots up
%%
%A

f(1)=1-1/eps;
%start from y0.
for n = 2:1:20
    %this is the constant before the integration
    
    %x = (-N+n)*(1^N*eps^-1) + (-N+n)*(0^N*eps^0);
    %this is the initial condition y0. This is the first ter
    f(n) = -1/eps + n*f(n-1);
    disp(f(n));
end

%What happens is that the value goes out of control, because the error is
%correlated by En = C^n *E0


%%
%B
clear f;
for i=1:1:6
    f(1,i) = 0;
end%initial values

%The order is reversed, so 1 is N, and the bottom is 1
b = [20 22 24 26 28 30];
for i = 1:1:6
    for n =2:1:b(i)
        %this is the constant before the integration
        f(n,i)= (f(n-1,i) + 1/eps)/n;
    end
end
disp(f);

%I observe that the accuracy is increased, and the error does not propogate
%as much as it did before.