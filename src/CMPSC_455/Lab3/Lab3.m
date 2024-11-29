%%CMPSC 455
%Mike DeLeo
%Lab 3

%%
%Q1

x = [];

for i=1:1:31
    x(i,1) = -1+i/15; %x value
    x(i,2) = 1/(1+i*i); %f[x] value
end


%x(y axis, x axis)
count = 2; %keeps track of the offset
for i=3:1:33
    for k=count:1:31
        x(k,i) = (x(k,i-1) - x(k-1,i-1))/(x(k,1)-x(k-1,1));
    end
    count = count + 1;
end

disp (x)


%%
%Q2

k = 10; %degree 10
i = 10; %index of initial node to start at

P = @(X) x(i,1);
temp = 0;
temp_multi = @(X)1;
for m=1:1:k
    temp = x(i+m,1);
    %temp_mult = 0;
    for j=1:1:(m+1) %j is offset by 1
        temp_multi = @(X) temp_multi(X).*(X - x(i-1+j,1));
        disp(temp_multi);
    end
    P = @(X) P(X) + temp_multi(X).*temp;
end

P = @(X) P(X) + x(i,1);

fplot(@(X) P(X));

%%
for i =1:1:(n+1)
    z(2*i)=x(i);
    z(2*i+1)=x(i);
    Q(2i,1)
end
