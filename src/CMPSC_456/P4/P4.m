%%CMPSC456 P4

%%
%Form stochastic matrices AR and AN in R^(15,15)

TotalGamesPlayed = 142; %per team
N = 15; %Number of teams

%Build the National league table
AR = zeros(N);

AR(:,1) = [0;4;4;3;11;8;1;5;5;2;1;7;11;3;5];
AR(:,2) = [3;0;3;4;5;5;5;4;6;7;1;3;3;2;9];
AR(:,3) = [3;3;0;8;3;3;2;9;1;2;9;2;3;10;3];
AR(:,4) = [3;3;11;0;4;1;5;13;3;4;14;4;2;12;6];
AR(:,5) = [8;2;3;2;0;13;4;5;1;2;3;8;7;5;2];
AR(:,6) = [11;2;4;6;7;0;4;3;2;4;1;5;9;4;1];
AR(:,7) = [6;14;5;2;2;2;0;5;12;11;4;5;3;3;13];
AR(:,8) = [1;3;11;6;2;4;2;0;3;3;12;2;1;8;2];
AR(:,9) = [2;13;6;3;6;4;7;4;0;8;4;2;3;3;8];
AR(:,10) = [4;12;4;3;5;3;8;3;11;0;1;3;3;3;11];
AR(:,11) = [6;5;10;5;3;5;1;7;3;6;0;4;3;11;5];
AR(:,12) = [12;4;5;3;11;14;2;4;4;3;3;0;11;3;4];
AR(:,13) = [8;3;3;4;12;10;4;6;4;4;4;8;0;5;2];
AR(:,14) = [3;4;9;7;2;3;3;11;3;4;8;4;2;0;2];
AR(:,15) = [2;10;4;1;5;5;6;4;11;8;2;2;4;5;0];

%Build the american league table
AA = zeros(N);

AA(:,1) = [0;16;4;5;4;6;4;5;6;12;5;6;11;4;14];
AA(:,2) = [3;0;4;4;2;4;1;0;3;9;4;3;8;1;4];
AA(:,3) = [3;3;0;14;12;7;8;5;12;4;5;4;2;3;4];
AA(:,4) = [2;3;5;0;6;4;7;3;9;5;4;5;4;2;4];
AA(:,5) = [2;4;7;13;0;5;11;4;12;4;7;4;4;4;3];
AA(:,6) = [1;3;0;3;1;0;1;6;2;5;7;10;4;7;2];
AA(:,7) = [2;5;11;12;8;5;0;6;9;5;5;5;7;5;5];
AA(:,8) = [1;6;2;3;3;13;1;0;3;5;9;11;6;6;3];
AA(:,9) = [1;4;7;10;7;4;10;4;0;5;5;5;4;4;2];
AA(:,10) = [7;10;2;2;3;2;2;1;2;0;3;1;9;3;6];
AA(:,11) = [1;2;2;2;0;12;2;10;2;3;0;10;5;6;0];
AA(:,12) = [1;4;2;2;3;9;1;8;1;5;9;0;1;9;4];
AA(:,13) = [8;11;4;2;2;3;0;1;3;10;2;6;0;1;6];
AA(:,14) = [3;6;4;4;3;12;2;13;2;4;13;10;5;0;3];
AA(:,15) = [5;15;2;3;4;4;2;4;4;13;7;3;13;3;0];

%sum all the columns
for i=1:1:N
    sum(1,i) = 0;
    sum(2,i) = 0;
    for j=1:1:N
        sum(1,i) = sum(1,i) + AR(j,i);
        sum(2,i) = sum(2,i) + AA(j,i);
    end
end

%Make all columns add to 1
for i = 1:1:N
    stoc(1,i) = 0;
    stoc(2,i) = 0;
    AR(:,i) = AR(:,i) / sum(1,i);
    AA(:,i) = AA(:,i) / sum(2,i);
    for j=1:1:N
        stoc(1,i) = AR(j,i) + stoc(1,i);
        stoc(2,i) = AA(j,i) + stoc(2,i);
    end
