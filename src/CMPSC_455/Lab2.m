%CMPSC455 LAb 2
%For this lab, the root of x - e^(-x) = 0 is 
%%
%Q1A
%TODO
format long;
disp("Solving x - e^(-x) = 0 Over the interval 0 to 1");
disp("-----------------");
disp("Bisection Method:");

clear xn_1;
a = 0;
b = 1;

xn_1(1) = 1;
i = 2;
while (true)
    fa = a - exp(-a);
    fb = b - exp(-b);
    mid = (a + b) /2;
    fmid(i) = mid - exp(-mid);
    xn_1(i) = mid;
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    if (sign(fa) ~= sign(fmid(i)))
        b = mid;
    elseif(sign(fb) ~= sign(fmid(i)))
        a = mid;
    end
    i = i + 1;
end
sz = size(xn_1);
sz = sz(2);
txt = sprintf("Last Value of Iteration: %.12f\nSecond Last Value of Iteration %.12f\nDifference: %e\nIterations: %d",xn_1(sz),xn_1(sz-1),abs(xn_1(sz)-xn_1(sz-1)),sz);
disp (txt);
disp("-----------------");

%%
%Q1B

%sequence is x -e^(-x) = 0
%x(n+1) = e ^ (-xn);   %x(n+1) sequence

%decimal place (10^-10)

%basically stop when the current term equals the previous to the tenth
%decimal
clear xn_1;
xn_1(1) = 1;

i = 2;
while (true)
    xn_1(i) = exp(xn_1(i-1))/3;
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end

sz = size(xn_1);
sz = sz(2);
disp("Fixed Point Iteration:");
txt = sprintf("Last Value of Iteration: %.12f\nSecond Last Value of Iteration %.12f\nDifference: %e\nIterations: %d",xn_1(sz),xn_1(sz-1),abs(xn_1(sz)-xn_1(sz-1)),sz);
disp (txt);
disp("-----------------");

%%
%Q1C
%TODO

clear xn_1;
%steffensons method
xn_1(1) = 1;
i = 2;
while (true)
    p1 = exp(-xn_1(i-1));
    p2 = exp(-p1);
    xn_1(i)=p2-(p2-p1)^2/(p2-2*p1+xn_1(i-1));
    
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end

sz = size(xn_1);
sz = sz(2);
disp("Steffenson's Method:");
txt = sprintf("Last Value of Iteration: %.12f\nSecond Last Value of Iteration %.12f\nDifference: %e\nIterations: %d",xn_1(sz),xn_1(sz-1),abs(xn_1(sz)-xn_1(sz-1)),sz);
disp (txt);
disp("-----------------");

%%
%Q1D
%TODO

%function f(x) = 0
% f(x) = x - e ^ -x

%use newton's method
%xn_1 = xn - f(xn)/f'(xn)

clear xn_1;

xn_1(1) = 1;   %initial condition x0

i = 2;
while (true)
    temp = xn_1(i-1);
    xn_1(i) = temp - ((temp - exp(-temp))/(1 + exp(-temp)));
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end

tem = ['xn ' 'x(n+1)'];
temp= [xn_1(i-1) xn_1(i)];
disp("Newton's Method:");
txt = sprintf("Last Value of Iteration: %.12f\nSecond Last Value of Iteration %.12f\nDifference: %e\nIterations: %d",xn_1(i),xn_1(i-1),abs(xn_1(i)-xn_1(i-1)),i);
disp (txt);
disp("-----------------");

%%
%Q2

%Rank the order of convergences for the above four methods!


%A
clear xn_1;
a = 0;
b = 1;

xn_1(1) = 1;
i = 2;
while (true)
    fa = a - exp(-a);
    fb = b - exp(-b);
    mid = (a + b) /2;
    fmid(i) = mid - exp(-mid);
    xn_1(i) = mid;
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    if (sign(fa) ~= sign(fmid(i)))
        b = mid;
    elseif(sign(fb) ~= sign(fmid(i)))
        a = mid;
    end
    i = i + 1;
end

sz = size(xn_1);
%save bisection
seq(1:sz(2),1) = xn_1;

%B
clear xn_1;
xn_1(1) = 1;

i = 2;
while (true)
    xn_1(i) = exp(xn_1(i-1))/3;
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end

sz = size(xn_1);
%saves fixed point sequence
seq(1:sz(2),2) = xn_1;


clear xn_1;
%C
%steffensons method
xn_1(1) = 1;
i = 2;
while (true)
    p1 = exp(-xn_1(i-1));
    p2 = exp(-p1);
    xn_1(i)=p2-(p2-p1)^2/(p2-2*p1+xn_1(i-1));
    
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end

p1 = exp(-xn_1(i));
p2 = exp(-p1);
xn_1(i+1)=p2-(p2-p1)^2/(p2-2*p1+xn_1(i));

sz = size(xn_1);
%saves steffensons sequence
seq(1:sz(2),3) = xn_1;

clear xn_1;

xn_1(1) = 1;   %initial condition x0

i = 2;
while (true)
    temp = xn_1(i-1);
    xn_1(i) = temp - ((temp - exp(-temp))/(1 + exp(-temp)));
    if (floor(xn_1(i)*10^11) == floor(xn_1(i-1)*10^11))
        break;
    end
    i = i+ 1;
        
end
temp = xn_1(i);
xn_1(i+1) = temp - ((temp - exp(-temp))/(1 + exp(-temp)));
%do another for padding

sz = size(xn_1);
%saves newtons method sequence
seq(1:sz(2),4) = xn_1;

%%
%all sequences are now saved vertically in order
clear xn_1;
for i = 1:1:4
    xn_1 = seq(:,i);
    xn_1(xn_1==0)=[];
    xn_1 = xn_1';
    
    sz = size(xn_1);
    sz = sz(2);
    xn = xn_1(sz-1);
    x1_n = xn_1(sz-2);
    x2_n = xn_1(sz-3);
    xn_1 = xn_1(sz);
    upperTerm = log10(abs(xn_1 - xn)/abs(xn - x1_n));
    lowerTerm = log10(abs(xn - x1_n)/abs(x1_n - x2_n));
    
    alpha(i) = upperTerm/lowerTerm;
    
    lambda(i) = abs(xn_1 - xn)/(abs(xn - x1_n)^alpha(i));
end

disp("      Bisection Method | Fixed Point | Steffenson's | Newton's")
txt = sprintf("Lamda: %10.5f %15.5f %10.5f %15.e",lambda(1),lambda(2),lambda(3),lambda(4));
disp(txt);
txt = sprintf("Alpha: %10.5f %15.5f %10.5f %15.e",alpha(1),alpha(2),alpha(3),alpha(4));
disp(txt);
disp("NOTE: The values for steffensons were so close that they");
disp("were counted as 'exact' to mathematica...machine precision.");