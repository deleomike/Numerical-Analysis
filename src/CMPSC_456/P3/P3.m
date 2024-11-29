%CMPSC456_P3

%image = rgb2gray(imread('AvColor.png'));


%I'm gonna do this later, but I gotta actually do the lab lol

% eigen = eig(A'*A);
% 
% eigenLength = size(eigen)
% eigenLength = eigenLength(1,1);
% 
% eigen = flip(eigen);
% 
% [V,D] = eig(A'*A);   %get right eigenvectors of A'* A
% V = flip(V')';
% [U,D] = eig(A*A');  %Get right eigenvectors of A * A'
% clear D
% %delete D, i dont want it
% 
% 
% %SETUP THE SIGMA MATRIX
% %I did the diagonal myself
% I = eye(eigenLength);
% Sigma = zeros(size(A));
% Sigma(1:eigenLength,1:eigenLength) = I*(eigen+zeros(eigenLength));
% 
% for i=1:1:eigenLength
%     for j=1:1:eigenLength
%         if (i~=j)
%             Sigma(i,j) = 0;
%         else
%             Sigma(i,j) = sqrt(Sigma(i,i));
%         end
%     end
% end
% %%%%%%%%%%
% 
% 
% AA = U*Sigma*V';
% imshow(uint8(AA));


%convert to grayscale and compress
image=imread('AvColor.png');
image=double(rgb2gray(image));

[U,S,V]=svd(image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = [2 12 22 52 112];

for i = 1:5
    N=n(i);

    figure(i);
    new_image=U(:,1:N)*S(1:N,1:N)*V(:,1:N)';

    imshow(uint8(new_image));
    str = sprintf('Figure %d with error: %f',i,S(N+1,N+1));
    title(str);

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%

%compress colored image
image=imread('AvColor.png');
r=double(image(:,:,1));
g=double(image(:,:,2));
b=double(image(:,:,3));

rimg=cat(3,r,zeros(size(r)),zeros(size(r)));
bimg=cat(3,b,zeros(size(b)),zeros(size(b)));
gimg=cat(3,g,zeros(size(g)),zeros(size(g)));

N=80;

%red svd and rank N approx
[Ur,Sr,Vr]=svd(r);
cr=Ur(:,1:N)*Sr(1:N,1:N)*Vr(:,1:N)';


%blue svd and rank N approx
[Ub,Sb,Vb]=svd(b);
cb=Ub(:,1:N)*Sb(1:N,1:N)*Vb(:,1:N)';

%green svd and rank N approx
[Ug,Sg,Vg]=svd(g);
cg=Ug(:,1:N)*Sg(1:N,1:N)*Vg(:,1:N)';

%put it back together
cimage=cat(3,cr,cg,cb);

imshow(uint8(cimage))
