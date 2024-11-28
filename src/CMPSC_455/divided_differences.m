%divided differences
%cmpsc 455

xin = -1
xfin = 1

%%Q1
f = @(x)(1/(1+x^2));

n = 30;

table = zeros(n+1,n+2);

for i=0:1:n
    table(i+1,1) = -1+ i/15;
    table(i+1,2) = f(table(i+1,1));
end

y = 29; %offset from the bottom
x = 3;
%(y coordinate, x coordinate)
%f'(2,3)
table(2,3) = (table(2,2) - table(1,2))/(table(2,1)-table(1,1));
%f'(3,3)
table(3,3) = (table(3,2) - table(2,2))/(table(3,1) - table(2,1));
%f'(4,3)
table(4,3) = (table(4,3) - table(3,3))/(table(4,1) - table(3,1));
%f''(3,4)
table(3,4) = (table(3,3) - table(2,3))/(table(3,1) - table(1,1));
%f''(4,4)
table(4,4) = (table(4,3) - table(3,3))/(table(4,1) - table(2,1));
%f''(5,4)
table(5,4) = (table(5,4) - table(4,3))/(table(5,1)-table(3,1));
disp(table(5,4))

for i=3:1:32
    for k=(i-1):1:31
        x0 = 2+ (k-i);
        %table(k,i)
        %table(k+1,i+1) = 1;
        disp([k i])
        table(k,i) = (table(k,i-1) - table(k-1,i-1))/(table(k,1)-table(x0,1));
    end
end

%%
clear P10

%%Q2A

a = 11;
b = 21;
%starting and ending node to interpolate
P10 = @(x) table(a,2);


for i=a:1:b
    mult = @(x)1;
    for k=(a+1):1:i
        mult = @(x) mult(x) * (x-table(k-1,1));
        fprintf("(x-%.3f)",table(k-1,1));
    end
    fprintf("\n");
    P10 = @(x) P10(x) + table(i,i-a+2).*mult(x);
    %clear mult;
end

fplot(@(x)P10(x),[xin,xfin]);
hold on

%%
%%Q2B

clear P20

a = 6;
b = 26;
%starting and ending node to interpolate
P20 = @(x) table(a,2);


for i=a:1:b
    mult1 = @(x)1;
    for k=(a+1):1:i
        mult1 = @(x) mult1(x) * (x-table(k,1));
    end
    P20 = @(x) P20(x) + table(i,i-a+2).*mult1(x);
    %clear mult;
end

fplot(@(x)P20(x),[xin,xfin]);

%%
%%Q2C

clear P30

a = 1;
b = 30;
%starting and ending node to interpolate
P30 = @(x) table(a,a+1);


for i=a:1:b
    mult3 = @(x)1;
    for k=(a+1):1:i
        mult3 = @(x) mult3(x) * (x-table(k,1));
    end
    P30 = @(x) P30(x) + table(i,i+1).*mult3(x);
    %clear mult;
end

fplot(@(x)P30(x),[xin,xfin]);

%%

fplot(@(x)f(x),[xin,xfin]);
title('Polynomials');
legend('P10(x)','P20(x)','P30(x)','F(x)')

hold off

txt = sprintf("Legend Description:\nP10(x): The degree 10 polynomial from nodes 10 to 20\nP20(x): The degree 20 polynomial from nodes 5 to 25\nP30(x): The degree 30 polynomial from nodes 0 to 30\nF(x): The original Polynomial 1/(1+x^2)");
disp(txt);

%%
%%Q2D

txt = sprintf("\n\nThe accuracy does not necessarily increase with the increase of the polynomial order.\nThis claim is based on the fact that P10(x) is closer to F(x) than P20(x) is.\n");
disp(txt)

xvalue = 0.2;  %x value for error bound
max_values = [0 0 0 0];

error_bound = [1 1 1; 1 1 1];
error_bound(1,1) = abs( f(xvalue) - P10(xvalue));
error_bound(2,1) = abs( f(xvalue) - P20(xvalue));
error_bound(3,1) = abs( f(xvalue) - P30(xvalue));
%setup the error

b = [21 26 30];
a = [11 6 1];
max = [1.9 1.692 1.5];

for i=1:1:3
    for k=a(i):1:b(i)
        error_bound(2,i) = error_bound(i,1)*(xvalue - table(k,k+1));
    end

    error_bound(2,i) = error_bound(i,1)/factorial(b(i) + 1);
    error_bound(2,i) = error_bound(i,1) * max(i);
    
end

txt = sprintf("         P10(x)        P20(x)         P30(x)\nError: %9.5f %13.5f %14.5f",error_bound(2,1),error_bound(2,2),error_bound(2,3));
disp(txt);