end

%NOW DO POWER METHOD
TOL = 10^-3;
clear x;
x(:,1) = ones(1,N)*6;
x(:,2) = zeros(1,N);
lambda(i) = 0;

i = 1;
while(true)
    i = i+ 1;
    y = AR * x(:,i-1);
    x(:,i) = y/norm(y);

    if (norm(x(:,i)-x(:,i-1),inf) < TOL)
        break;
    end
end


lambda1 = x(:,i)' * AR * x(:,i);
sz = size(x);
sz = sz(1,2);
eigenvector = x(:,sz);
disp("The eigenvalue for the National League is: " + lambda1);
disp("The eigenvector for the National League is: ");
disp(eigenvector);
[prob, index] = max(eigenvector);

disp("The highest value, which is the most likely team to win. Is team # " + index + " with a value of " + prob);
disp("This team is the Milwaukee Brewers");


%NOW DO POWER METHOD
TOL = 10^-3;
clear x;
x(:,1) = ones(1,N)*6;
x(:,2) = zeros(1,N);

i = 1;
while(true)
    i = i+ 1;
    y = AA * x(:,i-1);
    x(:,i) = y/norm(y);
  
    if (norm(x(:,i)-x(:,i-1),inf) < TOL)
        break;
    end
end

lambda2 = x(:,i)' * AA * x(:,i);
sz = size(x);
sz = sz(1,2);
eigenvector = x(:,sz);
disp("The eigenvalue for the American League is: " + lambda1);
disp("The eigenvector for the American League is: ");
disp(eigenvector);
[prob, index] = max(eigenvector);

disp("The highest value, which is the most likely team to win. Is team # " + index + " with a value of " + prob);
disp("This team is the Houston Astros");

%%
%Part 2
%NOTE: index 1 is the off part of the board

N = 101

M = [1;1;1;1;1;1;]/6;
A = zeros(106);

%Make standard board probabilities without shoots and ladders
for i=1:1:100
    A(i+1:i+6,i) = M;
end

A = A(1:N+1,1:N);

%Now add those probabilities in

%Ladders
Swaps = [1 38;4 14; 9 31; 21 42; 36 44; 28 84; 51 67; 71 91; 80 100];
%Shoots
Swaps = [Swaps; 16 6; 49 11; 47 26; 62 19; 87 24; 64 60 ;92 73; 95 75; 98 78];
numSwaps = size(Swaps);
numSwaps = numSwaps(1,1);

for i=1:1:numSwaps
    trns = Swaps(i,1); %the number that will be taken from
    rcv = Swaps(i,2);
    
    %Collect rows to be swapped
    if (trns <= 6)
        %If the row is before row 7
        temp = A(trns+1,1:trns);
        A(trns+1,1:trns) = zeros(size(temp));
    else
        %otherwise
        temp = A(trns+1,trns-5:trns);
        A(trns+1,trns-5:trns) = zeros(size(temp));
    end

    %swap them
    rowLength = size(temp);
    rowLength = rowLength(1,2);
    for j=1:rowLength
        A(rcv+1,trns-rowLength+j) = temp(j) + A(rcv+1,trns-rowLength+j);
    end
end

%Do power method to find dominant eigenvector
TOL = 10^-3;
clear x;
x(:,1) = ones(1,N)*6;
x(:,2) = zeros(1,N);

i = 1;
while(true)
    i = i+ 1;
    y = A(1:102,:) * x(:,i-1);
    y = y(2:102);
    x(:,i) = y/norm(y);
  
    if (norm(x(:,i)-x(:,i-1),inf) < TOL)
        break;
    end
end

lambda2 = x(:,i)' * A(2:102,:) * x(:,i);
sz = size(x);
sz = sz(1,2);
eigenvector = x(:,sz);
disp("The eigenvalue for the board is: " + lambda1);
disp("The eigenvector for the board is: ");
disp(eigenvector);
[prob, index] = max(eigenvector);

disp("The highest value, which is the most likely space to land on. Is space # " + index + " with a value of " + prob);

