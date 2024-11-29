%CMPSC456_P2

%%
%Problem 1 PART 1
n = 100;
b = zeros(1,n);
A = eye(n)*2;

%setup diagonals
diagonal = eye(n)*-1;
tp =diagonal(1:n-1,:);
diagonal(1,:)=b;
diagonal(2:n,:) =tp;
%

A = A + diagonal + diagonal';

%diagonals are setup now

%setup b matrix
h = 1/n;

x = h:h:1;

b = zeros(n,1);

f = @(x) cos(2*pi*x);

for i=1:1:n
    b(i,1) = (h^2)*f(x(i));
end

%now solve for u matrix
A = -A;
u = linsolve(A,b);
plot(x,u,'-o');

hold on

g = @(x) -cos(2*pi*x)/((2*pi)^2)+(1/((2*pi)^2))
fplot(g,'-x')
title('Problem 1: Part 1');
legend('Approximated Solution','Real Solution');
%%

%Problem 1 PART 2
n = 100;
b = zeros(1,n);
A = eye(n)*2;

%setup diagonals
diagonal = eye(n)*-1;
tp =diagonal(1:n-1,:);
diagonal(1,:)=b;
diagonal(2:n,:) =tp;
%

A = A + diagonal + diagonal';

A(1,1) = 1;
A(n,n) = 1;
%Apply the values from the boundary conditions

%diagonals are setup now

%setup b matrix
h = 1/n;

x = h:h:1;

b = zeros(n,1);

f = @(x) cos(2*pi*x);

for i=1:1:n
    b(i,1) = (h^2)*f(x(i));
end

%now solve for u matrix
A = -A;
u = linsolve(A,b);
figure(2)
plot(x,u,'-o');

hold on

figure(2)
g = @(x) -cos(2*pi*x)/((2*pi)^2)+(1/((2*pi)^2))
fplot(g)
title('Problem 1: Part 2');
legend('Approximated Solution','Real Solution');
%%
%Problem 2
N = 100;

b = zeros(N^2,1);    %setup b matrix

%A is an N^2xN^2 matrix
A = zeros(N^2);

%setup diagonals
diagonal = eye(N)*1;
tp =diagonal(1:N-1,:);
diagonal(1,:)=zeros(1,N);
diagonal(2:N,:) =tp;

Z = -4*eye(N)+ diagonal + diagonal';
%%%%%
I = eye(N);

h = 1/(N+1); %step size

x = h:h:1; %setup the x domain

f = @(x1,x2) cos(2*pi*x1)*sin(2*pi*x2);

for i=1:1:N
    for j=1:1:N
        b(N*(i-1)+j) = (h^2)*(f(x(j),x(i)));
    end
end

%%%%%%%%%
%%%%%%%%%
%Setup is now done
%Calculations:


for i=1:1:N
    Z_X = N*(i-1)+1; %Z starting x coordinate

    A(Z_X:Z_X+N-1,Z_X:Z_X+N-1) = Z;
    if (i < N)
        A((Z_X+N):2*N+Z_X-1,Z_X:Z_X+N-1) = I;
        A(Z_X:Z_X+N-1,(Z_X+N):2*N+Z_X-1) = I;
    end
end

u = linsolve(A,b);

U = zeros(N);
for i = 1:1:N
    U(1:N,i)= u(N*(i-1)+1:N*(i-1)+N);
end

figure(3)
surf(U);
title('Problem 2')