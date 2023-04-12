clear, close all;

n = 256;
% get 1D laplacian opeator with dirichlet boundary conditions
L = getLapMat(n, 1);
t = linspace(0,1,n);
% compute spectrum of laplacian operator
[U,S,V] = svd(full(L));
s = diag(S);
fprintf('smallest singular value %e\n', min(s));

% visulaize spectrum of laplacian operator
figure();
subplot(1,5,1), semilogy(t,s); title('singular values');
subplot(1,5,2), plot(t,U(:,128)); title('singular vector 128');
subplot(1,5,3), plot(t,U(:,225)); title('singular vector 225');
subplot(1,5,4), plot(t,U(:,250)); title('singular vector 250');
subplot(1,5,5), plot(t,U(:,256)); title('singular vector 256');


% check orthogonality
ntrials = 10;
k = randi([1 n], ntrials, 1);
j = randi([1 n], 1, 1);
uj = U(:,j);

for i = 1 : ntrials
    uk = U(:,k(i));
    fprintf('inner product %3d %3d: % .6e\n', j, k(i), uk'*uj);
    fprintf('inner product %3d %3d: % .6e\n', k(i), k(i), uk'*uk);
end


% symmetry error: <L*x, L*x> - <L*L*x,x>
x = rand([n,1]);
err = ((L*L*x)'*x - (L*x)'*(L*x)) / norm(L*x);
fprintf('error in symmetry: %e\n', err);




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
