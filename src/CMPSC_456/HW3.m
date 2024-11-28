%CMPSC456_Hw3
%Partial and complete pivoting

%%
n = 4;
A = [1.19 2.11 -100 1; 14.2 -0.122 12.2 -1; 0 100 -99.9 1; 15.3 0.11 -13.1 -1];
b = [1.12; 3.44; 2.15; 4.16];

multiplier = zeros(n,n);

NROW = 1:1:n;   %row pointer
X = 1:1:n;
X = X';

for i=1:1:(n-1)
    p = i;
    %A(NROW(p),i) = max(A,[
    %step 3
    %step 4
    if (A(NROW(p),i) == 0)
        disp("No Unique Solution exists");
        return;
    end
    
    if (NROW(p) ~= NROW(i))
        disp("Row Change");
        NCOPY = NROW(i);
        NROW(i) = NROW(p);
        NROW(p) = NCOPY;
    end
    
    for j=(i+1):1:n
        multiplier(NROW(j),i) = A(NROW(j),i) / A(NROW(i),i);
        A(NROW(j),:) = A(NROW(j),:) - multiplier(NROW(j),i) * A(NROW(i),:);
    end
end

if (A(NROW(n),n) == 0)
    disp("No Unique Solution Exists");
    return;
end

%Begin Back Substitution

X(n) = b(NROW(n)) / A(NROW(n),n);

for i= (n-1):-1:1
    sum = 0;
    for j=(i+1):1:n
        sum = A(NROW(i),j) * X(j) + sum;
    end
    X(i) = (b(NROW(i)) - sum)/(A(NROW(i),i));
    
end

disp(X);

%%
%Complete Pivoting
